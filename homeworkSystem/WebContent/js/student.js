window.onload= function () {

	var lineBGColor;

	$(".add-student").on("mouseover", ".student-line", function(){
		lineBGColor = $(this).css("background-color");
		mouseOverTR($(this));
	})

	$(".add-student").on("mouseout", ".student-line", function(){
		mouseOutTR($(this), lineBGColor);
	})

	$(".added-student").on("mouseover", ".student-line", function(){
		lineBGColor = $(this).css("background-color");
		mouseOverTR($(this));
	})

	$(".added-student").on("mouseout", ".student-line", function(){
		mouseOutTR($(this),lineBGColor);
	})

	$(".add-student").on("click", ".student-line", function(){
		var $this = $(this);
		addStudent($this);
	})

	$(".added-student").on("click", ".student-line", function(){
		var $this = $(this);
		removeStudent($this);
	})

	$("#add-all-stu").click(function(){
		var number = $(".add-student .inner-table tbody").children(".student-line").size();
		for(var i=0; i<number; i++){
			var $tr = $(".add-student .inner-table tbody").children(".student-line").eq(i);
			addStudent($tr);
		}
	})

	$("#remove-all-stu").click(function(){
		var number = $(".added-student .inner-table tbody").children(".student-line").size();
		for(var i=0; i<number; i++){
			var $tr = $(".added-student .inner-table tbody").children(".student-line").eq(i);
			removeStudent($tr);
		}
	})
}


function addStudent($this){
	var studentId = $this.children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var studentUserId = $this.children("td").eq(0).text();
		var studentName = $this.children("td").eq(1).text();
		
		if($this.children("td").eq(2).text() == "助教"){
			return;
		}
		$.post(
			"teacherAddStudent.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				$this.remove();
				var addStudnet = '<tr class="student-line"><input type="hidden" value="'
				+ studentId +'" class="hidden-id"><td class="s-t-id">' 
				+ studentUserId + '</td><td class="s-t-name">'
				+ studentName + '</td><td class="s-t-op"><img class="td-img" alt="remove" src="../../image/remove.png"></td></tr>';
				$(".added-student .inner-table tbody").prepend(addStudnet);
			})
}

function removeStudent($this){
	var studentId = $this.children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var studentUserId = $this.children("td").eq(0).text();
		var studentName = $this.children("td").eq(1).text();
		
		$.post(
			"teacherRemoveStudent.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				$this.remove();
				var addStudnet = '<tr class="student-line"><input type="hidden" value="'
				+ studentId +'" class="hidden-id"><td class="s-t-id">' 
				+ studentUserId + '</td><td class="s-t-name">'
				+ studentName + '</td><td class="s-t-op"><img class="td-img" alt="add" src="../../image/add.png"></td></tr>';
				$(".add-student .inner-table tbody").prepend(addStudnet);
			})
}


function mouseOverTR($this){
	$this.css("background", "#92CADC");
	$this.children().children("img").css("display", "inline-block");
}

function mouseOutTR($this, color){
	$this.css("background-color", color);
	$this.children().children("img").css("display", "none");
}