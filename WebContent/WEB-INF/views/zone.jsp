<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- Start  HEAD section -->
<meta charset="utf-8">
<title>Online Shopping Cart</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/slider.style.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/customer.css" />
<link href="${pageContext.request.contextPath}/css/themes/cupertino/jquery-ui.min.css"	rel="stylesheet">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/NewFile.css" />
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/wowslider.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/script.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/customer.js"></script>

<!-- End  HEAD section -->
<style>
body {
	background: url(images/customer/fruits2.jpg);
	background-position: top, bottom;
	background-attachment: fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	background-repeat: no-repeat;
}
input,button,select{
	border-radius:8px;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	padding:5px;
}

.uiv2-form {
    margin-top: 20px;
    font: 400 14px/14px 'lato',sans-serif;
}

.uiv2-form fieldset {
    border: 1px solid #D6D6D6;
    padding: 0 0 30px 0;
    margin-bottom: 5px;
}

.uiv2-form .uiv2-row-border {
    border-top: 1px solid #D6D6D6;
    margin-top: 10px;
    width: 100%;
    clear: both;
    display: block;
}

.uiv2-form .uiv2-help-text {
    font-size: 12px !important;
    line-height: 18px;
    display: block;
}

.uiv2-form .uiv2-input-prepend {
    background: none repeat scroll 0 0 #EEEEEE;
    border: 1px solid #EEEEEE;
    border-radius: 3px 0 0 3px;
    color: #58595B;
    display: inline;
    float: left;
    font: 300 12px/25px 'Roboto Slab',serif;
    height: 26px;
    padding: 1px 5px 0;
    margin-top: 8px;
    margin-right: 0;
}

.uiv2-form span.uiv2-input-with-prepend input[type=text],
    .uiv2-form span.uiv2-input-with-prepend input[type=password]
    .uiv2-form span.uiv2-input-with-prepend input[type=email] {
    border-radius: 0 4px 4px 0;
    width: 169px;
}

.uiv2-form .uiv2-err-text {
    color: #FF0000;
}

.uiv2-form .legend {
    padding: 10px 0 10px 20px;
    border-bottom: 1px solid #F1F1F1;
    font: 300 18px/24px 'Roboto Slab',serif;
    color: #58595B;
    margin: 0;
    background: #FFF;
    background: -moz-linear-gradient(top, #f0f0f0 0%, #ffffff 60%, #ffffff 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f0f0f0), color-stop(60%, #ffffff), color-stop(100%, #ffffff));
    background: -webkit-linear-gradient(top, #f0f0f0 0%, #ffffff 60%, #ffffff 100%);
    background: -o-linear-gradient(top, #f0f0f0 0%, #ffffff 60%, #ffffff 100%);
    background: -ms-linear-gradient(top, #f0f0f0 0%, #ffffff 60%, #ffffff 100%);
    background: linear-gradient(to bottom, #f0f0f0 0%, #ffffff 60%, #ffffff 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FCFCFC', endColorstr='#ffffff', GradientType=0);
}

.uiv2-form-row {
    display: block;
    clear: both;
    margin: 5px 30px;
    color: #58595B;
}

.uiv2-form-label {
    float: left;
    width: 19%;
    margin: 12px 15px 3px 30px;
    text-align: right;
}

.uiv2-form-row input[type=text], .uiv2-form-row input[type=email],
    .uiv2-form-row textarea, .uiv2-form-row input[type=password] {
    border-radius: 4px;
    color: #6D6E71;
    padding: 0 4px;
}

.uiv2-form-row textarea {
    width: 350px;
    margin: 10px;
    padding: 5px;
    border: 1px solid #E0E0E0;
}

.uiv2-form input[type=submit].uiv2-large-btn, .uiv2-form input[type=button].uiv2-large-btn {
    height: 40px;
    border: medium none;
    width: 150px;
    cursor: pointer;
}

.uiv2-form input[type=submit].uiv2-btn-default-small {
    width: auto;
    height: 30px;
}

.uiv2-form .uiv2-form-input select {
    margin-top: 6px;
    padding: 5px;
}

.uiv2-form-input {
    float: left;
}

.uiv2-form-button-wrapper {
    margin: 8px 5px;
    clear: both;
}

.uiv2-form .uiv2-field-required, .uiv2-form .uiv2-help-text {
    margin-left: 2px;
}

.uiv2-form .uiv2-captcha-container {
    margin-left: 0;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-input, .uiv2-form .uiv2-captcha-container .uiv2-form-input span {
    float: none;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-row {
    margin-left: 0;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-label {
    margin-left: 0;
    text-align: left;
    margin-top: 9px;
    float: none;
}

.uiv2-form .uiv2-captcha-container .captcha {
    margin-top: 14px;
    height: 30px;
    margin-left: 20px;
}

.uiv2-form .uiv2-terms {
    font: 300 14px/20px 'Roboto Slab', serif;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-input span {
    position: relative;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-input img {
    border: 1px solid #dbdbdb !important;
    padding: 8px;
}

.uiv2-form .uiv2-captcha-container .uiv2-form-input input[type=text] {
    position: absolute;
    margin-left: 20px;
    top: -33px;
}

</style>
</head>
<body >
	<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
	<form:form method="get" action="get_categories.shx"
		modelAttribute="shoppingCart">
		<div id="main_container">
			<div id="main_content">
				<div class="left_content "><div id="loading"></div></div>
				<div class="center_content">
					<!-- Start  BODY section -->
					<div id="body">
						<div id="wowslider-container1">
							<div class="ws_images">
								<ul>
									<li><img src="${pageContext.request.contextPath}/images/customer/blue.jpg" alt="blue"
										title="Gift and Toy Shops" id="wows1_0" /></li>
									<li><img src="${pageContext.request.contextPath}/images/customer/purple.jpg" alt="purple"
										title="Pharma" id="wows1_1" /></li>
									<li><img src="${pageContext.request.contextPath}/images/customer/red.jpg" alt="red"
										title="Grocery" id="wows1_2" /></li>
								</ul>
							</div>
							<div class="ws_bullets">
								<div>
									<a href="#" title="blue"><img
										src="${pageContext.request.contextPath}/images/customer/blue-tooltip.jpg" alt="blue" />1</a> <a
										href="#" title="purple"><img
										src="${pageContext.request.contextPath}/images/customer/purple-tooltip.jpg" alt="purple" />2</a> <a
										href="#" title="red"><img
										src="${pageContext.request.contextPath}/images/customer/red-tooltip.jpg" alt="red" />3</a>
								</div>
							</div>
							<span class="wsl">&nbsp;</span>
							<div class="ws_shadow"></div>
						</div>
						<div
							style='float:center;margin-top: 10px; margin-bottom: 10px; text-align: center;'>
							<h2 style="color: white; text-align: center;">We deliver
								groceries in one hour from Whole Foods Market, Pharma, Gifts,
								Toys and more</h2>
							
							<p class='message' id="message"></p>
							<div style="float: center; width: 100%; margin-top: 100px;">
								<table style="text-align: center;">
									<tr>
										<td><form:input class="search_input" id="tag" path="zone" placeholder='	Enter your area' style='width: 200px;height:37px; margin: 0 0 5px 0;' /></td>
										<td><input type="submit" class='btn btn-warning btn-large' id='go' value='GET STARTED'/></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="right_content">
					<div id="logarea" style="text-align: right;">
									<input type="button" class='btn btn-warning btn-large' id='signIn' value='Sign In'/>
									<input type="button" class='btn btn-warning btn-large' id='signUp' value='Sign up'/>
					</div>
				</div>
				<!-- end of main content -->
				<div class="footer">
					<div class="left_footer"></div>
					<div class="center_footer">
						OnlineShopingCart. All Rights Reserved 2014<br />
					</div>
					<div class="right_footer">
						<a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a>
						<a href="#">rss</a> <a href="contact.html">contact us</a>
					</div>
				</div>
			</div>

		</div>
		<!-- Start Login Dialogue -->
		 <div id="login-dialog-form" title="Login">
				<table>
					<tr>
						<td>Username:</td>
						<td><input id="j_username" type="text" name="j_username" value="" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" id="j_password" name="j_password" value="" /></td>
					</tr>
				</table>
		</div>
		<div id="signUp-dialog-form" title="Login">
			<form method="POST" action="" class="uiv2-form" id="id_register_form">
			<fieldset class="border" style="margin:3px;padding:2px;">
			<div class="legend">Login Details</div>
			<div class="uiv2-form-row">
				<span class="uiv2-form-label">Email Address</span>
				<div class="uiv2-form-input">
					<span><input id="id_email" type="email" name="email" size="20" /></span>
					<span class="uiv2-field-required">*</span>
				</div>
			</div>
			<div class="uiv2-form-row">
				<span class="uiv2-form-label">Mobile Number</span>
				<div class="uiv2-form-input">
					<span class="uiv2-input-prepend">+91</span>
					<span class="uiv2-input-with-prepend">
						<input name="mobile_no" maxlength="10" type="text" id="id_mobile_no" size="15" />
					</span>
					<span class="uiv2-field-required">*</span>
				</div>
			</div>
			<div class="uiv2-form-row">
				<span class="uiv2-form-label">User Id</span>
				<div class="uiv2-form-input">
					<span>
						<input id="id_userid" maxlength="30" type="text" name="userid" size="20" />
					</span>
					<span class="uiv2-field-required">*</span>
				</div>
			</div>
			<div class="uiv2-form-row">
				<span class="uiv2-form-label">Password</span>
				<div class="uiv2-form-input">
					<span>
						<input id="id_password1" maxlength="30" type="password" name="password1" size="20" />
					</span>
					<span class="uiv2-field-required">*</span>
					<div class="uiv2-help-text">Minimum 6 Characters</div>
				</div>
			</div>
			<div class="uiv2-form-row">
				<span class="uiv2-form-label">Confirm Password</span>
				<div class="uiv2-form-input">
					<span><input id="id_password2" maxlength="30" type="password" name="password2" size="20" /></span>
					<span class="uiv2-field-required">*</span>
				</div>
			</div>
		</fieldset>
		<fieldset class="border" style="margin:3px;padding:2px;">
				<div class="legend">Personal Details</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Salutation</span>
					<div class="uiv2-form-input">
						<span class="uiv2-mar-t-8">
							<select name="salutation" id="id_salutation">
								<option value="" selected="selected">Select</option>
								<option value="Mr.">Mr.</option>
								<option value="Mrs.">Mrs.</option>
								<option value="Ms.">Ms.</option>
							</select>
						</span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">First Name</span>
					<div class="uiv2-form-input">
						<span><input id="id_first_name" type="text" name="first_name" size="30" /></span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Last Name</span>
					<div class="uiv2-form-input">
						<span><input id="id_last_name" type="text" name="last_name" size="30" /></span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Date Of Birth</span>
					<div class="uiv2-form-input">
						<span><input type="text" id="datepicker" name="dob" size="15" /></span>
						<div class="uiv2-help-text">(dd/mm/yyyy)</div>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Telephone Number</span>
					<div class="uiv2-form-input">
						<span><input id="id_phone_no" type="text" name="phone_no" size="15" /></span>
					</div>
				</div>
			</fieldset>
			<fieldset class="border" style="margin:3px;padding:2px;">
				<div class="legend">Address Details</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">House No</span>
					<div class="uiv2-form-input">
						<span><input id="id_address1" type="text" name="address1" size="30" /></span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Street Details</span>
					<div class="uiv2-form-input">
						<span><input id="id_address2" type="text" name="address2" size="30" /></span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Area</span>
					<div class="uiv2-form-input">
						<span><input id="id_area" type="text" name="area" size="30" /></span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Residential Complex</span>
					<div class="uiv2-form-input">
						<span><input id="id_residential_complex" type="text" name="residential_complex" size="30" /></span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Landmark</span>
					<div class="uiv2-form-input">
						<span><input id="id_landmark" type="text" name="landmark" size="30" /></span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">City</span>
					<div class="uiv2-form-input">
						<span class="uiv2-push-left uiv2-mar-t-8">
							<select name="city" id="id_city">
								<option value="1">Bangalore</option>
							</select>
						</span>
					</div>
				</div>
				<div class="uiv2-form-row">
					<span class="uiv2-form-label">Zip</span>
					<div class="uiv2-form-input">
						<span><input name="zipcode" maxlength="6"  type="text" id="id_zipcode" size="15" /></span>
						<span class="uiv2-field-required">*</span>
					</div>
				</div>
			</fieldset>
			</form>
		</div>
		<!-- End Login Dialogue -->
	</form:form>
</body>

<!-- End  BODY section -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/*   $.ajaxStart(function() {
						    $("#loading").text("Loading...");
						  });
						$.ajaxComplete(function() {
						    $("#loading").text("");
						});  */
					 	//loginDialogue();
						
						//signUpDialogue();
						getZoneList();					
					});
	
</script>
</html>