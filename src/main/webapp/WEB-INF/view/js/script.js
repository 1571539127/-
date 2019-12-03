//评论区域
$(".comment-reply-link").click(function () {
  
    var authorName = $(this).parents('.comment-author').find("strong").text();
    $("#cancel-comment-reply-link").show();
    $("#reply-title-word").html("回复 " + authorName);
    var commentId = $(this).parents('.comment-body').attr("id").match(/\d+/g);
    $("input[name=commentPid]").attr("value", commentId);
    $("input[name=commentPname]").attr("value", authorName);
    $("#comment").attr("placeholder", "@ " + authorName)
})

$("#cancel-comment-reply-link").click(function () {
    $("#cancel-comment-reply-link").hide();
    $("input[name=commentPid]").attr("value", 0);
    $("input[name=commentPname]").attr("value", "");
    $("#reply-title-word").html("发表评论");
})

//ajax提交评论信息
$("#comment_form").submit(function () {
    $.ajax({
        type: "POST",
        url: '/submit/comment',
        contentType: "application/x-www-form-urlencoded",
        //  新增content-type头部属性
    // heads : {
    //     'content-type' : 'application/x-www-form-urlencoded'
    // },
        data: $("#comment_form").serialize(),
        success: function (data) {
        	debugger;
            location.reload();
            if (data.code == 0) {
                // layer.msg("评论成功！");
                // localStorage.setItem('author', $("#author_name").val());
                // localStorage.setItem('email', $("#author_email").val());
                // localStorage.setItem('url', $("#author_url").val());
                // window.setTimeout(window.location.reload, 2000);
                return false;
            } else {
                // layer.msg(data.msg);
            }

        },
        error: function () {
        }
    })
    return false;
})