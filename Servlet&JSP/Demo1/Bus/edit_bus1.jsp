<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Bus Details</title>
</head>
<body bgcolor="Lightskyblue">
    <br>
    <br><br><br><br>
    <center><h2>Edit Bus Details</h2></center>
   <form method="post" action="edit_bus2.jsp">
        <center>
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2" align ="left">Register Bus Here</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Enter Bus number want to update</td>
                    <td><input type="text" name="bus_number" value="" /></td>
                </tr>
                <tr>
                    <td>Edit Bus Name</td>
                    <td><input type="text" name="bus_name" value="" /></td>
                </tr>
                <tr>
                    <td>Edit number of seats</td>
                    <td><input type="text" name="seats" value="" /></td>
                </tr>
                <tr>
                    <td>Enter Sleeper(y/n)</td>
                    <td><input type="text" name="sleeper" value="" /></td>
                </tr>
                <tr>
                    <td>Edit departure place</td>
                    <td><input type="text" name="dep" value="" /></td>
                </tr>
                <tr>
                    <td>Edit destination place</td>
                    <td><input type="text" name="des" value="" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Edit_Bus" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
                <tr>
                </tr>
            </tbody>
        </table>
        <p>${message}</p>
        </center>
    </form>
    <br>
<center><a href="#" style="color: black;" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</body>