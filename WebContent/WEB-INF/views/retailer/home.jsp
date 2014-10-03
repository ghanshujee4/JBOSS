<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.tresfocus.ekart.IConstants" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Orders</title>

<style type="text/css" title="currentStyle">
	@import "${pageContext.request.contextPath}/css/home.css";
	@import "${pageContext.request.contextPath}/css/style.css";
	@import "${pageContext.request.contextPath}/css/header.css";
	@import "${pageContext.request.contextPath}/css/superfish.css";
	@import "${pageContext.request.contextPath}/css/table_jui.css";
	@import "${pageContext.request.contextPath}/css/themes/smoothness/jquery-ui-1.8.4.custom.css";
	@import "${pageContext.request.contextPath}/css/TableTools.css";
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/TableTools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/hoverIntent.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#orderTable').dataTable({
			"bJQueryUI" : true,
			"sScrollY" : 410,
			"iDisplayLength" : 15,
			"aLengthMenu" : [ [ 15, 25, 50, -1 ], [ 15, 25, 50, "All" ] ],
			"sAjaxSource": "${pageContext.request.contextPath}/retailer/myOrdersByStatus.shx?osb=${orderedStatus}",
			"aoColumns": [
			              { "mData": "id", "bVisible": false},
	              		  { 
			            	"mData": "isNew",
			            	'bSortable': false,
			            	'bSearchable': false,
		            	    "mRender": function ( data, type, full ) {
			            	    if(data){
	                  			     return "<div width='100%'>" +
				       			     			"<img style='display:block; margin:auto;' src='${pageContext.request.contextPath}/images/new.png'/>" + 
	                  			     		"</div>";
	              		        	}
			              		else if(full.status === "Ordered"){
			              			return "<div width='100%'>" +
	       			     						"<img style='display:block; margin:auto;' src='${pageContext.request.contextPath}/images/new_ordered.png'/>" + 
          			     					"</div>";
				              	}else{
				              		return "";
				              	}
		            	    }
	              		  },
	              		  { 
				            	"mData": "priority",
				            	'bSearchable': false,
			            	    "mRender": function ( data, type, full ) {
			            	    	return  "<div width='100%'>" +
		                  			   			getPriorityDiv(full.id, data, 1) + 
		                  			   			getPriorityDiv(full.id, data, 2) + 
		                  			   			getPriorityDiv(full.id, data, 3) + 
		                  			   			getPriorityDiv(full.id, data, 4) + 
		                  			   			getPriorityDiv(full.id, data, 5) + 
           			     					"</div>";
	              		        	}
		              	  },
		              	  {
			              	"mData": "orderNum", 
		              		"mRender": function ( data, type, full ) {
			                  			     return "<a href='${pageContext.request.contextPath}/retailer/orderDetail.shx?orderId=" + 
			                  			            full.id +"'>" + data + "</a>";
			              		       }
		                  },
			              { "mData": "address" },
			              { "mData": "deliverytime", "sClass": "alignRight" },
			              { "mData": "amount", "sClass": "alignRight" },
			              { "mData": "status" }
			          ],
			"sPaginationType" : "full_numbers"
		});

		$( "#orderStatusSelect" ).change(function() {
			$('#orderTable').dataTable().fnReloadAjax( '${pageContext.request.contextPath}/retailer/myOrdersByStatus.shx?osb=' + $(this).val());
		});

		$('#orderTable').dataTable().fnReloadAjax( '${pageContext.request.contextPath}/retailer/myOrdersByStatus.shx?osb=' + $("#orderStatusSelect").val());
	});

	function updatePriority(url){
		$.post(url, function() {
			//alert( "success" );
			})
			.done(function() {
				//alert( "done" );
				reFresh();
			})
			.fail(function() {
				alert( "error" );
			})
			.always(function() {
				//alert( "finished" );
			});	    
    }


	function getPriorityDiv(orderId, priority, idx) {
		var onLinkClick = '${pageContext.request.contextPath}/retailer/UpdateOrderPriority.shx?orderId=' + orderId + '&priority=' + idx;
		if(idx <= priority)
			return  "<div style='float:left;'>" +
					   "<a href='javascript:void();' onclick='updatePriority(\"" + onLinkClick + "\")'>"  +
					   		"<img src='${pageContext.request.contextPath}/images/star_selected.png' style='cursor:pointer;'/>" +
					   "</a>" +
				   "</div>";
		else
			return "<div style='float:left;'>" +
			   			"<a href='javascript:void();' onclick='updatePriority(\"" + onLinkClick + "\")'>"  +
					   		"<img src='${pageContext.request.contextPath}/images/star_unselected.png' style='cursor:pointer;'/>" +
					   "</a>" +
				   "</div>";
	}

	function reFresh() {
		$('#orderTable').dataTable().fnReloadAjax( '${pageContext.request.contextPath}/retailer/myOrdersByStatus.shx?osb=' + $("#orderStatusSelect").val());
	}
	/* Set the number below to the amount of delay, in milliseconds,
	you want between page reloads: 1 minute = 60000 milliseconds. */
	window.setInterval("reFresh()",30000);
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/> 

	<div id="bodyContainer">
		<div id="shadowContainer"></div>
		<div id='space'></div>
		<div>
			<H2 style="padding-left: 20px">My Orders</H2>
		</div>
		<div id='space'></div>
		<div>
			<table>
				<tr>
					<td><B>Order Status:</B></td>
					<td>
						<select id='orderStatusSelect'>
						<c:forEach items="${lookupTypes}" var="lookup">
						<c:set var="selected" value="${fn:containsIgnoreCase(lookup.key, orderedStatus)? 'selected=\"selected\"' : ''}" />
						
							<option <c:out value="${selected}"/> value='<c:out value="${lookup.key}"/>'>
								<c:out value="${lookup.value}"/>
							</option>
						</c:forEach>
						</select>
				   </td>
				</tr>
			</table>
		</div>
		<div id='space'></div>

		<table cellpadding="0" cellspacing="0" border="0" class="display"
			id="orderTable">
			<thead>
				<tr>
					<th>Id</th>
					<th></th>
					<th width="135">Priority</th>
					<th>Order Number</th>
					<th width="30%">Address</th>
					<th>Delivery Time</th>
					<th>Bill Amount(&#8377;)</th>
					<th width="12%">Status</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Id</th>
					<th></th>
					<th width="135">Priority</th>
					<th>Order Number</th>
					<th width="30%">Address</th>
					<th>Delivery Date</th>
					<th>Bill Amount(&#8377;)</th>
					<th width="12%">Status</th>
				</tr>
			</tfoot>
		</table>

	</div>
</body>
</html>