<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
.view {
  text-align: center;
  border: 3px solid green;
}
</style>

</head>
<body>

	<div class="view"><br><br>Delete Bus<br><br><br></div>
	<br>
	<center><br><br><br>
	<form action="delete_bus2.jsp" method="get">
	Enter Bus no want to delete:<input type="text" name="bus_no"/>
	<input type="submit" >	
	</form>
	<p>${message}</p>
<br><br>
<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a></body>
</center>
</body>
</html> 