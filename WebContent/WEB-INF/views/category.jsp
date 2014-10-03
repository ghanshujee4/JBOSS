<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<!-- Start  HEAD section -->
	<meta charset="utf-8">
	<title>Online Shopping Cart</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slider.style.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NewFile.css" />
	
	<link href="${pageContext.request.contextPath}/css/themes/cupertino/jquery-ui.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/wowslider.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/customer.js"></script>
	
	<!-- End  HEAD section -->
	<style>
		body{
			background: url(images/customer/fruits2.jpg);
			background-position: top,bottom;
			background-attachment: fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			background-size: cover;
			background-repeat: no-repeat;
		}
		.groceriesIcon{			
			background-size:cover;
			position:relative;
			background-position:center;
			background-repeat:no-repeat;
			height:100px;
			width:100px;
			cursor:pointer;
			background-image:url('images/customer/groceries-icon.jpg');
			border-radius:12px;
	 		-moz-border-radius:12px;
	 		-webkit-border-radius:12px;
		}
		.pharmaIcon{			
			background-size:cover;
			position:relative;
			background-position:center;
			background-repeat:no-repeat;
			height:100px;
			width:100px;
			cursor:pointer;
			background-image:url('images/customer/pharma-icon.jpg');
			border-radius:12px;
	 		-moz-border-radius:12px;
	 		-webkit-border-radius:12px;
		}
		.giftsIcon{			
			background-size:cover;
			position:relative;
			background-position:center;
			background-repeat:no-repeat;
			height:100px;
			width:100px;
			cursor:pointer;
			background-image:url('images/customer/gifts-icon.jpg');
			border-radius:12px;
	 		-moz-border-radius:12px;
	 		-webkit-border-radius:12px;
		}
		.toysIcon{			
			background-size:cover;
			position:relative;
			background-position:center;
			background-repeat:no-repeat;
			height:100px;
			width:100px;
			cursor:pointer;
			background-image:url('images/customer/toys-icon.jpg');
			border-radius:12px;
	 		-moz-border-radius:12px;
	 		-webkit-border-radius:12px;
		}
		.retailers{
			width:200px;
			height:45px;
		
		}
		input,button,select{
			border-radius:8px;
			-moz-border-radius:8px;
			-webkit-border-radius:8px;
			padding:5px;
		}
	</style>
</head>
<body>
<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>

<form:form id="categoryform" method="get" action="customer/index.shx" modelAttribute="shoppingCart">
<div id="main_container">
  <div id="main_content" >
    <div class="left_content "></div>
    <div class="center_content">
		<!-- Start  BODY section -->
		<div id="body">
			<div id="wowslider-container1">
				<div class="ws_images">
					<ul>
						<li><img src="${pageContext.request.contextPath}/images/customer/blue.jpg" alt="blue" title="Gift and Toy Shops" id="wows1_0"/></li>
						<li><img src="${pageContext.request.contextPath}/images/customer/purple.jpg" alt="purple" title="Pharma" id="wows1_1"/></li>
						<li><img src="${pageContext.request.contextPath}/images/customer/red.jpg" alt="red" title="Grocery" id="wows1_2"/></li>
					</ul>
				</div>
				<div class="ws_bullets"><div>
				<a href="#" title="blue"><img src="${pageContext.request.contextPath}/images/customer/blue-tooltip.jpg" alt="blue"/>1</a>
				<a href="#" title="purple"><img src="${pageContext.request.contextPath}/images/customer/purple-tooltip.jpg" alt="purple"/>2</a>
				<a href="#" title="red"><img src="${pageContext.request.contextPath}/images/customer/red-tooltip.jpg" alt="red"/>3</a>
			</div>
		</div>
		<span class="wsl">&nbsp;</span>
		<div class="ws_shadow"></div>
	</div>
	<div style='margin-top: 10px; margin-bottom: 10px;text-align:center;'>
		<h3 style="color:white;text-align:center;">We deliver groceries in one hour from Whole Foods Market, Pharma, Gifts, Toys and more</h3>
		
		<p class='message' id="message"></p>
			<div style="text-align:center;">
				<table>
					<tr>
						<td>
							<table>
								<tr>
									<td><div id="groceries" class="groceriesIcon" /></td>
									<td><div id="pharma" class="pharmaIcon" /></td>
								</tr>
								<tr>
									<td><div id="gifts" class="giftsIcon" /></td>
									<td><div id="toys" class="toysIcon" /></td>
								</tr>
							</table>
						</td>
						<td>
							<div id="retailers">
								<select id='retailer' class='retailers' name='retailer'>
									<option value=''>Select Retailer</option>
								</select>
							</div>
						</td>
						<td><input type="submit" class='btn btn-warning btn-large' id='go' value='GO'/></td>
					</tr>
					<tr>
					<td colspan="2">
						<table >
						    <!-- <tr>
						    	<th>Order Number</th>
						        <th>Status</th>
						        <th>Delivery Time</th>
						        <th>Delivery Code</th>
						        <th>Address</th>
						    </tr>
 -->							<c:forEach var="order" items="${shoppingCart.customerOrders}">
						    <tr>
						        <td>${order.orderNumber}</td>
						        <td>${order.status}</td> 
						        <td>${order.expectedDeliveryTime}</td>
						        <td>${order.deliveryCode}</td>
						        <td>
						        	${order.addressByShippingAddressId.firstName}<br/>
						        	${order.addressByShippingAddressId.lastName}<br/>
						        	${order.addressByShippingAddressId.address1}<br/>
						        	${order.addressByShippingAddressId.address2}<br/>
						        	${order.addressByShippingAddressId.address3}<br/>
						        	${order.addressByShippingAddressId.city}<br/>
						        	${order.addressByShippingAddressId.state}<br/>
						        	${order.addressByShippingAddressId.postalcode}<br/>
						        	${order.addressByShippingAddressId.phone}<br/>
						        	${order.addressByShippingAddressId.email}<br/>
						        </td>
						    </tr>
						</c:forEach>
						</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
    <div class="right_content">
    	<div id="logarea" style="text-align:right;font:bold;">
			<input type="button" class='btn btn-warning btn-large' id='signIn' value='Sign In'/>
			<input type="button" class='btn btn-warning btn-large' id='signUp' value='Sign up'/>
		</div>
    </div>
  <!-- end of main content -->
  <div class="footer">
    <div class="left_footer"></div>
    <div class="center_footer"> OnlineShopingCart. All Rights Reserved 2014<br />
     </div>
    <div class="right_footer"> <a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a> <a href="#">rss</a> <a href="contact.html">contact us</a> </div>
  </div>
</div>

</div>

	<!-- Start Login Dialogue -->
		 <div id="login-dialog-form" title="Login">
				<table class="border">
					<tr>
						<td colspan="2" align="left">LOGIN</td>
					</tr>
					<tr>
						<td >Username:</td>
						<td><input id="j_username" type="text" name="j_username" value="" /></td>
					</tr>
					<tr>
						<td >Password:</td>
						<td><input type="password" id="j_password" name="j_password" value="" /></td>
					</tr>
				</table>
		</div>
		<!-- End Login Dialogue -->
		<div id="signUp-dialog-form" title="Login">
			<form method="POST" action="" class="uiv2-form" id="id_register_form">
			<p class="validateTips">All form fields are required.</p>
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
		
</form:form>
</body>

	<!-- End  BODY section -->
<script type="text/javascript">
 $(document)
			.ready(
					function() {
						$("#groceries").click(function() {
							getSelectedCategoryRetailers("GROCERIES");
						});
						$("#pharma").click(function() {
							getSelectedCategoryRetailers("PHARMA");
						});
						$("#gifts").click(function() {
							getSelectedCategoryRetailers('GIFTS');
						});
						$("#toys").click(function() {
							getSelectedCategoryRetailers('TOYS');
						});
						
						$( "#categoryform" ).submit(function( event ) {
							if($( "#retailer" ).val()==''){
								alert( "Please select category and its retailer." );
							    return false;
						    } else { return true; } 
							
							
							});
					 	//loginDialogue();
						//signUpDialogue();
	});	

</script>
</html>