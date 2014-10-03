<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.tresfocus.ekart.IConstants, com.tresfocus.ekart.ObjectTypeEnum, java.util.List, java.util.Arrays" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Tester</title>
<script type="text/javascript" src="/closerby/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
/*		
	$( "#jsonBtn" ).click(function() {
		var id = $('#id').val();
		$.ajax({
			  type: "GET",
			  url: "/closerby/rest/svcprocess/user?id="+ id + "&type=json",
			  dataType: "text",
			  context: document.body,
			  accepts: "application/json"
			}).success(function(returnData) {
				 $('#textArea').val(returnData);
			});
		});
	
	$( "#xmlBtn" ).click(function() {
		var id = $('#id').val();
		$.ajax({
			  type: "GET",
			  url: "/closerby/rest/svcprocess/user?id="+ id + "&type=xml",
			  dataType: "text",
			  context: document.body,
			  accepts: "application/xml"
			}).success(function(returnData) {
			 	$('#textArea').val(returnData);
			});
		});
*/
	$( "#Execute" ).click(function() {
		var payload = $('#inputTextArea').val();
		var object = $('#object').val();
		var operation = $('#operation').val();
		var uname = $('#uname').val();
		var password = $('#password').val();
		var ioFormat = 'xml';
		var contentType = "application/xml";
		
		var selectedContentType = $("input[type='radio'][name='ioType']:checked");
		if (selectedContentType.length > 0) {
			ioFormat = selectedContentType.val();
		}

		if(ioFormat == 'json')
			contentType = "application/json";
		
		$.ajax({
			  type: "POST",
			  url: "https://${OPENSHIFT_INTERNAL_IP}/closerby/rest/svcprocess.shx?",
			  data: "type=" + object + "&operation=" + operation + "&ioFormat=" + ioFormat +
			        "&j_username=" + uname + "&j_password=" + password + "&payload=" + payload,
			  dataType: "text",
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			  accepts: "text/plain"
			}).success(function(returnData) {
			 	$('#outputTextArea').val(returnData);
			}).error(function(jqXHR, exception) {

				if (jqXHR.status === 0) {
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

	            var errorData = jqXHR.status;
	            errorData += "\n" + exception;
	            errorData += "\n" + jqXHR.responseText
	            
				$('#outputTextArea').val(errorData);

			});
		});
/*
	$( "#ObjectJsonBtn" ).click(function() {
		var data = $('#textArea').val();
		$.ajax({
			  type: "POST",
			  url: "/closerby/rest/svcprocess",
			  data: data,
			  dataType: "text",
			  contentType: "application/json",
			  accepts: "application/json"
			}).success(function(returnData) {
			 	$('#textArea').val(returnData);
			});
		});

	*/
});
</script>
</head>
<body>
<div style='width:900px;border:2px solid black;margin:5px;padding:10px;'>
	<div id="display" >
		<fieldset style='margin-left:auto; margin-right:auto; width:400px;'>
			<legend>CloserBy:</legend>
			<table cellspacing='5' cellpadding='5'>
				<tr>
					<td>Object</td>
					<td>	
						<select id='object'>
					<%
						List<ObjectTypeEnum> enumList = Arrays.asList(ObjectTypeEnum.values());
						for(ObjectTypeEnum enumObj : enumList){
					%>
						  <option value='<%=enumObj.getName()%>'><%=enumObj.getDescription()%></option>
					<%
						}
					%>
						</select>
					</td>
				</tr>
				<tr>
					<td>Operation</td>
					<td>	
						<select id='operation'>
						  <option value="<%=IConstants.OPERATION_FIND%>">Find</option>
						  <option value="<%=IConstants.OPERATION_UPSERT%>">Create</option>
						  <option value="<%=IConstants.OPERATION_UPSERT%>">Update</option>
						  <option value="<%=IConstants.OPERATION_DELETE%>">Delete</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" id="uname" name="uname"/></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" id="password" name="password"/></td>
				</tr>
				<tr>
					<td>Input/Output</td>
					<td><input type="radio" checked="checked" name="ioType" value="xml"/>XML
						<input type="radio" name="ioType" value="json" />JSON
					</td>
				</tr>
			</table>
			<BR/>
			<button id='Execute' name='Execute'>Execute</button>
		</fieldset>
	</div>
	<div style='padding-top:10px;'>
		<div style='float:left;margin-right:30px;'>
			<label>Input:</label><BR/>
			<textarea id="inputTextArea" rows="30" cols="50"></textarea>
		</div>
		<div>
			<label>Output:</label><BR/>
			<textarea id="outputTextArea" readonly="readonly" rows="30" cols="50"></textarea>
		</div>
	</div>
</div>
</body>
</html>