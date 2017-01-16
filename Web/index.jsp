<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet"  type="text/css" href="NewFile.css" />
 <link rel="stylesheet"  type="text/css" href="style.css" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
    
    
    google.load("visualization", "1", {packages:["table"]});
    google.setOnLoadCallback(drawTable);
	        
  	
    function drawTable() {
      var session = new google.visualization.DataTable();
      var instance = new google.visualization.DataTable();
      var tutor = new google.visualization.DataTable();
      var tutee = new google.visualization.DataTable();

      
      

//       var rawFile = new XMLHttpRequest();
//       var allData;
//       rawFile.open("GET", "TestServlet", false);
      
//       rawFile.onreadystatechange = function()
//       {
//      	if (rawFile.readyState == 4)
//      		{
//      			if (rawFile.status == 200 || rawFile.status == 0)
//      				{
//      					allData = rawFile.responseText;
     					
//      				}
//      		}
//       };
//       rawFile.send(null);

$.ajax({
  type: "GET",
  url: "/TestServlet",
  dataType: "json",
  contentType : "application/json",
  data: formData,
  success: function(){
	  
	  session.addColumn('string', 'CourseID');
      session.addColumn('string', 'InstructorID');
      session.addColumn('string', 'TutorUsername');
      session.addRows([
     	 	['CSC256', 'voorheesedp', 'petersha'],
      	['CSC256', 'voorheesedp', 'petersha'],
      	['CSC256', 'voorheesedp', 'petersha'],
      	['CSC256', 'voorheesedp', 'petersha'],
          [formData.getDescription(), "hello", "hello"]
      ]);
      var table = new google.visualization.Table(document.getElementById('table_div'));
      table.draw(session, {showRowNumber: true});
  },

});
		
      //Table that has all the session information
     
		
      
  	//Table that has all the session instance information for the selected session	
      instance.addColumn('string', 'Session Date');
      instance.addColumn('string', 'Session Time');
      instance.addColumn('string', 'Number of New Students');
      instance.addColumn('string', 'Number of Returning Students');
      instance.addRows([
      	['11/30/2014', '8:40PM', '3', '7'],                  
      	['11/30/2014', '8:40PM', '3', '7'],                 
      	['11/30/2014', '8:40PM', '3', '7'],                 
      	['11/30/2014', '8:40PM', '3', '7']                 
      ]);
      
      //Table that has all the tutor information for the selected session
      tutor.addColumn('string', 'Tutor Username');
      tutor.addColumn('string', 'First Name');
      tutor.addColumn('string', 'Last Name');
      tutor.addColumn('string', 'Email');
      tutor.addColumn('string', 'Student ID');
      tutor.addRows([
			['petersha', 'Howie', 'Peters', 'petersha@lemoyne.edu', '10001020402']            
                     ])
                     
                     
    	//Table that has all the tutee information for the selected session instance
    	tutee.addColumn('string', 'First Name');
      tutee.addColumn('string', 'Last Name');
      tutee.addColumn('string', 'Email');
      tutee.addColumn('string', 'Student ID');
      tutee.addColumn('string', 'Class Year');
      tutee.addColumn('string', 'Major');
      tutee.addColumn('string', 'Second Major');
    	
      for (i = 0; i < 4; i++){
      	tutee.addRows([['howie', 'peters', 'email', 'studentid', 'year', 'major', '2nd major']])
      }
    	
      //Create the tables based on the data
      
      var table2 = new google.visualization.Table(document.getElementById('table2_div'));
      var table3 = new google.visualization.Table(document.getElementById('table3_div'));
		var table4 = new google.visualization.Table(document.getElementById('table4_div'));
		
  
      table2.draw(instance, {showRowNumber: true});
      table3.draw(tutor, {showRowNumber: true});
      table4.draw(tutee, {showRowNumber: true});


	

      
    }
  </script>
</head>
<body>
	  <div class="top-div">Welcome to the Tutoring Catalogue!
	  		Under Session Information you will see information about the sessions this semester.  If you would like to see the session details please click
	  		on a session and click find session instance.  If you want to see information about a tutor click on a session and click find tutor.  If you would
	  		like to see information about the attendants click on the session instance you want and click find students.      	
	  </div>
	  <a href="saveToDB.html" class="Ref">Save Data </a>
	  	<div class="infodiv">
	    <h1>	Session Information: </h1>
		    <div id="table_div"></div>
		    <br>
		    <button id="sessionButton" class="sessionSubmitt" align = "center" onclick="changeTutor()">Get Session Instance's</button>
		    <br>
		    <br>

		    <h1>Session Instance Information: </h1>

		    <br>
		    <br>
		    <h1>Tutor Information: </h1>
		    <div  id ="table3_div"></div>
		    <br>
		    <br>
		    <h1>Tutee Information</h1>
		    <div  id ="table4_div"></div>
		    
		    
		
	  </div>
</body>
</html>