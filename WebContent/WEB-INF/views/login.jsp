<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE HTML>
<html dir="ltr" lang="en-US">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		<title>Login</title>
	
		<!--- CSS --->
		<link rel="stylesheet" href="/closerby/css/login.css" type="text/css" />
		<link rel="stylesheet" href="/closerby/css/home.css" type="text/css" />
		<link rel="stylesheet" href="/closerby/css/style.css" type="text/css" />
		<link rel="stylesheet" href="/closerby/css/header.css" type="text/css" />
		
		<script type="text/javascript" src="/closerby/js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="/closerby/js/jquery.validate.js"></script>
	
		<!--- Javascript libraries (jQuery and Selectivizr) used for the custom checkbox --->
	
		<!--[if (gte IE 6)&(lte IE 8)]>
			<script type="text/javascript" src="/closerby/js/selectivizr.js"></script>
			<noscript><link rel="stylesheet" href="/closerby/css/fallback.css" /></noscript>
		<![endif]-->
		
		<script>
		$().ready(function() {
			// validate signup form on keyup and submit
			$("#loginForm").validate({
				rules: {
					j_username: "required",
					j_password: "required"
				},
				messages: {
					j_username: "Username cannot be empty.",
					j_password: "Password cannot be empty."
					
				}
			});

			if(getCookie("remember-me") == 'true'){
				$("#remember-me").prop('checked', true);
				$("#j_username").val(getCookie("j_username"));
				$("#j_password").val(getCookie("j_password"));
			}
		});
		var exdays = 365;
		
		function setCookie(cname, cvalue) {
		    var d = new Date();
		    d.setTime(d.getTime() + (exdays*24*60*60*1000));
		    var expires = "expires="+d.toGMTString();
		    document.cookie = cname + "=" + cvalue + "; " + expires;
		}

		function getCookie(cname) {
		    var name = cname + "=";
		    var ca = document.cookie.split(';');
		    for(var i=0; i<ca.length; i++) {
		        var c = ca[i].trim();
		        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
		    }
		    return "";
		}

		function checkCookie() {
		    var user = getCookie("username");
		    if (user != "") {
		        alert("Welcome again " + user);
		    } else {
		        user = prompt("Please enter your name:", "");
		        if (user != "" && user != null) {
		            setCookie("username", user, 365);
		        }
		    }
		}

		function processFormData(){
			var remember = $("#remember-me").is(':checked');
			setCookie("remember-me", remember);
			if(remember === true){
				setCookie("j_username", $("#j_username").val());
				setCookie("j_password", $("#j_password").val());
			}
		}
		</script>
		<style>
			#loginForm label.error {
				font-family: verdana, helvetica, arial, sans-serif;
				font-weight: normal;
				font-size: 12px;
				color: red;
				margin-left: 1px;
				padding-top: 12px;
				width: auto;
				display: block;
			}
		</style>
	</head>

	<body>
		<div style='margin:0px;position: absolute;top:20px;left:10px;'>
			<img style='width:70px;height:50px;vertical-align:top' src="/closerby/images/cart.png"/><span style='display:inline-block;font-family: Papyrus, fantasy;font-size:40px;font-weight:bold;'>Closer By</span>
		</div>

		
		<div id="container">
			<c:url value="/j_spring_security_check" var="url" />
			<form id='loginForm' method='POST' action="${url}" onSubmit='processFormData();'>
				<div class="login">LOGIN</div>
				<div class="username-text">Username:</div>
				<div class="password-text">Password:</div>
				<div class="username-field">
					<input id="j_username" type="text" name="j_username" value="" />
				</div>
				<div class="password-field">
					<input type="password" id="j_password" name="j_password" value="" />
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">Remember me</label>
				<div class="forgot-usr-pwd">Forgot <a href="#">username</a> or <a href="#">password</a>?</div>
				<input type="submit" name="submit" value="GO" />
			</form>
			<BR/>
			<p style='text-align:right;position:relative;left:-125px;top:-5px;'></span><a href="signup.shx">Signup</a></p>
			<c:if test="${not empty error}">  
				<div class="errorblock">  
				   Your login attempt was not successful, try again.  
				   Caused :  
				   ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}  
			  	</div>  
			 </c:if>  
		</div>
	</body>
</html>
