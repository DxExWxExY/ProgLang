<!DOCTYPE html>
<html>
<head>
	<title>Lab 1 Result</title>
</head>
<body>
	<h1>Iteration Results: </h1>
	<b>Here are 10 iterations of the formula: <br>
	y = x <sup>2</sup><br></b>
	<?php
		$number = $_POST['data'];
		echo "Initial value of x: $number <br>";
		for ($i=1; $i <= 10; $i++) { 
			$num = pow($_POST['data'], $i);
			echo "$i. $num <br>";
		}
	?>
</body>
</html>