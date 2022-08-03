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
	<br>
	<div class="view"><br><br>DP & DS<br><br><br></div>
	<br><br><br>
	<center>
	<form action="avail_ticket.jsp" method="post">
	Departure Place:<input type="text" name="dep"/><br><br>
	Destination Place:<input type="text" name="des"/><br><br>
	<input type="submit" >	
	</form>
	<br><br>
<center><p>${message}</p>
	<br><br>
	<a href="#" onclick="javascript:window.history.back(-1);return false;">Back</a>
	</center>
</body>
</html> 