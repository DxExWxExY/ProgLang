<!DOCTYPE html>
<html>
<head>
	<title>Iteration</title>
</head>
<body>
	<h1>Iteration Program</h1>
	Today's Date: 
	<?php echo date("l F d, Y")."\n"; ?>
	<h3>Enter value to iterate: </h3>
	<form action="result.php", method=post>
		<input type="text" name="data">
		<input type="submit" value="Show Results">
	</form>
</body>
</html>
