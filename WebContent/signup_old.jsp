<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Retailer Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
   
 	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet"/>

     <script src="bootstrap/js/bootstrap.js"></script>
     <script src="js/html5.js"></script>
	  <script type="text/javascript">

	  $(document).ready(function(){
		    
			$("#signup").validate({
				ignore: [],
				rules:{
					name:"required",
					address:"required",
					enphone:"required",
					enemail:{
							required:true,
							email: true
						},
					fname:"required",
					lname:"required",
					gender:"required",
					passwd:{
						required:true,
						minlength: 8
					},
					conpasswd:{
						required:true,
						equalTo: "#passwd"
					},
				}
			});
			
			/*
			$("#categoryHelpPop").hide();
			$('#categoryHelpImg').hover(function() {
				$('#categoryHelpPop').fadeIn(500);
				$('#categoryHelpPop').show();
			});
			$('#categoryHelpImg').mouseleave(function(event) {
				$('#categoryHelpPop').fadeOut(500);
			});
			
			$( "#categoryHelpPop" ).dialog({
				dialogClass: "no-close",
				position: { my: "right+100% top-70", at: "right top", of: categoryHelpImg },
				maxHeight: 20,
				minHeight: 20
			});
			*/

			$.getJSON("${pageContext.request.contextPath}/restUtil/states.shx", function(jsonResult) {
			    $.each(jsonResult, function() {
			        $('#state').append(
			            $("<option></option>").text(this.name).val(this.id)
			        );
			    });
			});

			$.getJSON("${pageContext.request.contextPath}/restUtil/categories.shx", function(jsonResult) {
			    $.each(jsonResult, function() {
			        $('#category').append(
			            $("<option></option>").text(this.name).val(this.id)
			        );
			    });
			});

			$('#state').on('change', function(e) {
				$.getJSON("${pageContext.request.contextPath}/restUtil/cities.shx?stateId=" + this.value, function(jsonResult) {
					$('#city option[value!=""]').remove();
				    $.each(jsonResult, function() {
				        $('#city').append(
				            $("<option></option>").text(this.name).val(this.id)
				        );
				    });
				});
			});

			$('#city').on('change', function(e) {
				$.getJSON("${pageContext.request.contextPath}/restUtil/zones.shx?cityId=" + this.value, function(jsonResult) {
					$('#zone option[value!=""]').remove();
				    $.each(jsonResult, function() {
				        $('#zone').append(
				            $("<option></option>").text(this.name).val(this.id)
				        );
				    });
				});
			});

			$('#maleBtn').on('click', function(e) {
				$('#gender').val("M");
			});

			$('#femaleBtn').on('click', function(e) {
				$('#gender').val("F");
			});
			
		});

	  function onChange(){
			
	  }
	  </script>
 
	  <style type="text/css">
		  .error {
			font-size: 12px;
			color: red;
		  }
		  
		  .iconx-info{
			  background-image: url("images/info.png");
			  background-size: 100% 100%;
			  background-repeat: no-repeat;
			  background-position: top center;	
		  }
	  
		.icon-phone {
		  background-image: url("images/phone.png");
		  background-size: 100% 100%;
		  background-repeat: no-repeat;
		  background-position: top center;
		}
		
		.icon-home {
		  background-image: url("images/home.png");
		  background-size: 100% 100%;
		  background-repeat: no-repeat;
		  background-position: top center;
		}
		
		.icon-cart {
		  background-image: url("images/cartz.png");
		  background-size: 100% 100%;
		  background-repeat: no-repeat;
		  background-position: top center;
		}
		
		
	  </style>
</head>
  <body>	  
  
    
<div class="container" >
	<c:url value="/CreateRetailer.shx" var="url" />
	<div class="well" style='width:700px;'>    
      <form id="signup" class="form-horizontal" method="POST" action="${url}">
		<legend>Sign Up</legend>
		
		
		<div id="enterpriseAccordion" class="accordion" style='width:600px;margin:auto;'>
			<div class="accordion-group">
				<div class="accordion-heading btn-primary">
					<a href="#collapseOne" data-parent="#myAccordion" data-toggle="collapse" class="accordion-toggle" style='color:white;'>Enterprise Details</a>
				</div>

				<div class="accordion-body collapse in" id="collapseOne">
					<div class="accordion-inner">
					
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-cart"></i></span>
								<input type="text" class="input-xxlarge" id="name" name="name" data-toggle="tooltip" data-placement="bottom" placeholder="Enterprise Name" required value='${name}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-home"></i></span>
								<textarea class="input-xxlarge" id="address" name="address" data-toggle="tooltip" data-placement="bottom" placeholder="Enterprise Address" required>${address}</textarea>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-home"></i></span>
								<select id='state' class="input-xlarge" name="state" class="input-xlarge" required>
								  <option style='color: #B8B8B8;' selected value="">Select State</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-home"></i></span>
								<select id='city' class="input-xlarge" name="city" class="input-xlarge" required>
								  <option style='color: #B8B8B8;' selected value="">Select City</option>
								</select>
							</div>
						</div>
								
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-home"></i></span>
								<input type="text" class="input-xlarge" id="pincode" name="pincode" placeholder="Pincode" required value='${pincode}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-phone"></i></span>
								<input type="text" class="input-xlarge" id="phone" name="enphone" placeholder="Business Phone" required value='${enphone}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-envelope"></i></span>
								<input type="text" class="input-xlarge" id="email" name="enemail" placeholder="Business Email" required value='${email}'>
							</div>
						</div>	

					</div>
				</div>
			</div>
		</div>
		
		<div id="zoneAccordion" class="accordion" style='width:600px;margin:auto;'>
			<div class="accordion-group">
				<div class="accordion-heading btn-primary">
					<a href="#collapseTwo" data-parent="#myAccordion" data-toggle="collapse" class="accordion-toggle" style='color:white;'>Zone Details</a>
				</div>
				<div class="accordion-body collapse in" id="collapseTwo">
					<div class="accordion-inner" style='vertical-align:top;'>
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-th-large"></i></span>
								<select name="zone" id="zone" class="input-xlarge" class="input-xlarge" required>
								  <option style='color: #B8B8B8;' selected value="">Select Zone</option>
								</select>
							</div>
						</div>	
						
						<br/>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-list"></i></span>
								<select  name="category" id="category" multiple="multiple" required size='6' class="input-xlarge">
								  <option disabled="disabled" style='color: #B8B8B8;' selected value="">Select Category</option>
								</select>
								<img id='categoryHelpImg' style='margin-left:30px;vertical-align:top;width:20px;height:20px' src="info.png"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--
		<div id='categoryHelpPop' style='background-color:lightblue;border:1px solid black;height:10px'><p>You can multi-select Categories. Please hold <B>Ctrl</B> button to select multiple Categories.</p></div>
		-->
		
		<div id="enterpriseAccordion" class="accordion" style='width:600px;margin:auto;'>
			<div class="accordion-group">
				<div class="accordion-heading btn-primary">
					<a href="#collapseThree" data-parent="#myAccordion" data-toggle="collapse" class="accordion-toggle" style='color:white;'>User Details</a>
				</div>
				<div class="accordion-body collapse in" id="collapseThree">
					<div class="accordion-inner">
					
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<input type="text" class="input-xlarge" id="fname" name="fname" data-toggle="tooltip" data-placement="bottom" placeholder="First Name" required value='${fname}'>
							</div>
						</div>

						<div class="control-group ">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<input type="text" class="input-xlarge" id="lname" name="lname" data-placement="bottom" placeholder="Last Name" required value='${lname}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-phone"></i></span>
								<input type="text" class="input-xlarge" id="phone" name="phone" placeholder="Phone" value='${phone}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span>
								<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email" value='${email}'>
							</div>
						</div>
						
						<div class="control-group">
							<p>
								<input type="hidden" id="gender" name="gender" value="" required/>
								<div class="btn-group" data-toggle="buttons-radio">  
									<button id='maleBtn' type="button" class="btn btn-info">Male</button>  
									<button id='femaleBtn' type="button" class="btn btn-info">Female</button>  	
								</div>
							</p>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"></i></span>
								<input type="text" id="username" class="input-xlarge" name="username" placeholder="Username" required value='${username}'>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-lock"></i></span>
								<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password" required>
							</div>
						</div>
						
						<div class="control-group">
							<div class="input-prepend">
								<span class="add-on"><i class="icon-lock"></i></span>
								<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password" required>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<BR/>
		<div class="control-group" style='width:600px;margin:auto;'>
			<div class="controls">
				<button type="submit" class="btn btn-success" rel="tooltip" title="Create Account">Create My Account</button>
				<button type="reset" class="btn btn-danger" rel="tooltip" title="Reset">Reset</button>
			</div>	
		</div>
	
	  </form>
   </div>
</div>

    <!-- Javascript placed at the end of the file to make the  page load faster -->
  


  

  </body>
</html>

