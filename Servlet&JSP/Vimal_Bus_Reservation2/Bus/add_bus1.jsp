<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="styles.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
<title>Vimal Travels</title>
    <style>
    .reg {
      text-align: center;
      border: 3px solid green;
      background-color: lightblue;
    }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      body {
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password] {
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 50%;

  border: none;
  color: white;
  padding: 25px 42px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

#l1,#l2,#slpr
{
  display: inline-block;  
}

</style>

<style >
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

    <div class="reg"><center><br><h3>Register Bus Here</h3><br></center></div>


<%
    //response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 

    out.println("<div style='position: absolute; top: 0; right: 1; width: 100px; text-align:right;'><br><br><br><br><br><br><br>");
    out.println("<a href='../logout_admin.jsp' style='font-size:20px;'>Logout</a><br>");
    out.println("</div>");

// response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
// response.setHeader("Pragma", "no-cache"); 
response.setDateHeader("Expires", 0);

if(session.getAttribute("userid")==null)
{
    response.sendRedirect("../index.html");
}
%>

    <br>
    <br>
   <form method="get" action="add_bus2.jsp">
    <center>
      <div class="formcontainer">
      <div class="container">
        <table align="center">
            <thead>
                <tr>
                    <th>Register Bus Here</th>
                    <center><p>Note : Bus Number should be start with 'b'<p></center>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Enter Bus Number</td>
                    <td><input type="text" name="bus_number" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Bus Name</td>
                    <td><input type="text" name="bus_name" value="" required/></td>
                </tr>
                <tr>
                    <td>AC</td>
                    <td><input type="radio" name="ac" value="Yes" required/>Yes</td>
                    <td><input type="radio" name="ac" value="No" required/>No</td>
                </tr>
                <tr>
                    <td>Enter departure place</td>
                    <td><input id="myInput" type="text" name="dep" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter destination place</td>
                    <td><input id="myInput1" type="text" name="des" value="" required/></td>
                </tr>
                <tr>
                    <td>Enter Price </td>
                    <td><input type="text" name="price" value="" required/></td>
                </tr>
<!--                 <tr>
                  <td><button type="submit">Add</button></td>
                  <div class="container" style="background-color: #eee">
                    <label style="padding-left: 15px">
                    </label>
                    <td><button type="reset" value="Reset">Reset</button></td>
                </tr> -->
            </div>
            </tbody>
        </table><br><br>


<center>
    <div class="navbar">

    <div class="dropdown">
    <button class="dropbtn" style="width:50%">Bus Seat Layout
      <i class="fa fa-caret-down"></i>
    </button>
<!--     <div class="dropdown-content">
      <a><button type="submit" name='layout1' value='2x3' id='lay1'>2X3</button></a>
      <a><button type="submit" name='layout2' value='2x2' id='lay2'>2X2</button></a>
  </div> --> 

<!--         <label for="gender"><strong>Gender</strong></label><br>
        <input type="radio" name="gender" value="Male" required/>Male
        <input type="radio" name="gender" value="Female" />Female -->

<div class="dropdown-content">
    <label for="seat-layout"><a><button type="submit" value='2x3' id='lay1'><input type="radio" id="sl1" name="layout" value="sl1" onclick='docheck(this)'>2X3</button></a></label>

    <label for="seat-layout"><a><button type="submit" value='2x2' id='lay2'><input type="radio" id="sl2" name="layout" value="sl2" onclick='docheck(this)'>2X2</button></a></label>

    <label for="seat-layout"><a><button type="submit" value='last_row' id='last_row'><input type="radio" id="last_row" name="last_row" value="last_row" onclick='docheck(this)'>Last Row</button></a></label>

    <label for="seat-layout"><a><button type="submit" value='sleeper1' id='sleeper1'><input type="radio" id="sleeper_radio" name="sleeper_radio" value="sleeper"  onclick='docheck(this)';>Sleeper - Lower Berth</button></a></label>

    <label for="seat-layout"><a><button type="submit" value='sleeper2' id='sleeper2'><input type="radio" id="sleeper_radio2" name="sleeper_radio2" value="sleeper2"  onclick='docheck(this)';>Sleeper - Upper Berth</button></a></label>
</div>

<!--  <input type="radio" id="html" name="fav_language" value="HTML">
 <label for="html">HTML</label><br>
 <input type="radio" id="css" name="fav_language" value="CSS">
 <label for="css">CSS</label><br>
 <input type="radio" id="javascript" name="fav_language" value="JavaScript">
 <label for="javascript">JavaScript</label> -->


    <table id='tbl'>
        <br>
    </table>
    </div>
    <br><br>
    <script>
      $(document).ready(function(){
        $("#lay1").click(function(){
        if ($(this).hasClass("active")) {
        $("#l1").remove();
        $("#lay1").removeClass("active");
      }
      // Else, the element doesn't have the active class, so we remove it from every element before applying it to the element that was clicked
      else {
        $("#lay1").removeClass("active");
          $("#l2").remove();
          var row=
"<table id='l1'><tr><td><input type=\"submit\" name=\"1\" value=\"1\"/></td><td><input type=\"submit\" name=\"2\" value=\"2\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"3\" value=\"3\"/></td><td><input type=\"submit\" name=\"4\" value=\"4\"/></td><td><input type=\"submit\" name=\"5\" value=\"5\"/></td></tr><tr><td><input type=\"submit\" name=\"6\" value=\"6\"/></td><td><input type=\"submit\" name=\"7\" value=\"7\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"8\" value=\"8\"/></td><td><input type=\"submit\" name=\"9\" value=\"9\"/></td><td><input type=\"submit\" name=\"10\" value=\"10\"/></td></tr><tr><td><input type=\"submit\" name=\"11\" value=\"11\"/></td><td><input type=\"submit\" name=\"12\" value=\"12\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"13\" value=\"13\"/></td><td><input type=\"submit\" name=\"14\" value=\"14\"/></td><td><input type=\"submit\" name=\"15\" value=\"15\"/></td></tr><tr><td><input type=\"submit\" name=\"16\" value=\"16\"/></td><td><input type=\"submit\" name=\"17\" value=\"17\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"18\" value=\"18\"/></td><td><input type=\"submit\" name=\"19\" value=\"19\"/></td><td><input type=\"submit\" name=\"20\" value=\"20\"/></td></tr><tr><td><input type=\"submit\" name=\"21\" value=\"21\"/></td><td><input type=\"submit\" name=\"22\" value=\"22\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"23\" value=\"23\"/></td><td><input type=\"submit\" name=\"24\" value=\"24\"/></td><td><input type=\"submit\" name=\"25\" value=\"25\"/></td></tr><tr><td><input type=\"submit\" name=\"26\" value=\"26\"/></td><td><input type=\"submit\" name=\"27\" value=\"27\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"28\" value=\"28\"/></td><td><input type=\"submit\" name=\"29\" value=\"29\"/></td><td><input type=\"submit\" name=\"30\" value=\"30\"/></td></tr><tr><td><input type=\"submit\" name=\"31\" value=\"31\"/></td><td><input type=\"submit\" name=\"32\" value=\"32\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"33\" value=\"33\"/></td><td><input type=\"submit\" name=\"34\" value=\"34\"/></td><td><input type=\"submit\" name=\"35\" value=\"35\"/></td></tr><tr><td><input type=\"submit\" name=\"36\" value=\"36\"/></td><td><input type=\"submit\" name=\"37\" value=\"37\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"38\" value=\"38\"/></td><td><input type=\"submit\" name=\"39\" value=\"39\"/></td><td><input type=\"submit\" name=\"40\" value=\"40\"/></td></tr><tr><td><input type=\"submit\" name=\"41\" value=\"41\"/></td><td><input type=\"submit\" name=\"42\" value=\"42\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"43\" value=\"43\"/></td><td><input type=\"submit\" name=\"44\" value=\"44\"/></td><td><input type=\"submit\" name=\"45\" value=\"45\"/></td></tr><tr><td><input type=\"submit\" name=\"46\" value=\"46\"/></td><td><input type=\"submit\" name=\"47\" value=\"47\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"48\" value=\"48\"/></td><td><input type=\"submit\" name=\"49\" value=\"49\"/></td><td><input type=\"submit\" name=\"50\" value=\"50\"/></td></tr></table>";

          $("#tbl").append(row);

          $(this).addClass("active");
        }
          // $('#clear1').on('click', function() {
          //   $("#l1").remove();
          //   cnt=0;
          // });

        });
//----------------------------------------------------------------------------------
  
//   $(function() {
//     $('#sleeper1').click(function() {
//                  var row=
// "<table style='text-align:left'; id='slpr'><tr><td><input type=\"submit\" name=\"51\" value=\"51\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"52\" value=\"52\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"53\" value=\"53\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"54\" value=\"54\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"55\" value=\"55\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"56\" value=\"56\" style='padding:32px 15px';/></td></tr></table>";
//     $("#tbl").append(row);
//        $(this).toggleClass('active');

//     });
// });

$("#sleeper1").click(function () {
  // If the clicked element has the active class, remove the active class from EVERY .nav-link>.state element
  if ($(this).hasClass("active")) {
    $("#slpr").remove();
    $("#sleeper1").removeClass("active");
  }
  // Else, the element doesn't have the active class, so we remove it from every element before applying it to the element that was clicked
  else {
    $("#sleeper1").removeClass("active");
                 var row=
"<table style='text-align:left'; id='slpr'><tr><td><input type=\"submit\" name=\"A\" value=\"A\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"B\" value=\"B\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"C\" value=\"C\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"D\" value=\"D\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"E\" value=\"E\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"F\" value=\"F\" style='padding:32px 15px';/></td></tr></table>";
    $("#tbl").append(row);

    $(this).addClass("active");
  }
});

$("#sleeper2").click(function () {
  // If the clicked element has the active class, remove the active class from EVERY .nav-link>.state element
  if ($(this).hasClass("active")) {
    $("#slpr").remove();
    $("#sleeper2").removeClass("active");
  }
  // Else, the element doesn't have the active class, so we remove it from every element before applying it to the element that was clicked
  else {
    $("#sleeper2").removeClass("active");
                 var row=
"<table style='text-align:left'; id='slpr'><tr><td><input type=\"submit\" name=\"G\" value=\"G\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"H\" value=\"H\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"I\" value=\"I\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"J\" value=\"J\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"K\" value=\"K\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"L\" value=\"L\" style='padding:32px 15px';/></td></tr></table>";
    $("#tbl").append(row);

    $(this).addClass("active");
  }
});

$("#last_row").click(function () {
  // If the clicked element has the active class, remove the active class from EVERY .nav-link>.state element
  if ($(this).hasClass("active")) {
    $("#last_row_sheets").remove();
    $("#last_row").removeClass("active");
  }
  // Else, the element doesn't have the active class, so we remove it from every element before applying it to the element that was clicked
  else {
    $("#last_row").removeClass("active");
                 var row=
    "<table id='last_row_sheets'><tr><td><input type=\"submit\" name=\"L1\" value=\"L1\"/></td><td><input type=\"submit\" name=\"L2\" value=\"L2\"/></td><td><input type=\"submit\" name=\"L3\" value=\"L3\"/></td><td><input type=\"submit\" name=\"L4\" value=\"L4\"/></td><td><input type=\"submit\" name=\"L5\" value=\"L5\"/></td></tr></table>";
    $("#tbl").append(row);

    $(this).addClass("active");
  }
});


//   $('#sleeper1').on('click', function () {

//   var sleepcnt = 1
//   //alert(cnt);
//   if(sleepcnt==1)
//   {
//           var row=
// "<table style='text-align:left'; id='slpr'><tr><td><input type=\"submit\" name=\"51\" value=\"51\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"52\" value=\"52\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"53\" value=\"53\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"54\" value=\"54\" style='padding:32px 15px';/></td></tr><tr><td><input type=\"submit\" name=\"55\" value=\"55\" style='padding:32px 15px';/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"56\" value=\"56\" style='padding:32px 15px';/></td></tr></table>";
//     $("#tbl").append(row);
//     }

//     $(this).toggleClass('open')
//     }); 

//-----------------------------------------------------------------------------------
$("#lay2").click(function(){
    if ($(this).hasClass("active")) {
      $("#l2").remove();
      $("#slpr").remove();
      $("#lay2").removeClass("active");
    }
    // Else, the element doesn't have the active class, so we remove it from every element before applying it to the element that was clicked
    else {
    $("#lay2").removeClass("active");
      $("#l2").remove();
      $("#slpr").remove();
  var row=
"<table id='l2'><tr><td><input type=\"submit\" name=\"1\" value=\"1\"/></td><td><input type=\"submit\" name=\"2\" value=\"2\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"3\" value=\"3\"/></td><td><input type=\"submit\" name=\"4\" value=\"4\"/></td></tr><tr><td><input type=\"submit\" name=\"5\" value=\"5\"/></td><td><input type=\"submit\" name=\"6\" value=\"6\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"7\" value=\"7\"/></td><td><input type=\"submit\" name=\"8\" value=\"8\"/></td></tr><tr><td><input type=\"submit\" name=\"9\" value=\"9\"/></td><td><input type=\"submit\" name=\"10\" value=\"10\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"11\" value=\"11\"/></td><td><input type=\"submit\" name=\"12\" value=\"12\"/></td></tr><tr><td><input type=\"submit\" name=\"13\" value=\"13\"/></td><td><input type=\"submit\" name=\"14\" value=\"14\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"15\" value=\"15\"/></td><td><input type=\"submit\" name=\"16\" value=\"16\"/></td></td></tr><tr><td><input type=\"submit\" name=\"17\" value=\"17\"/></td><td><input type=\"submit\" name=\"18\" value=\"18\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"19\" value=\"19\"/></td><td><input type=\"submit\" name=\"20\" value=\"20\"/></td></tr><tr><td><input type=\"submit\" name=\"21\" value=\"21\"/></td><td><input type=\"submit\" name=\"22\" value=\"22\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"23\" value=\"23\"/></td><td><input type=\"submit\" name=\"24\" value=\"24\"/></td></tr><tr><td><input type=\"submit\" name=\"25\" value=\"25\"/></td><td><input type=\"submit\" name=\"26\" value=\"26\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"27\" value=\"27\"/></td><td><input type=\"submit\" name=\"28\" value=\"28\"/></td></tr><tr><td><input type=\"submit\" name=\"29\" value=\"29\"/></td><td><input type=\"submit\" name=\"30\" value=\"30\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"31\" value=\"31\"/></td><td><input type=\"submit\" name=\"32\" value=\"32\"/></td></tr><tr><td><input type=\"submit\" name=\"33\" value=\"33\"/></td><td><input type=\"submit\" name=\"34\" value=\"34\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"35\" value=\"35\"/></td><td><input type=\"submit\" name=\"36\" value=\"36\"/></td></tr><tr><td><input type=\"submit\" name=\"37\" value=\"37\"/></td><td><input type=\"submit\" name=\"38\" value=\"38\"/></td><td style=\"padding: 0px 0px 0px 20px;\"><input type=\"submit\" name=\"39\" value=\"39\"/></td><td><input type=\"submit\" name=\"40\" value=\"40\"/></td></tr></table>";
    $("#tbl").append(row);

    $(this).addClass("active");
  }
    }); 
    // $('#clear2').on('click', function() {
    //   $("#l2").remove();
    //   cnt2=0;
    // });
});


var checkedradio;
function docheck(thisradio) {
    if (checkedradio == thisradio) {
        thisradio.checked = false;
        checkedradio = null;
    }
    else {checkedradio = thisradio;}
}

    </script>
</div>
        <p>${message}</p>
    <tr>
      <td><button type="submit">Add</button></td>
      <div class="container" style="background-color: #eee">
        <label style="padding-left: 15px">
        </label>
        <center><td><button type="reset" value="Reset">Reset</button></td></center>
    </tr>
    </form>
</tr>
</div>
</center>

<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var Bus_Routes = ["Trichy","Tiruppur","Tirunelveli","Coimbatore","Chennai","Karur","Antigua & Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia & Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central Arfrican Republic","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauro","Nepal","Netherlands","Netherlands Antilles","New Caledonia","Namakkal","New Zealand","Nicaragua","Niger","Nigeria","North Korea","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre & Miquelon","Samoa","San Marino","Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Korea","South Sudan","Spain","Sri Lanka","St Kitts & Nevis","St Lucia","St Vincent","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Turks & Caicos","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States of America","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), Bus_Routes);
autocomplete(document.getElementById("myInput1"), Bus_Routes);

</script>


    <br>
<center><a href="#" style="color: black;" onclick="javascript:window.history.back(-1);return false;">Back</a></center></body>
</body>