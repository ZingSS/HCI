window.onload = function(){

    $(".changable-td").on("click", "span", function(){
        if(!$(this).is(':has(img)')){
            return;
        }
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

        var studentId = $td.parent().children(".hidden-id").val();
        var homeworkId = $("#homework-id").val();

        $.post(
         "changeGrade.action",
         {studentId : studentId, homeworkId : homeworkId, grade : text}, 
         function(){
            setTimeout(showAutoSaving, 4000);
         })
    })

    $(".change-comment").on("blur", "input", function(){
        var text = $.trim($(this).val());
        var $td = $(this).parent();
        $(this).remove();
        var span = "<span>" + text + 
        " <img alt='编辑' src='../../image/edit.png'></span>";
        $td.append(span);

        var studentId = $td.parent().children(".hidden-id").val();
        var homeworkId = $("#homework-id").val();

        $.post(
         "changeComment.action",
         {studentId : studentId, homeworkId : homeworkId, comment: text}, 
         function(){
            setTimeout(showAutoSaving, 4000);
         })
    })

    $("#correct-save").click(function(){
        $("#auto-saving").text("保存成功");
    })

    
    $("#to-add-example").click(function(){
        $("#add-example-div").css({"display":"block"});
        $("#add-example-div").on("click", ".close-btn", function(){
            $("#add-example-div").css({"display":"none"});
        })
    })

    $("#send-save").click(function(){
        $(".loading-img").css({"display":"block"});
    })

}

function showAutoSaving(){
    var current = new Date();
    var hour = current.getHours();
    var minute = current.getMinutes();
    var second = current.getSeconds();
    $("#auto-saving").text("于 " + hour+":"+minute+":"+second + " 自动保存");
}