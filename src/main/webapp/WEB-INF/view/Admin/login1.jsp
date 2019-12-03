<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>

<body>
    <input text="button" onclick="personMsg_pho()" />
    <img src="image/1.jpg" class="pexamine_cancel_review_imagePerson" alt="" />
    <script>
        function personMsg_pho() {
            var data = {
            }
            var senddata = JSON.stringify({

                funcid: "ftpDataService.dataList",
                data: data
            })

            $.ajax({
                type: "post",
                url: "http://localhost:8080/DataToOracle/entrance",
                async: true,
                data: { userId: 1 },
                datatype: 'json',
                success: function (resp) {
                    alert(resp);
                    var resp1 = JSON.parse(resp);
                    var j = resp1[0].NAME;
                    debugger;
                    console.log(j);
                    $(".pexamine_cancel_review_imagePerson").attr("src", "data:image/jpg;base64," + j);
                    //                 
                }

            });
        }
    </script>
</body>

</html>