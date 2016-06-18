window.onload= function () {
	$(".student-line").on("click",".add-student-btn", function(){
		var studentId = $(this).parent().children(".hidden-id").val();
		var courseId = $("#courseId").val();
		var $this = $(this);
		$.post(
			"teacherAddStudent.action", 
			{studentId : studentId, courseId : courseId}, 
			function(){
				$this.text("移除");
				$this.removeClass("add-student-btn");
				// $this.unbind("click");
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
				$this.text("添加");
				$this.removeClass("remove-student-btn");
				// $this.unbind("click");
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
				$this.text("删除");
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
				$this.text("添加");
				$this.removeClass("remove-assistant-btn");
				$this.addClass("add-assistant-btn");
				
			}
			)
	})
}