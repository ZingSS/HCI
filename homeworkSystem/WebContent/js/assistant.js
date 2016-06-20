window.onload= function () {

	var lineBGColor;

	$(".add-assistant").on("mouseover", ".student-line", function(){
		lineBGColor = $(this).css("background-color");
		mouseOverTR($(this));
	})

	$(".add-assistant").on("mouseout", ".student-line", function(){
		mouseOutTR($(this),lineBGColor);
	})

	$(".added-assistant").on("mouseover", ".student-line", function(){
		lineBGColor = $(this).css("background-color");
		mouseOverTR($(this));
	})

	$(".added-assistant").on("mouseout", ".student-line", function(){
		mouseOutTR($(this),lineBGColor);
	})

	$(".add-assistant").on("click", ".student-line", function(){
		var $this = $(this);
		addAssistant($this);
	})

	$(".added-assistant").on("click", ".student-line", function(){
		var $this = $(this);
		removeAssistant($this);
	})

	$("#add-all-assi").click(function(){
		var number = $(".add-assistant .inner-table").children(".student-line").size();
		for(var i=0; i<number; i++){
			var $tr = $(".add-assistant .inner-table").children(".student-line").eq(i);
			addAssistant($tr);
		}
	})

	$("#remove-all-assi").click(function(){
		var number = $(".added-assistant .inner-table tbody").children(".student-line").size();
		for(var i=0; i<number; i++){
			var $tr = $(".added-assistant .inner-table tbody").children(".student-line").eq(i);
			removeAssistant($tr);
		}
	})

}


function addAssistant($this){
	var studentId = $this.children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var studentUserId = $this.children("td").eq(0).text();
		var studentName = $this.children("td").eq(1).text();
		var text = $this.children("td").eq(2).text();
		if(text == "本课程助教" || text=="本课学生" || text=="别课程助教"){
			return;
		}
		$.post(
			"teacherAddAssistant.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				$this.remove();
				var addStudnet = '<tr class="student-line"><input type="hidden" value="'
				+ studentId +'" class="hidden-id"><td>' 
				+ studentUserId + '</td><td>'
				+ studentName + '</td><td><img class="td-img" alt="remove" src="../../image/remove.png"></td></tr>';
				$(".added-assistant .inner-table tbody").prepend(addStudnet);
			})
}

function removeAssistant($this){
	var studentId = $this.children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var studentUserId = $this.children("td").eq(0).text();
		var studentName = $this.children("td").eq(1).text();
		
		$.post(
			"teacherRemoveAssistant.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				$this.remove();
				var addStudnet = '<tr class="student-line"><input type="hidden" value="'
				+ studentId +'" class="hidden-id"><td>' 
				+ studentUserId + '</td><td>'
				+ studentName + '</td><td><img class="td-img" alt="add" src="../../image/add.png"></td></tr>';
				$(".add-assistant .inner-table tbody").prepend(addStudnet);
			})
}