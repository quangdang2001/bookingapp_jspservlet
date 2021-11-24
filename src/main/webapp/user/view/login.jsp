<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Travel Booking</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            rel="stylesheet"
    />
    <script src="https://code.iconify.design/2/2.0.4/iconify.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/user/styles/login.css"/> "/>
</head>
<body>
<c:if test="${action == 'register'}">
<div class="container right-panel-active" id="container">
</c:if>
<c:if test="${action != 'register'}">
<div class="container" id="container">
</c:if>
    <div class="form-container sign-up-container">
        <form action="${pageContext.request.contextPath}/register" method="post">
            <h1></h1>
            <div class="social-container">
                <a href="#" class="social"
                ><span class="iconify" data-icon="ei:sc-facebook"></span
                ></a>
                <a href="#" class="social"
                ><span
                        class="iconify"
                        data-icon="ant-design:google-plus-outlined"
                ></span
                ></a>
                <a href="#" class="social"
                ><span class="iconify" data-icon="ci:linkedin"></span
                ></a>
            </div>
            <span>${message}</span>
            <input type="hidden" name="action" value="verify">
            <input required name="firstName" type="text" placeholder="First name"/>
            <input required name="lastName" type="text" placeholder="Last name"/>
            <input required name="email" type="email" placeholder="Email"/>
            <input required name="password" type="password" placeholder="Password"/>
            <button>Đăng kí</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="hidden" name="action" value="login">
            <h1>Đăng nhập</h1>
            <div class="social-container">
                <a href="#" class="social"
                ><span class="iconify" data-icon="ei:sc-facebook"></span
                ></a>
                <a href="#" class="social"
                ><span
                        class="iconify"
                        data-icon="ant-design:google-plus-outlined"
                ></span
                ></a>
                <a href="#" class="social"
                ><span class="iconify" data-icon="ci:linkedin"></span
                ></a>
            </div>
            <span>${message}</span>
            <input name="email" required type="email" placeholder="Email"/>
            <input name="password" required type="password" placeholder="Mật khẩu"/>
            <a href="#">Quên mật khẩu?</a>
            <button>Đăng nhập</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay" style="background-image: url(<c:url value="/user/images/signup.jpg"/> );">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>
                    Để giữ kết nối với chúng tôi vui lòng điền thông tin cá nhân của
                    bạn
                </p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Chào mừng bạn đến với Travel Booking!</h1>
                <p>Hãy đăng kí để kết nối với chúng tôi</p>
                <button type="button" class="ghost" id="signUp">Đăng kí</button>
            </div>
        </div>
    </div>
</div>
<script>
    const signUpButton = document.getElementById("signUp");
    const signInButton = document.getElementById("signIn");
    const container = document.getElementById("container");

    signUpButton.addEventListener("click", () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
    });
</script>
</body>
<footer id="footer"></footer>
</html>
