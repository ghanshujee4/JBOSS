<!DOCTYPE html SYSTEM "http://www.thymeleaf.org/dtd/xhtml1-strict-thymeleaf-4.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">

  <head>
    <title>CloserBy Order Confirmation: ${orderNumber}</title>
    <style>
	    #medium-space {
			clear: both;
			height: 10px;
		}
    </style>
 	<script type="text/javascript" th:src="|${serverAddress}/closerby/js/jquery-1.11.0.min.js|"></script>
 	<script type="text/javascript" th:src="|${serverAddress}/closerby/js/jquery.corner.js|"></script>
  </head>

  <body>
	<div style='margin:0px;padding:0px;'>
		<img style='width:70px;height:50px;vertical-align:top' src="../images/cart.png"/><span style='display:inline-block;font-family: Papyrus, fantasy;font-size:40px;font-weight:bold;'>Closer By</span>
	</div>
	
	<span style='color:red;font-weight:bold;'>You do not have permission to view this record. Pleace click <a href='/closerby/web/home.jsp'>here</a> to go back.</span>
	
</body>
</html>


