<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%  
session.invalidate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.js"></script>
   <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
   <script src="${pageContext.request.contextPath}/js/html5.js"></script>

<title>Logout</title>
</head>
<body style='width:800px;margin:10px;'>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title" style='padding-left:10px;'>Logout Successful</h3>
    </div>
    <div class="panel-body">You have been logged out of the system, Click here to <a href="${pageContext.request.contextPath}/retailer/">Login</a>.</div>
</div>


</body>
</html>