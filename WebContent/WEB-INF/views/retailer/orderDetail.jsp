<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tresfocus.com/closerby/myFunctions" prefix="myFunc" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Order Details</title>
		
	<style type="text/css" title="currentStyle">
		@import "${pageContext.request.contextPath}/css/home.css";
		@import "${pageContext.request.contextPath}/css/header.css";
		@import "${pageContext.request.contextPath}/css/superfish.css";
		@import "${pageContext.request.contextPath}/css/table_jui.css";
		@import "${pageContext.request.contextPath}/css/themes/smoothness/jquery-ui.css";
		@import "${pageContext.request.contextPath}/css/TableTools.css";
	</style>
	 <style>
	 	#ohImg, #odImg, #prodImg{
	 		width:20px;
	 		height:20px;
	 		cursor: pointer;
	 	}
	 	
	 	.phone-icon{
	 		width:16px;
	 		height:16px;
	 		vertical-align:bottom;
	 		padding-right:10px;
	 	}
	 	
	 	.mail-icon{
	 		width:16px;
	 		height:16px;
	 		vertical-align:bottom;
	 		padding-right:10px;
	 	}
	 	
	</style>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.editable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.editable.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.corner.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.ext.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/superfish.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ZeroClipboard.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/TableTools.js"></script>

	<script type="text/javascript" charset="utf-8">
		var minusImgLoc = '${pageContext.request.contextPath}/images/minus.png';
		var plusImgLoc = '${pageContext.request.contextPath}/images/plus.png';
		var isEditable = '${isPackagingStatus}';
		var oTable = null;
				
		$(document).ready( function () {
			oTable = $('#orderTable').dataTable( {
				 "bJQueryUI": true,
				 "sScrollY": 200,
				 "iDisplayLength": 5, 
				 "sServerMethod": "POST",
				 "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
				 "sAjaxSource": "${pageContext.request.contextPath}/retailer/OrderLinesDataByOrderId.shx?orderId=${order.id}",
				 "aoColumns": [
					          { "mData": "id", "bVisible": false},
				              { "mData": "version", "bVisible": false},
				              { "mData": "orderId", "bVisible": false},
				              { "mData": "productId", "bVisible": false},
		              		  { "mData": "productName", 
			              		"mRender": function ( data, type, full ) {
				                  			     return "<a href='${pageContext.request.contextPath}/retailer/productDetail.jsp?id=" + 
				                  			            full.productId +"'>" + data + "</a>";
				              		       }
			                  },
				              { "mData": "category"},
				              { "mData": "quantity" },
				              { "mData": "packaged" },
				              { "mData": "price" },
				              { "mData": "discount" },
				              { "mData": "total" },
				          ],
						  "sPaginationType": "full_numbers",
						  "fnRowCallback": function( nRow, aData, iDisplayIndex ) { //mark the needed reco id							 
				             $(nRow).attr('id', aData.id ); 	
				             $(nRow).attr('version', aData.version ); 	
				             return nRow;
				          },
				  "fnFooterCallback": function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
					/*
					 * Calculate the total market share for all browsers in this table (ie inc. outside
					 * the pagination)
					 */
					var iTotal = 0;
					for ( var i=0 ; i<aaData.length ; i++ ) {
						iTotal += aaData[i].total;
					}
					
					/* Calculate the market share for browsers on this page */
					var iPageTotal = 0;
					for ( var i=iStart ; i<iEnd ; i++ ) {
						iPageTotal += aaData[ aiDisplay[i] ].total;
					}
					
					/* Modify the footer row to match what we want */
					var nCells = nRow.getElementsByTagName('th');
					nCells[0].innerHTML = "<div style='padding-right:20px;display:inline;'><span class='bold'>Page Total: </span>" + iPageTotal + "</div>" +
					                      "<div style='padding-right:20px;display:inline;'><span class='bold'>Grand Total: </span>" + iTotal + "</div>";
				}
			
			});

			if(isEditable){
				oTable.makeEditable( {
			    sUpdateURL: "https://${OPENSHIFT_INTERNAL_IP}/closerby/retailer/EditOrderLinesData.shx",					
			    fnOnEditing: function(input) {  
			    	currentKey = input.parents("tr").attr("id");
			        version = input.parents("tr").attr("version");
			        return true;
			    },
			    fnOnEdited: function() {
				    oTable.fnReloadAjax("${pageContext.request.contextPath}/retailer/OrderLinesDataByOrderId.shx?orderId=${order.id}");
				},
			    oUpdateParameters: { 
			    	orderLineId: function() { 
			            return currentKey; 
			        },
			        version: function() { 
			            return version; 
			        }
			    },
			    "aoColumns": [
				              null,
				              null,
				              null,
				              {     
					                indicator: 'Saving...',
	                                tooltip:   'Click to Edit',
	                                onblur:    'cancel',
	                                submit:    'OK'	                                
								  },
				              null,
				              null,
				              null,
				          ]
		
				});
			}

			$('#historyTable').dataTable( {
				 "sScrollX": "100%",
				 "bJQueryUI": true,
				 "sScrollY": 200,
				 "sServerMethod": "GET",
				 "bScrollCollapse": true,
			     "bPaginate": false,
				 "bFilter": false,
				 "bLengthChange": false, 
				 "bSort": false,
				 "bInfo": false,
				 "sAjaxSource": "${pageContext.request.contextPath}/retailer/OrderHistoryByOrderId.shx?orderId=${order.id}",
				 "aoColumns": [
					              { "mData": "id", "bVisible": false},
					              { "mData": "from"},
					              { "mData": "comments"},
					              { "mData": "status"},
					              { "mData": "creationDate"}
				              ]
			 });

		 	$( "#action" )
				 .button()
				 .click(function() {

					$( "#dialog-form" ).dialog({
						 autoOpen: false,
						 title: "Order: ${nextPositiveStatus}",
						 height: 300,
						 width: 350,
						 modal: true,
						 buttons: {
							 "${nextPositiveStatus}": function() {
								 $( "#comments" ).removeClass( "ui-state-error" );
								 if ( !isEmpty($( "#comments" ), "comments") ) {
									 if(createComments( $( "#comments" ).val(), "${nextPositiveStatusCode}")){
									 	$( "#refreshForm" ).submit();
									 }else{
										 alert("Error updating the comments. Please contact Administrator.");
									 }
								 	$( this ).dialog( "close" );
								  }
							 },
							 
							 Cancel: function() {
							 	$( this ).dialog( "close" );
							 }
						 },
						 
						 close: function() {
							 $( "#comments" ).removeClass( "ui-state-error" );
						 }
				   });
				 	$( "#dialog-form" ).dialog( "open" );
			 });

		 	$( "#reject" )
			 .button()
			 .click(function() {
				$( "#dialog-form" ).dialog({
					 autoOpen: false,
					 title: "Reject Order",
					 height: 300,
					 width: 350,
					 modal: true,
					 buttons: {
						 'Reject Order' : function() {
							 $( "#comments" ).removeClass( "ui-state-error" );
							 if ( !isEmpty($( "#comments" ), "comments") ) {
								 if(createComments($("#comments").val(), '${rejectedStatus}')){
								 	$( "#refreshForm" ).submit();
								 }else{
									 alert("Error updating the comments. Please contact Administrator.");
								 }
							 	$( this ).dialog( "close" );
							  }
						 },
						 
						 Cancel: function() {
						 	$( this ).dialog( "close" );
						 }
					 },
					 
					 close: function() {
						 $( "#comments" ).removeClass( "ui-state-error" );
					 }
			   });
			 	$( "#dialog-form" ).dialog( "open" );
		 	});


		 	$("#odImg").click(function(){
		 		  if($("#odImg").attr("src") == minusImgLoc)
		 		  	$("#odImg").attr("src", plusImgLoc);
		 		  else
		 			 $("#odImg").attr("src",minusImgLoc);  
		 			 
		 		  $("#orderDetailDiv").toggle(1000);
		 	});

		 	$("#back").button()
			 .click(function() {
		 		parent.history.back();
		        return false;
		 	});

		 	$("#ohImg").click(function(){
		 		  if($("#ohImg").attr("src") == minusImgLoc)
		 		  	$("#ohImg").attr("src", plusImgLoc);
		 		  else
		 			 $("#ohImg").attr("src",minusImgLoc);  
		 			 
		 		  $("#orderHistoryDiv").toggle(1000);
		 	});
		 	
		 	$("#ohImg").attr("src", plusImgLoc);
		 	$("#orderHistoryDiv").toggle();
		 	
		 	$("#prodImg").click(function(){
		 		  if($("#prodImg").attr("src") == minusImgLoc)
		 		  	$("#prodImg").attr("src", plusImgLoc);
		 		  else
		 			 $("#prodImg").attr("src",minusImgLoc);  
		 			 
		 		  $("#productDiv").toggle(1000);
		 	});

		 	$('#logoutLink').click(function(event){
		 		var f = document.createElement("FORM");
		 	    f.action = "${pageContext.request.contextPath}/retailer/home.jsp";
		 	    f.method = "POST";
		 	    
 	            var input = document.createElement("INPUT");
 	            input.type="hidden";
 	            input.name  = "removeSession";
 	            input.value = "true";
		 	    f.appendChild(input);

		 	    document.body.appendChild(f);
		 	    f.submit();
		    });

		 	$('#billaddressRoundDiv').corner("round 8px").parent().css('padding', '4px').corner("round 10px");
		 	$('#shipaddressRoundDiv').corner("round 8px").parent().css('padding', '4px').corner("round 10px");
		 	$('#orderDetailsRoundDiv').corner("round 8px").parent().css('padding', '4px').corner("round 10px");
		 		
		});

		function createComments(comment, status){
			var returnStatus = true;
			$.ajax({
				type: "POST",
				async: false,
				url: "${pageContext.request.contextPath}/retailer/UpdateOrderStatus.shx",
				data: { orderId: "${order.id}", objectVersionNumber: "${order.objectVersionNumber}", status: status, comments: comment}
			}).done(function( msg ) {
				returnStatus = true;
			}).error(function(jqXHR, exception) {
	            if (jqXHR.status == 0) {
	                alert('Not connect.\n Verify Network.');
	            } else if (jqXHR.status == 404) {
	                alert('Requested page not found. [404]');
	            } else if (jqXHR.status == 500) {
	                alert('Internal Server Error [500].');
	            } else if (exception === 'parsererror') {
	                alert('Requested JSON parse failed.');
	            } else if (exception === 'timeout') {
	                alert('Time out error.');
	            } else if (exception === 'abort') {
	                alert('Ajax request aborted.');
	            } else {
	                alert('Uncaught Error.\n' + jqXHR.responseText);
	            }
	            returnStatus = false;
	        });	

            return returnStatus;
		}

		function isEmpty( o, n ) {
			 if ( o.val().length <= 0 ) {
				 o.addClass( "ui-state-error" );
				 updateTips( "Comments cannot be empty." );
				 return true;
			 } else {
			 	return false;
			 }
		 }

		 function updateTips( t ) {
			 $( ".validateTips" )
			 .text( t )
			 .addClass( "ui-state-highlight" );
			 setTimeout(function() {
				 $( ".validateTips" ).removeClass( "ui-state-highlight", 1500 );
			 }, 500 );
		 }

		</script>
	</head>
	<body>
		<jsp:include page="../header.jsp"/> 
		<div id="accordion">
			<h1 style='width:900px;background-color:#CCC;padding-left:10px;'><img id='odImg' src="${pageContext.request.contextPath}/images/minus.png"/><span style='padding-left:10px;'>Order Details</span></h1>	
			<div id='orderDetailDiv'>	
				<table cellspacing='2' cellpadding='2' border='0' style='width:900px;'>
					<tr>
						<td style='vertical-align:top;'>
							<div id='orderDetailsRoundDiv' style='background:black;padding:5px;margin:0px;height:270px;'>
								<div style='height:269px;background:white;'>
									<table cellspacing='3' cellpadding='2' border='0' style='width:440px;background:white;'>									
										<tr>
											<td colspan='2'>
												<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" style='width:100%; height:20px;'>
										      		<span id="ui-dialog-title-dialog" class="ui-dialog-title" style='font-size:14px;padding-left:10px;'>Order Information</span>
										   		</div> 
										   	</td>
										</tr>
										<tr>
											<td class='bold'>Customer:</td>
											<td>${myFunc:getUserName(order.addressByBillingAddressId.firstName, order.addressByBillingAddressId.lastName)}
										    </td>
										</tr>
										<tr>
											<td class='bold'>Status:</td>
											<td>${currentStatus}</td>
										</tr>
										<tr>
											<td class='bold'>Delivery Time:</td>
											<td>${order.expectedDeliveryTime}</td>
										</tr>
										<tr>
											<td class='bold'>Bill Amount:</td>
											<td>${order.itemValue}</td>
										</tr>
										<tr>
											<td class='bold'>Comments:</td>
											<td>${order.comments}</td>
										</tr>
									</table>
								</div>
							</div>
						</td>
						<td style='vertical-align:top;'>
							<table cellspacing='0' cellpadding='0' border='0' style='width:440px;margin:0px;'>
								<tr>
									<td>
										<div id='billaddressRoundDiv' style='background:black;padding:5px;margin:0px;'>
											<table style='width:100%;background:white;'>
												<tr>
													<td>
														<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" style='width:100%; height:20px;'>
												      		<span id="ui-dialog-title-dialog" class="ui-dialog-title" style='font-size:14px;padding-left:10px;'>Billing Address</span>
												   		</div> 
												   	</td>
												</tr>
												<tr>
													<td class='bold'>Billing Address:</td>
												</tr>
												<tr>
													<td>${myFunc:getAddress(order.addressByBillingAddressId)}</td>
												</tr>
												<tr>
													<td><img class='phone-icon' src='${pageContext.request.contextPath}/images/phone.png'/>${order.addressByBillingAddressId.phone}</td>
												</tr>
												<tr>
													<td><img class='mail-icon' src='${pageContext.request.contextPath}/images/mail.png'/>${order.addressByBillingAddressId.email}</td>
												</tr>
											</table>
										</div>
										
									</td>
								</tr>
								<tr>
									<td>
										<div id='shipaddressRoundDiv' style='background:black;padding:5px;'>
											<table style='width:100%;background:white;'>
												<tr>
													<td>
														<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" style='width:100%; height:20px;'>
												      		<span id="ui-dialog-title-dialog" class="ui-dialog-title" style='font-size:14px;padding-left:10px;'>Shipping Address</span>
												   		</div> 
												   	</td>
												</tr>
												<tr>
													<td>${myFunc:getAddress(order.addressByShippingAddressId)}</td>
												</tr>
												<tr>
													<td><img class='phone-icon' src='${pageContext.request.contextPath}/images/phone.png'/>${order.addressByShippingAddressId.phone}</td>
												</tr>
												<tr>
													<td><img class='mail-icon' src='${pageContext.request.contextPath}/images/mail.png'/>${order.addressByShippingAddressId.email}</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				
				<div id='big-space'></div> 
				<div>
					<table style='padding:2px;'>
						<tr>
							<td><button id='back' name='back'>Back</button></td>
				 
							<td><button id='action' ${(!displayActionButtons)?" style='display:none;visibility:hidden;'":"" } name='${nextPositiveStatus}'>${nextPositiveStatus }</button></td>
							<td><button id='reject' ${(!displayActionButtons)?" style='display:none;visibility:hidden;'":"" }>${rejectedLabel}</button></td>
						</tr>
					</table>
				</div> 
			</div>			
			
			<h1 style='width:900px;background-color:#CCC;padding-left:10px;'><img id='ohImg' src="${pageContext.request.contextPath}/images/minus.png"/><span style='padding-left:10px;'>Order History</span></h1>	
			<div id='orderHistoryDiv'>
				<div id='historyTableDiv' style='width:900px;'>
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="historyTable">
						<thead>
							<tr>
								<th>History Id</th>
								<th>Name</th>
								<th>Comments</th>
								<th>Status</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>		
				</div>
				
				<div id='big-space'></div>
			</div>
			
			<h1 style='width:900px;background-color:#CCC;padding-left:10px;'><img id='prodImg' src="${pageContext.request.contextPath}/images/minus.png"/><span style='padding-left:10px;'>Products</span></h1>	
			<div id='productDiv'>
				<div id='orderTableDiv' style='width:900px'>
					<table cellpadding="0" cellspacing="0" border="0" class="display" id="orderTable">
						<thead>
							<tr>
								<th>id</th>
								<th>version</th>
								<th>Order Id</th>
								<th>Product Id</th>
								<th width='30%'>Product Description</th>
								<th width='30%'>Category</th>
								<th>Quantity</th>
								<th>Packaged</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan='11' class='bold' style='text-align:right;'>Page Total:</th>
							</tr>
							<tr>
								<th>id</th>
								<th>version</th>
								<th>Order Id</th>
								<th>Product Id</th>
								<th width='30%'>Product Description</th>
								<th width='30%'>Category</th>
								<th>Quantity</th>
								<th>Packaged</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Amount</th>
							</tr>
						</tfoot>
						<tbody>
						</tbody>
					</table>		
				</div>
			</div>
		</div>
		
		<div id="dialog-form" title="Order:" style="visible:hidden;display:none">
			<p class="validateTips">All form fields are required.</p>
			<form id='dialogForm' method="get" action='${pageContext.request.contextPath}/retailer/updateOrderStatus.shx'>
				<input type="hidden" name="orderId" value="${order.id}"/>
				<input type="hidden" name="version" value="${order.objectVersionNumber}"/>
				
				<table>
					<tr><td style='text-align:left;'>
					<p style='text-align:left;'>Comments</p>
					</td></tr>
					<tr><td>
					<textarea rows='5' cols="41" name="comments" id="comments" class="text ui-widget-content ui-corner-all"></textarea>
					</td></tr>
				</table>
			</form>
		</div>
		
		<div id="refreshFormDiv" style="visible:hidden;display:none">
			<form id='refreshForm' method="get" action='${pageContext.request.contextPath}/retailer/orderDetail.shx'>
				<input type="hidden" name="orderId" value="${order.id}"/>
			</form>
		</div>
		
	</body>
</html>