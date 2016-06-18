window.onload= function () {

    $(".add-teacher-line").on("click", ".add-teacher", function(){
        var teacherId = $(this).parent().children(".teacher-id").text();
        var courseId = $("#course-id").text();
        var $this = $(this);
        $.post(
            "addTeacher.action", 
            {teacherId : teacherId , courseId : courseId}, 
            function(){
                var moveA = "<a class='delete-td-a'>移除</a>";
                $this.children().remove();
                $this.append(moveA);
                $this.removeClass("add-teacher");
                $this.addClass("remove-teacher");
        })
    })

    $(".add-teacher-line").on("click", ".remove-teacher", function(){
        var teacherId = $(this).parent().children(".teacher-id").text();
        var courseId = $("#course-id").text();
        var $this = $(this);
        $.post(
            "removeTeacher.action", 
            {teacherId : teacherId , courseId : courseId}, 
            function(){
                var addA = "<a class='add-td-a'>添加</a>";
                $this.children().remove();
                $this.append(addA);
                $this.addClass("add-teacher");
                $this.removeClass("remove-teacher");
        })
    })

    $("#to-add-semester").click(function(){
    	var lastSemester = $("#semester-list").children().eq(0).text();
    	var newSemester = "";
    	if (lastSemester.indexOf("一") == -1) {	// 第二个学期
    		var begin = parseInt(lastSemester.substr(0,4));
    		var end = parseInt(lastSemester.substr(5,4));
    		newSemester = (begin+1).toString() + "-" + (end+1).toString() + "学年第一学期";
    	}
    	else{									// 第一个学期
    		newSemester = lastSemester.substr(0, 12) + "二学期"	;
    	}
    	$("#add-semester-div").css({"display":"block"});
        $("#add-semester-div").on("click", ".close-btn", function(){
            $("#add-semester-div").css({"display":"none"});
        })
        $("#new-semester-name").text(newSemester);
        $("#hidden-new-semester").val(newSemester);
    })

    $("#to-update-semester").click(function(){
        $("#update-semester-div").css({"display":"block"});
        $("#update-semester-div").on("click", ".close-btn", function(){
            $("#update-semester-div").css({"display":"none"});
        })
        var semesterName = $("#this-s-name").text();
        var begin = $("#this-s-begin").text();
        var end = $("#this-s-end").text();

        $("#update-semester-name").text(semesterName);
        $("#hidden-semester-name").val(semesterName);
        if (begin.indexOf("-") != -1) {                     // 日期格式是 yy-m-d
            var arr1 = begin.split("-");
            $("#begin-year").val("20" + arr1[0]);
            $("#begin-month").val(arr1[1]);
            $("#begin-day").val(arr1[2]);
            var arr2 = end.split("-");
            $("#end-year").val("20" + arr2[0]);
            $("#end-month").val(arr2[1]);
            $("#end-day").val(arr2[2]);
        }
        else{                                               // 日期格式是 d/m/yy的

        }
        // $("#begin-year").val()




    })
}