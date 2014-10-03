<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Online Shopping Cart</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/accordion.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/menuStyle.css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/customer.css" />
<link href="${pageContext.request.contextPath}/css/themes/cupertino/jquery-ui.min.css"	rel="stylesheet">
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/DateTimePicker.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/jquery.ddslick.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/js/accordion.js"></script>
<style>
.ui-menu {
	width: 190px;
	text-align: center;
}
body{
background-color: white;
}
.retailers{
	width:100px;
	height:50px;
		
}
.menuSelect {
	width:100px;
	height:35px;
	border: 1px solid #C8D2D9;
	padding: 0.5em;
	font-size: 10px;
    background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ccc));
    -webkit-appearance: none;
 	-webkit-border-radius: 0.5em;
    background: #fff url(../images/customer/menu_bg.gif) repeat-x;
}
</style>
</head>
<body>
	<input type="hidden" id="url" value="${pageContext.request.contextPath}"/>
	<form:form method="get" action="home.html"
		modelAttribute="shoppingCart">
		<div id="main_container" style="background-color: white;">
			<div id="main_content">
				<div class="left_content ">
					<div class="shopping_cart1"
						style="text-align: center; height: 85px;">CLOSER BY</div>
					<!--start new menu-->
					<div id="AccordionContainer">
						  <div onclick="runAccordion(1);">
							<div class="AccordionTitle" onselectstart="return false;">
							  Categories
							</div>
						  </div>
						  <div id="Accordion1Content" class="AccordionContent">
							<ul id="menu" style="width:160px;">
								<c:forEach var="category" items="${shoppingCart.categories}">
									<li ><a style="width:160px;color:blue;text-align:left;" href="#" onclick="categorySearch('${category.name}','${category.name}')">${category.name}</a></li>
								</c:forEach>
								<!--<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('FRUITS','FRUITS')">FRUITS</a></li>
								<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('VEGETABLES','VEGETABLES')">VEGETABLES</a></li>
								<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('GROCERIES','GROCERIES')">GROCERIES</a></li>
								<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('MASALA','MASALA')">MASALA</a></li>
								<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('BUSCITS','BUSCITS')">BUSCITS</a></li>
								<li ><a style="width:160px;color:blue;" href="#" onclick="categorySearch('OILS','OILS')">OILS</a></li> -->
							</ul>
						  </div>
				  </div>
			    	<!--end new menu-->
					<div class="sub_title_box">
						<div class="boxTitle">Packet Size</div>
						<div class="sub_title_box_flow">
							<ul id="packetSize" class="left_menu">

							</ul>
						</div>
					</div>
					<div class="sub_title_box">
						<div class="boxTitle">Brands</div>
						<div class="sub_title_box_flow">
							<ul id="brands" class="left_menu">

							</ul>
						</div>
					</div>
					<div class="sub_title_box">
						<div class="boxTitle">Price</div>
						<div class="sub_title_box_flow">
							<ul id="prices" class="left_menu">
							</ul>
						</div>
					</div>

				</div>
				<!-- end of left content -->
				<div class="center_content">
					<!--Start Center Menu-->
					<div id="menu_tab">
						<ul class="menu">
							<li class="divider"></li>
							<li>
								<a href="#" class="nav1">
									<select id='retailer' class='menuSelect'>
						              <c:forEach var="item" items="${shoppingCart.retailers}">
						                <c:choose> 
						                <c:when test="${item.equals(shoppingCart.retailer)}">
								             <option selected="selected" value="${item.id}">${item.name}</option>
								        </c:when>
								        <c:otherwise>
								             <option value="${item.id}">${item.name}</option>
								        </c:otherwise>
								        </c:choose>
						               </c:forEach>
						            </select>
								</a>
							</li>
							<li class="divider"></li>
							<li><a href="#" class="nav1"><span id='customerZone' style='width:100px;'>${shoppingCart.zone}<br/>Zone</span></a></li>
							<li class="divider"></li>
							<li>
								<a href="#" class="nav1" id="orderHistoryA">
									<select id='orderHistory' class='menuSelect'>
						                <option selected="selected" value="">Select Order History</option>
								    </select>
								</a>
							</li>
							<li class="divider"></li>
							<li><a href="#" class="nav1"><span id='signIn' style='width:100px;'>SIGN IN</span></a></li>
							<li class="divider"></li>
							<li><a href="#" class="nav1"><span id='signOut' style='width:100px;'>SIGN OUT</span></a></li>
							<li class="divider"></li>
							
						</ul>
					</div>
					<div class="delivery_title_bar">
						<form:input class="search_input" id="tag" path="tag" />
						<img class="search_image"
							src="${pageContext.request.contextPath}/images/customer/search.gif"
							id="search" />
					</div>
					<div id="breadCrum" class="delivery_title_bar1"></div>
					<!-- Start product list-->
					<div id="prod_list" class="prod_list border"></div>
					<!-- End product list-->
					<!--Start Center Menu-->

				</div>
				<!-- end of center content -->
				<div class="right_content border">

					<div class="shopping_cart ">
						<div class="cart_icon" style="float: left;">
							<img
								src="${pageContext.request.contextPath}/images/customer/shoppingcart.png"
								alt="" />
						</div>
						<div  class="cart_title "
							style="margin: 0px 50px 0px 0;"><input id="placeOrder" type="button" value="PLACE ORDER"/></div>
						<div class="cart_details">
							<span id="totalItems" class="price">0</span> items , Total: <span
								id="totalPrice" class="price">0</span> Rs
						</div>

					</div>

					<div class="mylist_title_box border">My Order List</div>
					<div class="order_items">
						<!--Start Order Item-->
						<div id="AccordionContainer1" class="AccordionContainer"></div>
						<!--End order Item-->
					</div>
					<!--End of order items-->

					<!--Accordion End-->

				</div>
				<!-- end of right content -->
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
		<!-- end of main_container -->
		<div id="dialog-form" title="Delivary Date, Time & Shipping Details">
				<div>
					
					<div id="shippingAddresses">
						
					</div>
				</div>
		</div>
		<div id="login-dialog-form" title="Login">
				<table>
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
	<script type="text/javascript">
		var totalItems = 0;
		var totalPrice = 0;
		var loginFrom='';
		$(function() {
			$("#menu").menu();
		});
		
		function buildPacketSizeSearchCriteria(data) {
			var packetSizes = data.packetSizes;
			var selectedPacketSearchCriteria = data.selectedMeasurements;
			document.getElementById('packetSize').innerHTML = buildSearchCriteriaHtml(
					'MEASUREMENT', packetSizes, selectedPacketSearchCriteria);
		}

		function buildSearchCriteriaHtml(criteria, criteriaList,
				selectedPacketSearchCriteria) {
			var criteriaListLen = criteriaList.length;
			var criteriaHtml;
			for ( var j = 0; j < criteriaListLen; j++) {
				if (j % 2 == 0) {
					criteriaHtml = criteriaHtml
							+ buildSearchCriteria(selectedPacketSearchCriteria,
									criteria, criteriaList[j], 'even');
				} else {
					criteriaHtml = criteriaHtml
							+ buildSearchCriteria(selectedPacketSearchCriteria,
									criteria, criteriaList[j], 'odd');
				}
			}
			return criteriaHtml;
		}
		function buildBrandSearchCriteriaHtml(criteria, criteriaList,
				selectedBrands) {
			var criteriaListLen = criteriaList.length;
			var criteriaHtml;
			for ( var j = 0; j < criteriaListLen; j++) {
				if (j % 2 == 0) {
					criteriaHtml = criteriaHtml
							+ buildSearchCriteria(selectedBrands, criteria,
									criteriaList[j].name, 'even');
				} else {
					criteriaHtml = criteriaHtml
							+ buildSearchCriteria(selectedBrands, criteria,
									criteriaList[j].name, 'odd');
				}
			}
			return criteriaHtml;
		}
		function buildBrandSearchCriteria(data) {
			var brands = data.manufacturers;
			var selectedBrands = data.selectedBrands;
			document.getElementById('brands').innerHTML = buildBrandSearchCriteriaHtml(
					'BRAND', brands, selectedBrands);
		}
		function buildPricesSearchCriteria(data) {
			var prices = Object.keys(data.productsByPrice);
			var pricesLen = prices.length;
			var selectedPricesCriteria = data.selectedPriceRanges;
			var pricesHtml;
			for ( var j = 0; j < pricesLen; j++) {
				var val = prices[j];
				if (data.productsByPrice[prices[j]] != '') {
					if (j % 2 == 0) {
						pricesHtml = pricesHtml	+ buildSearchCriteria(selectedPricesCriteria,'PRICE', prices[j], 'even');
					} else {
						pricesHtml = pricesHtml	+ buildSearchCriteria(selectedPricesCriteria,'PRICE', prices[j], 'odd');
					}
				}
			}
			document.getElementById('prices').innerHTML = pricesHtml;
		}
		function ex(obj, price) {
			alert('hi');
		}
		function isCriteriaAlreadySelected(selectedCriteria, criteria) {
			for ( var j = 0; j < selectedCriteria.length; j++) {
				//alert(selectedCriteria[j]);
				//alert(criteria);
				if (selectedCriteria[j] == criteria) {
					return true;
				}
			}
			return false;
		}
		function buildSearchCriteria(selectedCriteria, type, value,
				oddOrEvenRow) {
			if (isCriteriaAlreadySelected(selectedCriteria, value)) {
				return "<li class='"+oddOrEvenRow+"'><a href='#'><input type='checkbox' onclick=getCategoryCriteriaSearchAjaxResults(this,'"
						+ value
						+ "','"
						+ type
						+ "') checked />"
						+ value
						+ "</a></li>";
			} else {
				return "<li class='"+oddOrEvenRow+"'><a href='#'><input type='checkbox' onclick=getCategoryCriteriaSearchAjaxResults(this,'"
						+ value + "','" + type + "') />" + value + "</a></li>";
			}

		}
		function getCategoryCriteriaSearchAjaxResults(checkBoxObj, criteria,
				criteriaType) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/category_search_criteria.shx",
						data : 'categorySearchCriteria=' + criteria
								+ '&searchCriteriaType=' + criteriaType
								+ '&checked=' + checkBoxObj.checked,
						success : function(data) {
							var obj = jQuery.parseJSON(data);
							//buildPacketSizeSearchCriteria(data);
							//buildBrandSearchCriteria(data);
							//buildPricesSearchCriteria(data);
							document.getElementById('prod_list').innerHTML = buildProduct(obj.searchedSecoundaryProducts);
						},
						error : function(data, status, er) {
							alert("Error occured while searching the sub category search");
						}
					});
		}

		function getCategorySearchAjaxResults(category) {

			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/category_search.shx",
						data : 'category=' + category,
						//contentType : 'application/json',
						//mimeType : 'application/json',
						success : function(data) {
							var obj = JSON.parse( data);
							buildPacketSizeSearchCriteria(obj);
							//buildBrandSearchCriteria(data);
							buildPricesSearchCriteria(obj);
							document.getElementById('prod_list').innerHTML = buildProduct(obj.searchedProductsBean);
						},
						error : function(data, status, er) {
							alert("Error occured while searching the category.");
						}
					});
		}

		function categorySearch(breadcrum, category) {
			document.getElementById("breadCrum").innerText = breadcrum;
			getCategorySearchAjaxResults(category);
		}
		function split(val) {
			var v = val.split(/,\s*/);
			return v;
		}
		function extractLast(term) {
			return split(term).pop();
		}
		function setPrice(retailerSnapshots, product, id) {
			var ids = id;
			document.getElementById(ids).innerText = measurement.value;
			var retailerSnapshots = product.retailerSnapshots;
			var prodAttrLen = retailerSnapshots.length;
			for ( var j = 0; j < prodAttrLen; j++) {
				var retailerSnapshot = retailerSnapshots[j];
				if (retailerSnapshot.id == measurement.value) {
					document.getElementById(ids).innerText = retailerSnapshot.salePrice;
				}
			}
		}
		function buildProductAttributes(productAttributes) {
			var prodAttrLen = productAttributes.length;
			var prodAttrHtml = '';
			for ( var j = 0; j < prodAttrLen; j++) {
				var productAttrubute = productAttributes[j];
				if (j == 0) {
					prodAttrHtml = prodAttrHtml
							+ "<option value='"+productAttrubute.id+"' selected='selected'>"
							+ productAttrubute.measuringUnit.name + "</option>";
				} else {
					prodAttrHtml = prodAttrHtml
							+ "<option value='"+productAttrubute.id+"'>"
							+ productAttrubute.measuringUnit.name + "</option>";
				}
			}
			if (prodAttrHtml == '') {
				prodAttrHtml = "<option value=''></option>";
			}
			//alert('prodAttrHtml='+prodAttrHtml);

			return prodAttrHtml;
		}
		function buildProduct(data) {
			var productList = '';

			//if(data){

			var len = data.length;
			if (len > 0) {
				for ( var i = 0; i < len; i++) {
					var product = data[i];
					var productAttrubutes = product.retailerSnapshots;
					var productPriceId = 'price' + product.id;
					var productQuantityId = 'quantity' + product.id;
					var selectedMeasurementId = 'measurement' + product.id;
					//var prodAttrLen = product.retailerSnapshots.length;
					var prodAttrHtml = buildProductAttributes(product.retailerSnapshots);
					var salePrice = '';
					if (productAttrubutes.length != 0) {
						salePrice = productAttrubutes[0].salePrice;
					}
					productList = productList
							+ $.trim("<div class='prod_box' style='text-align:center;'>"
							+ "<table align='center' 	>"
							+ "<tr>"
							+ "<td colspan='2'><div class='product_img'><img class='search_product_image' src='${pageContext.request.contextPath}"+product.image+"' /></div></td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2'><div class='product_title textAlignCenter' style='height:40px;'>"
							+ product.name
							+ "</div></td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td colspan='2'>"
							+ "<div class='product_title'>"
							+ "<select id="
							+ selectedMeasurementId
							+ ' class="measurement" name="measurement" onchange="setPrice(this,"'
							+ product
							+ '","'
							+ productPriceId
							+ '")>'
							+ prodAttrHtml
							+ "</select>"
							+ "</div>"
							+ "</td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td><div class='product_title'>MRP:</div></td>"
							+ "<td><div class='product_title1' id="+productPriceId+" >"
							+ salePrice
							+ "</div></td>"
							+ "</tr>"
							+ "<tr>"
							+ "<td class='product_title '>"
							+ "<div>"
							+ "<div onclick=addItemToCart('"
							+ product.id
							+ "','"
							+ productQuantityId
							+ "','"
							+ productPriceId
							+ "','"
							+ selectedMeasurementId
							+ "') class='border' style='float:left;padding:5px;'>"
							+ "<img src='${pageContext.request.contextPath}/images/customer/cart.gif' class='left_bt' />"
							+ "</div>"
							+ "<div id='"+productQuantityId+"' style='float:left;padding:6px;width:20px;height:20px;margin:1px;' class='border'>1</div>"
							+ "</div>"
							+ "</td>"
							+ "<td class='counter-width border' align='center;'>"
							+ "<div class='border-bottom' onclick=increment('"
							+ productQuantityId
							+ "')><img src='${pageContext.request.contextPath}/images/customer/plus3.png' /></div>"
							+ "<div class='minus-height' onclick=decrement('"
							+ productQuantityId
							+ "') style='padding:2px;'><img src='${pageContext.request.contextPath}/images/customer/minus3.png' /></div>"
							+ "</td>" + "</tr>" +

							"</table>" + "</div>");

				}
			}
			// }
			return productList;
		}
		function updatedOrderList(orderItem) {
			return buildOrderItem(orderItem)
					+ document.getElementById('AccordionContainer1').innerHTML;
		}
		function buildOrderProductAttributes(productAttributes,
				selectedProductAttribute) {
			var prodAttrLen = productAttributes.length;
			var prodAttrHtml;
			for ( var j = 0; j < prodAttrLen; j++) {

				var productAttrubute = productAttributes[j];
				if (productAttrubute.measuringUnit.name == selectedProductAttribute.measuringUnit.name) {
					prodAttrHtml = prodAttrHtml
							+ "<option value='"+productAttrubute.salePrice+"' selected='selected'>"
							+ productAttrubute.measuringUnit.name + "</option>";
				} else {
					prodAttrHtml = prodAttrHtml
							+ "<option value='"+productAttrubute.salePrice+"'>"
							+ productAttrubute.measuringUnit.name + "</option>";
				}
			}
			return prodAttrHtml;
		}
		function buildOrderItem(orderItem) {
			var productList = '';
			//if (orderItem) {
				var item = orderItem;
				var product = orderItem.product;
				var selectedProductAttribute = orderItem.retailerSnapshotBean;
				var retailerId = selectedProductAttribute.organization.id;
				var productAttrubutes = product.retailerSnapshots;
				var productPriceId = 'orderListPrice' + product.id;
				var productQuantityId = 'orderListQuantity' + product.id;
				var selectedMeasurementId = 'orderListMeasurement' + product.id;
				var orderListProduct = 'orderListProduct' + product.id;
				var prodAttrLen = product.retailerSnapshots.length;
				var prodAttrHtml = buildOrderProductAttributes(
						product.retailerSnapshots, selectedProductAttribute);
				totalPrice = parseFloat(totalPrice)
						+ parseFloat(orderItem.total);
				totalItems = parseInt(totalItems)
						+ parseInt(orderItem.quantity);
				productList = productList
						+ "<div >"
						+ "<table class='ordered_prod_box' align='center' style='background: #F0F4FD;'>"
						+ "<tr>"
						+ "<td  class='product_title' style='padding:5px;'><div id='"+productQuantityId+"'>"
						+ orderItem.quantity
						+ "</div></td>"
						+ "<td class='counter-width'>"
						+ "<table >"
						+ "<tr>"
						+ "<td  class='border-bottom border'>"
						+ "<img src='${pageContext.request.contextPath}/images/customer/plus3.png' onclick=increment('"
						+ productQuantityId
						+ "')/>"
						+ "</td>"
						+ "<td >"
						+ "<div class='product_title' style='text-align:center;'>"
						+ product.name
						+ "</div>"
						+ "<div class='product_title'>"
						+ "<select id="
						+ selectedMeasurementId
						+ " class='measurement' name='measurement' onchange='setPrice(this,"
						+ product
						+ ",'"
						+ productPriceId
						+ "')'>"
						+ prodAttrHtml
						+ "</select>"
						+ "</div>"
						+ "</td>"
						+ "</tr>"
						+ "<tr >"
						+ "<td class='border-right border'><img src='${pageContext.request.contextPath}/images/customer/minus3.png' onclick=decrement('"
						+ productQuantityId
						+ "')/></td>"
						+ "<td class='product_title'>"
						+ "<div class=''>"
						+ "<div style='float:left;text-align:center;width:50%;'>"
						+ "<div>MRP</div>"
						+ "<div id="+productPriceId+">"
						+ selectedProductAttribute.salePrice
						+ "</div>"
						+ "</div>"
						+ "<div style='text-align:center;'>"
						+ "<div>TL</div>"
						+ "<div>"
						+ orderItem.total
						+ "</div>"
						+ "</div>"
						+ "</div>"
						+ "</td>"
						+ "</tr>"
						+ "</table>"
						+

						"</td>"
						+ "<td>"
						+ "<div>"
						+ "<div>"
						+ "<div style='float:right;margin:0 0 0 2px;' id="+orderListProduct+" onclick=deleteProductFromOrderList('"+orderListProduct+"','"+retailerId+"','"+product.id+"','"+orderItem.total+"','"+orderItem.quantity+"')><img  src='${pageContext.request.contextPath}/images/customer/close.png' /></div>"
						//+ "<div style='float:right;'><img src='${pageContext.request.contextPath}/images/customer/save.png' /></div>"
						+ "</div>"
						+ "<div class='product_img'><a href='#'><img  class='ordered_product_image' src='${pageContext.request.contextPath}"+product.image+"' alt='' border='0' /></a></div>"
						+ "</div>" + "</td>" + "</tr>" +

						"</table>" + "</div>";
			//}
			document.getElementById('totalPrice').innerText = totalPrice;
			document.getElementById('totalItems').innerText = totalItems;
			return productList;
		}
		function increment(id) {
			var ids = id;
			var quantity = document.getElementById(ids).innerText;
			document.getElementById(ids).innerText = parseInt(quantity) + 1;
		}
		function decrement(id) {
			var ids = id;
			var quantity = document.getElementById(ids).innerText;
			if (parseInt(quantity) == 1) {
				//do nothing	
			} else {
				document.getElementById(ids).innerText = parseInt(quantity) - 1;
			}

		}
		function getProductAttribute(product, price) {
			var productAttrubutes = product.productAttributes;
			var prodAttrLen = product.productAttributes.length;
			var productAttrubute;
			for ( var j = 0; j < prodAttrLen; j++) {
				if (productAttributes[j].price == price) {
					productAttrubute = productAttributes[j];
				}
			}
			return productAttrubute;
		}
		function addItemToCart(productId, productQuantityId, productPriceId,
				productAttrId) {
			//alert('retailerid : '+$('#retailer').val());
			var retailerId = $('#retailer').val();
			var quantity = document.getElementById(productQuantityId).innerText;
			var price = document.getElementById(productPriceId).innerText;
			var prodAttrId = document.getElementById(productAttrId).value;
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/addItemToCart.shx",
						type : 'GET',
						data : "productId=" + productId + "&quantity="
								+ quantity + "&price=" + price + "&prodAttrId="
								+ prodAttrId+"&retailerId=" + retailerId,
						success : function(data) {
							var obj = jQuery.parseJSON(data); 
							document.getElementById('AccordionContainer1').innerHTML = updatedOrderList(obj.orderItem);
						},
						error : function(data, status, er) {
							alert("Error occured while adding product to list.");
						}
					});
		}
		/* function getRetailers() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/get_retailers.shx",
						success : function(data) {
							var x = document.getElementById("retailer");
							if (x.length == 1) {
								var retailersLen = data.length;
								for ( var j = 0; j < retailersLen; j++) {
									var option = document
											.createElement("option");
									option.value = JSON.stringify(data[j]);
									option.text = data[j].name + ', '
											+ data[j].zone.name;
									var sel = x.options[x.selectedIndex];
									x.add(option, sel);
								}

							}
						},
						error : function(data, status, er) {
							alert("Not able to retrive retailers for category.");
						}
					});

		} */
		function sendAjax() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/search.shx",
						data : 'tag=' + $('#tag').val(),
						success : function(data) {
							var obj = JSON.parse( data);
							buildPacketSizeSearchCriteria(obj);
							//buildBrandSearchCriteria(data);
							buildPricesSearchCriteria(obj);
							document.getElementById('prod_list').innerHTML = buildProduct(obj.searchedSecoundaryProducts);
							//document.getElementById('prod_list').innerHTML = buildProduct(data);
						},
						error : function(data, status, er) {
							alert("error: " + data + " status: " + status
									+ " er:" + er);
						}
					});
		}
		function signOut() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/signout.shx",
						success : function(data) {
							if(data=='TRUE'){
								window.location = document.getElementById('url').value+"/zone.shx";
								//alert("You are signed out");
							}else{
								alert("Signout is unsuccessfull");
							}
						},
						error : function(data, status, er) {
							alert("Not able to retrive retailers for category.");
						}
					});

		}
		
		function getdefaultSearch() {

			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/default_search.shx",
						//data : 'category=' + category,
						//contentType : 'application/json',
						//mimeType : 'application/json',
						success : function(data) {
							//document.getElementById('customerZone').innerHTML = 'ZONE: '+data.zone;
							//document.getElementById('selectedRetailer').innerHTML = 'RETAILER: '+data.retailer;
							var obj = JSON.parse( data);
							buildPacketSizeSearchCriteria(obj);
							//buildBrandSearchCriteria(data);
							buildPricesSearchCriteria(obj);
							document.getElementById('prod_list').innerHTML = buildProduct(obj.searchedProductsBean);
						},
						error : function(data, status, er) {
							//alert("error: " + data + " status: " + status+ " er:" + er);
						}
					});
		}

		function deleteProductFromOrderList(id,retailerId,productId,total,quantity){
			//$(id).fadeOut();
			$
			.ajax({
				url : "${pageContext.request.contextPath}/customer/deleteProductFromOrderList.shx",
				type : 'POST',
				data : "productId=" + productId+"&retailerId=" + retailerId,
				success : function(data) {
					var products='';
					var obj = jQuery.parseJSON(data); 
					var len = obj.length;
					if (len > 0) {
						totalPrice=0;
						totalItems=0;
						for ( var i = 0; i < len; i++) {
							products = products +buildOrderItem(obj[i]);
						}
					}
					/*if(parseInt(totalItems)>0){
						totalItems = parseInt(totalItems) - parseInt(quantity);
					}
					if(parseFloat(totalPrice)>0){
						totalPrice = parseFloat(totalPrice)	- parseFloat(total);
					}*/
					document.getElementById('AccordionContainer1').innerHTML = products;
					document.getElementById('totalPrice').innerText = totalPrice;
					document.getElementById('totalItems').innerText = totalItems;
				
				},
				error : function(data, status, er) {
					alert("Error occured while deleting product from list.");
				}
			});
		}
		function getSelectedRetailProducts(retailerId){
			//$(id).fadeOut();
			$
			.ajax({
				url : "${pageContext.request.contextPath}/customer/selected_retailer_products.shx",
				type : 'POST',
				data : "retailerId=" + retailerId,
				success : function(data) {
					var obj = JSON.parse( data);
					buildPacketSizeSearchCriteria(obj);
					//buildBrandSearchCriteria(data);
					buildPricesSearchCriteria(obj);
					document.getElementById('prod_list').innerHTML = buildProduct(obj.searchedProductsBean);
					
				},
				error : function(data, status, er) {
					alert("Error occured while deleting product from list.");
				}
			});
		}
		function getOrderHistoryItems(orderId) {
			var products='';
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/order_history.shx",
						type : 'POST',
						data : "orderId=" + orderId,
						success : function(data) {
							var obj = JSON.parse( data);
							var len = obj.length;
							if (len > 0) {
								 for ( var i = 0; i < len; i++) {
									products = products + buildOrderItem(obj[i]);
								} 
							}
							document.getElementById('AccordionContainer1').innerHTML = products; 
						},
						error : function(data, status, er) {
							alert("Error occured while getting order history list.");
						}
				
					});
		}
		
		$(document)
				.ready(
						function() {
							
							getdefaultSearch();
							/*$('#myStore').ddslick({
								data : ddData,
								width : 75,
								selectText : "MY STORE",
								onSelected : function(selectedData) {
									//callback function: do something with selectedData;
								}
							});
							 $( "#myStore" ).click(function() {
								updateMyStore();  
							}); */
							$("#signUp").click(function() {
								$("#signUp-dialog-form").dialog("open");
							});
							$("#signOut").click(function() {
								signOut();
							});
							$("#signIn").click(function() {
								loginFrom = 'menu';
								$("#login-dialog-form").dialog("open");
							});
							$("#placeOrder").click(function() {
								getAddresses();
								
							});
							$("#search").click(function() {
								sendAjax();
							});
							$(document).on('change','#retailer',function(){
								var retailerId = $( "#retailer" ).val();
								getSelectedRetailProducts(retailerId);
								});
							$(document).on('change','#orderHistory',function(){
								var orderId = $("#orderHistory").val();
								getOrderHistoryItems(orderId); 
								});
							$("#tag")
									.autocomplete(
											{
												source : function(request,
														response) {
													$
															.getJSON(
																	"${pageContext. request. contextPath}/customer/get_tag_list.shx",
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
									allFields.val("").removeClass("ui-state-error");
								}
							});

						});

		function checkout(allFields) {
			var addressId = $('input[name=address]:checked').val();
			//var retailer = addressId = $( "input:radio[name=address]:checked" ).val(),dateTime = $("#datetimepicker").val();
			var retailer = dateTime = $("#datetimepicker").val();
			if(addressId=== undefined){
				alert('Please select shipping address');
				return false;
			}else if(dateTime==''){
				alert('Please select delivary date and time');
				return false;
			}
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/checkOut.shx",
						type : 'GET',
						data : "addressId=" + addressId + "&delivaryDateTime="+ dateTime,
						success : function(data) {
							alert('Order Placed Successfully');
							document.getElementById('AccordionContainer1').innerHTML='';
							document.getElementById('totalPrice').innerText = '0';
							document.getElementById('totalItems').innerText = '0';
							//document.getElementById('prod_list').innerHTML= buildProduct(data);
							$("#dialog-form").dialog("close");
						},
						error : function(data, status, er) {
							alert("CheckOut order is unsuccessfull.");
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

		function login() {
			var username = document.getElementById('j_username').value;
			var password =  document.getElementById("j_password").value;
			$
					.ajax({
						url : "${pageContext.request.contextPath}/customer/login.shx",
						type : 'POST',
						data : "username=" + username + "&password="+ password,
						success : function(data) {
							var obj = jQuery.parseJSON(data);
							if(obj.status=='TRUE'){
								buildOrderedHistoryDropdown(obj.customerOrderHistory);
								document.getElementById("shippingAddresses").innerHTML = displayAddresses(obj.userAddressBean);
								$("#login-dialog-form").dialog("close");
								if(loginFrom=='menu'){
									loginFrom='';
								}else{
									//getAddresses();
									$("#datetimepicker").datetimepicker();
									$("#dialog-form").dialog("open");
								}
							}else{
								alert('Please check username/password and relogin.');
							}
						},
						error : function(data, status, er) {
							alert("CheckOut order is unsuccessfull.");
						}
					});

		}
		function getAddresses(){
			$
			.ajax({
				url : "${pageContext.request.contextPath}/customer/selectAddress.shx",
				type : 'GET',
				//contentType : 'application/json',
				//mimeType : 'application/json',
				success : function(data) {
					if(data=='j_spring_security_check'){
						//window.location.href = '${pageContext.request.contextPath}/login.shx';
						$("#login-dialog-form").dialog("open");
					}else{
						var obj = jQuery.parseJSON(data);
						document.getElementById("shippingAddresses").innerHTML = displayAddresses(obj);
						$("#datetimepicker").datetimepicker();
						$("#dialog-form").dialog("open");
					}
				},
				error : function(data, status, er) {
					alert("No Shipping addresses available.");
				}
			});
		}
		function displayAddresses(data){
			
			var addressTable = '';
			addressTable = addressTable +'<table class="border" border="1" cellpadding="2">';
			addressTable = addressTable +'<tr>';
			addressTable = addressTable +'<td>';
			addressTable = addressTable + '<label for="datetimepicker">Delivary Date  Time:</label>';
			addressTable = addressTable +'</td>';
			addressTable = addressTable +'<td>';
			addressTable = addressTable + '<input id="datetimepicker" type="text" style="width:120px" placeholder="MM/dd/yyyy HH:mm:ss"/>';
			addressTable = addressTable +'</td>';
			addressTable = addressTable +'</tr>';
			$.each(data, function(idx, address) {
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +"<td><input type='radio' name='address' value='"+address.id+"'></td>";
				addressTable = addressTable +'<td>';
				addressTable = addressTable +'<table>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"FirstName : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.firstName;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"LastName : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.lastName;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Address1 : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.address1;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Address2 : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.address2;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Address3 : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.address3;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"City : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.city.name;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"State : "+address.state.name+"<br/>";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.state.name;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Postalcode : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.postalcode;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Phone : "+address.phone+"<br/>";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.phone;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'<tr>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable +"Email : ";
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'<td>';
				addressTable = addressTable + address.email;
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
				addressTable = addressTable +'</table>';
				addressTable = addressTable +'</td>';
				addressTable = addressTable +'</tr>';
		
			});
			addressTable = addressTable +'</table>';
			return addressTable;
		}
		function formatJSONDate(jsonDate) {
			  var newDate = dateFormat(jsonDate, "mm/dd/yyyy");
			  return newDate;
		}
		function buildOrderedHistoryDropdown(orders) {
			var ordersLen = orders.length;
			var ordersHtml = "<select id='orderHistory' class='menuSelect'>";
			ordersHtml = ordersHtml
					+ "<option value=''>Select Retailer</option>";
			for ( var j = 0; j < ordersLen; j++) {
				var order = orders[j];
				//var date = order.creationDate;
				 //var substringedDate = date.substring(6); //substringedDate= 1291548407008)/
			     //   var parsedIntDate = parseInt(substringedDate); //parsedIntDate= 1291548407008
			     //   var parseddate = new Date(parsedIntDate);  // parsedIntDate passed to date constructor
				ordersHtml = ordersHtml + "<option value='"+order.id+"'>"
				+order.orderNumber+" ("+order.creationDate+") "+ "</option>";
				//alert(formatJSONDate(order.creationDate));
			}
			if (ordersHtml == '') {
				ordersHtml = "<option value=''></option>";
			}
			ordersHtml = ordersHtml + '</select>';
			document.getElementById('orderHistoryA').innerHTML = ordersHtml;
			return ordersHtml;
		}
		//dialogue
		$(function() {
			var retailer = address = $("#address"), dateTime = $("#datetimepicker"), allFields = $(
					[]).add(retailer).add(address)
					.add(dateTime), tips = $(".validateTips");
			// alert(retailer);
			function updateTips(t) {
				tips.text(t).addClass("ui-state-highlight");
				setTimeout(function() {
					tips.removeClass("ui-state-highlight", 1500);
				}, 500);
			}

			function checkLength(o, n, min, max) {
				if (o.val().length > max || o.val().length < min) {
					o.addClass("ui-state-error");
					updateTips("Length of " + n + " must be between " + min
							+ " and " + max + ".");
					return false;
				} else {
					return true;
				}
			}

			function checkRegexp(o, regexp, n) {
				if (!(regexp.test(o.val()))) {
					o.addClass("ui-state-error");
					updateTips(n);
					return false;
				} else {
					return true;
				}
			}
			
			$("#dialog-form").dialog({
				autoOpen : false,
				height : 500,
				width : 500,
				modal : true,
				buttons : {
					"Check Out" : function() {
						var bValid = true;
						allFields.removeClass("ui-state-error");
						checkout(allFields);
					},
					Cancel : function() {
						$(this).dialog("close");
					}
				},
				close : function() {
					allFields.val("").removeClass("ui-state-error");
				}
			});
			
			$("#login-dialog-form").dialog({
				autoOpen : false,
				height : 200,
				width : 300,
				modal : true,
				buttons : {
					"SignUp" : function() {
						//type: "submit";
						$("#login-dialog-form").dialog("close");
						$("#signUp-dialog-form").dialog("open");
					},
					"Login" : function() {
						//var bValid = true;
						//allFields.removeClass("ui-state-error");
						//type: "submit";
						login();
					},
					Cancel : function() {
						$("#login-dialog-form").dialog("close");
					}
				},
				close : function() {
					//allFields.val("").removeClass("ui-state-error");
				}
			});
			
			//date picker
			$("#datetimepicker").datetimepicker();
			
			
			

		});
</script>

</body>
</html>
