<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

<div>
    <form>
        <p>input : <input type="text" id="inputText" name="message" required placeholder="place holder"></p>
        <input type="button" id="startBtn" value="요청시작">
        <input type="button" id="endBtn" value="종료">
        <input type="submit" value="데이터직렬화">
    </form>
    <hr>
    <textarea id="resultText"></textarea>
    <p id="resultP"></p>
</div>
<div id="div1">#div1</div>


<script>

    let count = 0;

    function displayCount() {
        count++;
        $("#resultText").prepend($("#inputText").val()+" " +count+"\n");
        //$("#resultP").append(count+"<br>");
    }

    $(function () {
        let timer;

        $("form").on("submit", function(event) {  // <form>요소에 "submit" 이벤트가 발생할 때,
            event.preventDefault();               // 서버로 전송하지 않음.
            $("#div1").html($(this).serialize()+"div1"); // fail 입력받은 데이터를 직렬화하여 나타냄.
            //$("#div1").text($(this).serialize()+"div1"); // success
            $("#resultText").html($(this).serialize()+"resultText");
            //$("#resultText").text($(this).serialize()+"resultText");
            $("#resultP").html($(this).serialize()+"resultP");
            //$("#resultP").text($(this).serialize()+"resultP");
            console.log(JSON.stringify(event));
            let response = fetch("/test4", {
                method: 'POST',
                headers: {'Content-Type': 'application/json;charset=utf-8'},
                body: JSON.stringify(event)
            });
            let resState = response.json;
            alert(resState.message);

            if(response.ok) {
                let json = response.json();
                console.log(response.body);
            } else {
                alert("HTTP Error : " + response.status);
            }

            $.ajax({
                type : "POST",
                url : "/test4", //요청 할 URL
                data : {"name" : "homes", "age" : "20"}, //넘길 파라미터 $("#inputText").val() //JSON.stringify({"idcheck": $(".userid").val()}),
                contentType: "application/json; charset=utf-8",
                dataType : "json",
                success : function(data) {
                    console.log("test4 success")
                    console.log(data);
                    // $("#div1 h2").text(data);
                },
                error : function(data) {
                    console.log("접속 도중 오류가 발생했습니다."); //에러시 실행 할 내용
                }
            })
            .done(function() {
                alert("요청 성공");
            })
            .fail(function() {
                alert("요청 실패");
            })
            .always(function() {
                alert("요청 완료");
            });
        });

        $("#startBtn").click(function(e){
            e.preventDefault();
            $("#resultP").text("시작");
            timer = setInterval("displayCount()", 1000);
        });

        $("#endBtn").on("click",function (){
            $("#resultP").text("종료");
            clearInterval(timer);
            count = 0;
        });





        // $("button").click(function(){
        //     $("#div1").load("http://localhost:8002", function(responseTxt, statusTxt, xhr){
        //         if(statusTxt == "success")
        //             alert("External content loaded successfully!");
        //         if(statusTxt == "error")
        //             alert("Error: " + xhr.status + ": " + xhr.statusText);
        //     });
        // });
    });
</script>

</body>
</html>