window.onload= function () {
    $(".update-user").click(function(){
        $("#update-user-div").css({"display":"block"});
        $("#update-user-div").on("click", ".close-btn", function(){
            $("#update-user-div").css({"display":"none"});
        })
        var id = $(this).parent().children(".user-id").text();
        var userId = $(this).parent().children(".user-userid").text();
        var name = $(this).parent().children(".user-name").text();
        var password = $(this).parent().children(".user-password").text();

        $("#update-user-id").val(id);
        $("#update-userId").val(userId);
        $("#update-name").val(name);
        $("#update-password").val(password);
    })

    $(".delete-user").click(function(){
        $("#delete-user-div").css({"display":"block"});
        $("#delete-user-div").on("click", ".close-btn", function(){
            $("#delete-user-div").css({"display":"none"});
        })
        var id =  $(this).parent().children(".user-id").text();
        $("#delete-id").text(id);
    })

    $("#delete-confirm").click(function(){
        var id = $("#delete-id").text();
        $.post(
            "deleteUser.action",
            {id : id},
            function(){
                location.reload();
            }
        )
    })
    
    $("#add-user-btn").click(function(){
        $("#add-user-div").css({"display":"block"});
        $("#add-user-div").on("click", ".close-btn", function(){
            $("#add-user-div").css({"display":"none"});
        })
    })
    
}