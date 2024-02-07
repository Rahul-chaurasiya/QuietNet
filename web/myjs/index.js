function doLike(pid, uid)
{
    console.log(pid + "," + uid)
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    }

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            
            if (Number(data.trim()) != 1) {
                console.log("value is true");
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            } else {
                console.log("it is not true");
            }

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data)
        }
    })
}

