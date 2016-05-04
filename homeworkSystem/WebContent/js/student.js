window.onload= function () {
	$(".student-line").on("click",".add-student-btn", function(){
		var studentId = $(this).parent().children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var $this = $(this);
		$.post(
			"teacherAddStudent.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				var moveA = "<a class='delete-td-a'>移除</a>";
				$this.children().remove();
				$this.append(moveA);
				$this.removeClass("add-student-btn");
				$this.addClass("remove-student-btn");
			}
			)
	})

	$(".student-line").on("click",".remove-student-btn", function(){
		var studentId = $(this).parent().children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var $this = $(this);
		$.post(
			"teacherRemoveStudent.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				var addA = "<a class='add-td-a'>添加</a>";
				$this.children().remove();
				$this.append(addA);
				$this.removeClass("remove-student-btn");
				$this.addClass("add-student-btn");
			}
			)
	})

	$(".student-line").on("click", ".add-assistant-btn", function(){
		var studentId = $(this).parent().children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var $this = $(this);
		$.post(
			"teacherAddAssistant.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				var moveA = "<a class='delete-td-a'>移除</a>";
                $this.children().remove();
                $this.append(moveA);
				$this.removeClass("add-assistant-btn");
				$this.addClass("remove-assistant-btn");
				
			}
			)
	})

	$(".student-line").on("click", ".remove-assistant-btn", function(){
		var studentId = $(this).parent().children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var $this = $(this);
		$.post(
			"teacherRemoveAssistant.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				var addA = "<a class='add-td-a'>添加</a>";
				$this.children().remove();
				$this.append(addA);
				$this.removeClass("remove-assistant-btn");
				$this.addClass("add-assistant-btn");
				
			}
			)
	})
}