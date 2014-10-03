	$(document)
			.ready(
					function() {
						$("#signUp").click(function() {
							$("#signUp-dialog-form").dialog("open");
						});			
						$("#signIn").click(function() {
							$("#login-dialog-form").dialog("open");
						});
						loginDialogue();
						
						signUpDialogue();
						
	});
	
	
function checkLength( o, n, min, max ) {
    if ( o.length > max || o.length < min ) {
      //o.addClass( "ui-state-error" );
      updateTips( "Length of " + n + " must be between " +
        min + " and " + max + "." );
      return false;
    } else {
      return true;
    }
  }
function checkLength( o, n) {
    if ( o.length ==0 ) {
      //o.addClass( "ui-state-error" );
      updateTips( "Please enter " + n + ".");
      return false;
    } else {
      return true;
    }
  }
function checkPasswords( password1, password2) {
    if ( password1 !=password2 ) {
    	updateTips( "Password and confirm password should be same. ");
      return false;
    } else {
      return true;
    }
  }
function checkRegexp( o, regexp, n ) {
    if ( !( regexp.test( o ) ) ) {
      //o.addClass( "ui-state-error" );
      updateTips( n );
      return false;
    } else {
      return true;
    }
  }
function updateTips( t ) {
   alert(t);
	// tips.text( t ).addClass( "ui-state-highlight" );
    //setTimeout(function() {
    //  tips.removeClass( "ui-state-highlight", 1500 );
    //}, 500 ); 
  }
	function split(val) {
		var v = val.split(/,\s*/);
		return v;
	}
	function extractLast(term) {
		return split(term).pop();
	}
	
	
	/*$.get("banner.html", function(data){
	    $(this).children("div:first").html(data);
	});*/
	function login() {
		var username = document.getElementById('j_username').value;
		var password =  document.getElementById("j_password").value;
		var rootUrl =  document.getElementById("url").value;
		//alert(username);
		//alert(password);
		$
				.ajax({
					url : rootUrl+"/customer/login.shx",
					type : 'POST',
					data : "username=" + username + "&password="+ password,
					success : function(data) {
						//alert('Order Placed Successfully');
						//document.getElementById('prod_list').innerHTML= buildProduct(data);
						var obj = jQuery.parseJSON(data);
						if(obj.status=='TRUE'){
							$("#login-dialog-form").dialog("close");
							document.getElementById('message').innerHTML = 'Welcome '+username;
							document.getElementById('logarea').innerHTML = 'Welcome '+username;
						}else{
							alert('Please check username/password and relogin.');
						}
						
					},
					error : function(data, status, er) {
						alert("Please check username/password and relogin.");
					}
				});

	}
	function signUp() {
		var bValid = true;
		var rootUrl =  document.getElementById("url").value;
		var email = document.getElementById('id_email').value;
		bValid = bValid &&  checkLength(email, "Email");
		bValid = bValid &&  checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
		var mobile = document.getElementById('id_mobile_no').value;
		bValid = bValid &&  checkLength(mobile, "Mobile");
		bValid = bValid && checkLength( mobile, "id_mobile_no", 10, 10 );
		bValid = bValid && checkRegexp( mobile, /^([0-9])+$/, "Phone field only allow : 0-9" );
		var userid = document.getElementById('id_userid').value;
		bValid = bValid && checkLength(userid, "UserId");
		var password1 = document.getElementById('id_password1').value;
		bValid = bValid && checkLength(password1, "Password1");
		var password2 = document.getElementById('id_password2').value;
		bValid = bValid && checkLength(password2, "Password2");
		bValid = bValid && checkPasswords( password1, password2);
		var salutation = document.getElementById('id_salutation').value;
		bValid = bValid && checkLength(salutation, "Salutation");
		var firstname = document.getElementById('id_first_name').value;
		bValid = bValid && checkLength(firstname, "First Name");
		var lastname = document.getElementById('id_last_name').value;
		bValid = bValid && checkLength(lastname, "Last Name");
		var dob = document.getElementById('datepicker').value;
		var phone = document.getElementById('id_phone_no').value;
		var address1 = document.getElementById('id_address1').value;
		bValid = bValid && checkLength(address1, "House #");
		var address2 = document.getElementById('id_address2').value;
		var area = document.getElementById('id_area').value;
		bValid = bValid && checkLength(area, "Area");
		var residential = document.getElementById('id_residential_complex').value;
		var landmark = document.getElementById('id_landmark').value;
		var city = document.getElementById('id_city').value;
		var zipcode = document.getElementById('id_zipcode').value;
		bValid = bValid && checkLength(zipcode, "Zipcode");
		bValid = bValid && checkRegexp( zipcode, /^([0-9])+$/, "Zipcode field only allow : 0-9" );
		//alert(zipcode);
		//var userAddress = {'primary':'true','user':{'active':'true','username':userid,'password':password1},'address':{'firstName':firstname,'lastName':lastname,'address1':address1,'address2':address2,'address3':landmark,'city':city,'postalcode':zipcode,'email':email,'phone':mobile}};
		var userAddress ="username=" + userid+ "&password="+ password1+ "&firstName="+ firstname+ "&lastName="+ lastname+ "&address1="+ address1+ "&address2="+ address2+ "&address3="+ landmark+ "&city="+ city+ "&postalcode="+ zipcode+ "&email="+ email+ "&phone="+ mobile;
		//alert(userAddress);
		if(bValid){
			$.ajax({
					url : rootUrl+"/customer/signup.shx",
					type : 'POST',
					data : userAddress,
					success : function(data) {
						if(data=='TRUE'){
							alert('User account created successfully.');
							$("#signUp-dialog-form").dialog("close");
						}else{
							alert('User account creation is unsuccessfully.');
						}
						
					},
					error : function(data, status, er) {
						alert("User account creation is unsuccessfull.");
					}
				});
		}

	}
function loginDialogue(){
	$("#login-dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true,
		buttons : {
			/*"SignUp" : function() {
				//type: "submit";
				$("#login-dialog-form").dialog("close");
				$("#signUp-dialog-form").dialog("open");
			},*/
			"Login" : function() {
				login();
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		},
		close : function() {
			//allFields.val("").removeClass("ui-state-error");
		}
	});
}
function signUpDialogue(){
	$("#signUp-dialog-form").dialog({
		autoOpen : false,
		height : 600,
		width : 500,
		modal : true,
		buttons : {
			"Submit" : function() {
				//var bValid = true;
				//allFields.removeClass("ui-state-error");
				//type: "submit";
				signUp();
			},
			Cancel : function() {
				$("#signUp-dialog-form").dialog("close");
			}
		},
		close : function() {
			//allFields.val("").removeClass("ui-state-error");
		}
	});
}
function getZoneList(){
	var rootUrl =  document.getElementById("url").value;
	$("#tag")
	.autocomplete(
			{
				source : function(request, response) {
					$
							.getJSON(
									rootUrl+"/get_zone_list.shx",
									{
										term : extractLast(request.term)
									}, response);
				},
				search : function() {
					// custom minLength
					var term = extractLast(this.value);

					if (term.length < 1) {
						return false;
					}
				}
			}).data("ui-autocomplete")._renderItem = function(
	ul, item) {
return $("<li></li>").data("item.autocomplete",
		item).append("<a style='text-align:left;'>" + item.label + "</a>")
		.appendTo(ul);
};

}
function buildRetailersDropdown(retailers) {
	var retailersLen = retailers.length;
	var retailersHtml = "<select id='retailer' class='retailers' name='retailerId'>";
	retailersHtml = retailersHtml
			+ "<option value=''>Select Retailer</option>";
	for ( var j = 0; j < retailersLen; j++) {
		var retailer = retailers[j];
		//alert(retailer);
		retailersHtml = retailersHtml + "<option value='"+retailer.id+"'>"
				+ retailer.name + "</option>";
	}
	if (retailersHtml == '') {
		retailersHtml = "<option value=''></option>";
	}
	//alert('prodAttrHtml='+prodAttrHtml);
	retailersHtml = retailersHtml + '</select>';
	document.getElementById('retailers').innerHTML = retailersHtml;
	return retailersHtml;
}
function getSelectedCategoryRetailers(category) {
	var rootUrl =  document.getElementById("url").value;
	$.ajax({ 
	    url: rootUrl+"/search_zone_retailers.shx",    
	    data: 'categoryType='+category,   
	    success: function(data) { 
	        //alert(data);
	        buildRetailersDropdown(
	jQuery.parseJSON(data));
					},
					error : function(data, status, er) {
						alert("error: " + data + " status: " + status + " er:"
								+ er);
					}
				});
}

