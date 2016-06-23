window.onload = function(){

	$(".approval-result").on("click", "#pass-approval", function(){
		var homeworkId = $("#homework-id").val();
		var courseId = $("#courseId").val();
		$.post(
			"passApproval.action",
			{homeworkId : homeworkId, courseId : courseId},
			function(){
				$(".approval-result").children().remove();
				var publishExample = "<a class='a-btn-confirm'>上传样例</a>";
				$(".approval-result").append(publishExample);
			}
		)
	})

	$(".approval-result").on("click", "#failed-approval", function(){
		var homeworkId = $("#homework-id").val();
		var courseId = $("#courseId").val();
		$.post(
			"failedApproval.action",
			{homeworkId : homeworkId, courseId : courseId},
			function(){
				$(".approval-result").children().remove();
				var waitToApproval = "<a class='a-btn-forbid'>等待助教批改</a>";
				$(".approval-result").append(waitToApproval);
			}
		)
	})

	$("#to-add-example").click(function(){
		$("#add-example-div").css({"display":"block"});
        $("#add-example-div").on("click", ".close-btn", function(){
            $("#add-example-div").css({"display":"none"});
        })
	})
}