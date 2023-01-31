<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script>
    $(document).ready(function() {
        $('.btn_wrap').on("click", function () {
            fncSend();
        });
    });

    function fncKeyPresshandler(e) {
        if (event.keyCode == 13) {
            fncSend();
        }
    }

    function fncSend() {
        document.signinInfoForm.action="<c:url value='/adm/main/actionSecurityLogin.do'/>";
        document.signinInfoForm.submit();
    }

    <c:choose>
    <c:when test="${resultCode eq 'fail.common.locked'}">alert("비밀번호 5회 실패로 계정이 잠겼습니다. 관리자에게 잠금해제 요청하세요.");</c:when>
    <c:when test="${!empty resultCode}">alert("로그인 정보가 올바르지 않습니다.");</c:when>
    </c:choose>
    <%--<c:if test="${!empty resultCode}">alert("로그인 정보가 올바르지 않습니다.");</c:if>--%>

</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<section class="login">
    <div class="login_box">
        <form id="signinInfoForm" name="signinInfoForm" method="post">
            <dl>
                <dt>User ID</dt>
                <dd><input id="userId" name="userId" type="text" placeholder="User ID"></dd>
            </dl>
            <dl>
                <dt>Password</dt>
                <dd>
                    <input id="password" name="password" type="password" placeholder="Password" onkeypress="fncKeyPresshandler(event);">
                </dd>
            </dl>
            <!-- 			<div class="remember"> -->
            <!-- 				<div class="chk_box fr"> -->
            <!-- 					<input type="checkbox" name="checkbox" id="chk01"  value=""> -->
            <!-- 					<label for="chk01" class="label_nohide">Remember Me</label> -->
            <!-- 				</div> -->
            <!-- 			</div> -->
        </form>
        <div class="btn_wrap">
            <a href="#" class="btn basic red">로그인</a>
        </div>
        <p class="copyright">© Copyright 2018. All rights reserved.</p>
        <p class="copyright">© test3</p>
    </div>

</section>
</body>
</html>