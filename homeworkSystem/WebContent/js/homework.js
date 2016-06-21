window.onload = function(){
	// $(".homework-line").on("click", ".download-homework", function(){
	// 	var studentId = $(this).parent().children(".hidden-id").val();
	// 	var homeworkId = $("#homework-id").text();
	// 	alert(studentId + "   " + homeworkId);
	// 	$.post(
	// 		"downloadHomework.action",
	// 		{studentId : studentId, homeworkId : homeworkId}, 
	// 		function(){
	// 			alert(">");
	// 		})
	// })

	// $("#to-add-homework").click(function(){
	// 	$("#add-homework-div").css({"display":"block"});
 //        $("#add-homework-div").on("click", ".close-btn", function(){
 //            $("#add-homework-div").css({"display":"none"});
 //        })
 //        $("#homework-course-name").text($("#course-name").text());
 //        $("#hidden-course-id").val($("#course-id").text());
	// })

	// $(".update-one-grade").click(function(){
 //        $("#update-grade-div").css({"display":"block"});
 //        $("#update-grade-div").on("click", ".close-btn", function(){
 //            $("#update-grade-div").css({"display":"none"});
 //        })
 //        var id = $(this).parent().children(".hidden-id").text();
 //        var userId = $(this).parent().children(".user-userId").text();
 //        var name = $(this).parent().children(".user-name").text();
 //        var grade = $(this).parent().children(".grade").text();
 //        var comment = $(this).parent().children(".comment").text();

 //        $("#grade-user-id").val(id);
 //        $("#student-userId").text(userId);
 //        $("#student-name").text(name);
	// 	$("#update-grade").val(grade);
 //        $("#update-comment").val(comment);

 //    })

    $(".changable-td").on("click", "span", function(){
        var text = $.trim($(this).text());
        var $td = $(this).parent();
        $(this).remove();
        var input = "<input type='text' value='" + text + "'/>";
        $td.append(input);
        $td.children("input").focus();
    })

    $(".change-grade").on("blur", "input", function(){
        var text = $.trim($(this).val());
        var $td = $(this).parent();
        $(this).remove();
        var span = "<span>" + text + 
        " <img alt='编辑' src='../../image/edit.png'></span>";
        $td.append(span);

        $.post(
         "changeGrade.action",
         {studentId : studentId, homeworkId : homeworkId}, 
         function(){
             alert(">");
         })
    })

    $(".change-comment").on("blur", "input", function(){
        var text = $.trim($(this).val());
        var $td = $(this).parent();
        $(this).remove();
        var span = "<span>" + text + 
        " <img alt='编辑' src='../../image/edit.png'></span>";
        $td.append(span);

        $.post(
         "changeComment.action",
         {studentId : studentId, homeworkId : homeworkId}, 
         function(){
             alert(">");
         })
    })

}