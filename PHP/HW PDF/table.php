<!DOCTYPE html>
<html>
<head>
	<title>Table Generator</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<h1>Schedule Spring 2018</h1>
	<?php
		$th = "<tr><th>".str_replace(", ", "</th><th>", "Day, Time, Description")."</th></tr>";
		$tc = array("M, 2:00-2:50PM, Myoung Kim (Room 202B)",
					"TR, 10:30-11:50AM, CS 3360 (Room 322)",
					"TR, 12:0-1:20, CS 4311(Room 308)",
					"TR, 3:00-3:50PM, Office hours for CS 3360 (Room 202B)",
					"TR, 4:00-4:50PM, Office hours for CS 4311 (Room 202B)",
					"W, 10:30-12:00AM, Faculty meeting or dept. seminar",
					"W, 1:30-2:00pm, Ashaveeva Perumandla (Room 202B)",
					"W, 2:00-2:30PM, Angelica Perez (Room 202B)");
		echo "<table>";
		echo "$th";
		for ($i=0; $i < count($tc); $i++) { 
			echo "<tr><td>".str_replace(", ", "</td><td>", $tc[$i])."</td></tr>";
		}
		echo "</table>";
	?>
</body>
</html>