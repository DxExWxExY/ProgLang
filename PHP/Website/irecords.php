<?php 
include 'songs.php';
/*required for session anc song class*/
session_start();
?>
<!DOCTYPE html>
<!-- saved from url=(0141)https://www.quackit.com/html/html_editors/scratchpad/preview.cfm?example=/css/flexbox/tutorial/create_a_website_layout_with_flexbox_example_1 -->
<html><head><title>iRecords</title>
	<link rel="icon" type="img" href="images/irecords.png">
	<style>
	body {
		margin: 0;
		background-color: black;
	}
	.header {
		width: auto;
		margin: 0;
		background-color: yellow;
		padding: 10px;
	}
	.header a {
		color: black;
		text-decoration: none;
	}
	.cont {
		background-color: black;
		width: 100%;
	}
	.cont p {
		color: white; 
		font-family: Arial;
		padding-right: 15px;
	}
	.cont img {
		width: 20%;
		vertical-align: middle;
		margin: 10px;
	}
	.cont table {
		width: auto;
	}
	.cont button {
	background-color: yellow;
	border-style: none;
	border-radius: 10px;
	margin: 0;
	padding: 7px;
	font-family: Arial;
	color: black;
	}
	.cont input{
	
	  background-color: white;
	  border-style: none;
	  margin-right: 10px;
	  border-radius: 10px;
	  padding: 7px;
	  font-family: Arial;
	  color: black;
	
	}
	.cont input::placeholder {
		font-family: Arial;
	  	color: grey;
	}
</style>
</head><body>
	<div class="header">
		<p style="font-size: 50px; font-family: Arial;"><img src="images/irecords.png" width="100px" style="vertical-align: middle;">iRecords &emsp;<a href="library.php"><b>Go Back to Library</b></a></p>

	</div>
	<div class="cont">
		<center><h1 style="font-family: Arial; color: white;">We only sell the best two Pink Floyd Albums!</h1>
			<h1 style="font-family: Arial; color: white;">If you only like these two, you're a real fan!</h1>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h2 style="font-family: Arial; color: white;">Wish You Were Here</h2>
			<table>
				<?php  
				/*used to determine if the button to buy song was pressed by setting a velur to the designated index in post*/
				if (isset($_POST['buySong'])) {
					$_SESSION[$_POST['buySong']]->purchased = true;
					/*checks if the user defined a note when buying the song*/
					if (isset($_POST['note'])) {
						$_SESSION[$_POST['buySong']]->note = $_POST['note'];
					}
					/*ressets the values just in case*/
					$_POST['buySong'] = "";
					$_POST['note'] = "";
				}
				/*method used to print a html table containing songs that have benn not purchased
				by accesing the unique identifier*/
				echo "<img src=\"images/wywh.png\">";
				for ($i=0; $i < 5; $i++) { 
					$index = "wywh".$i;
					if ($_SESSION[$index]->purchased == false) {
						echo "<tr><td><p>".$_SESSION[$index]->name."</p></td>";
						echo "<td><form method=\"post\"><input type=\"text\" name=\"note\" placeholder=\"Optional Note\"></td><td>";
						echo "<button type=\"submit\" name=\"buySong\" value=\"wywh$i\">Buy Song</button></form></td></tr>";
					}
				}
				?>
			</table>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h2 style="font-family: Arial; color: white;">The Dark Side of the Moon</h2>
			<table>
				<?php  
				/*same as above*/
				if (isset($_POST['buySong'])) {
					$_SESSION[$_POST['buySong']]->purchased = true;
					if (isset($_POST['note'])) {
						$_SESSION[$_POST['buySong']]->note = $_POST['note'];
					}
					$_POST['buySong'] = "";
					$_POST['note'] = "";
				}
				echo "<img src=\"images/dsotm.png\">";
				/*same as above*/
				for ($i=0; $i < 10; $i++) { 
					$index = "dsotm".$i;
					if ($_SESSION[$index]->purchased == false) {
						echo "<tr><td><p>".$_SESSION[$index]->name."</p></td>";
						echo "<td><form method=\"post\"><input type=\"text\" name=\"note\" placeholder=\"Optional Note\"></td><td>";
						echo "<button type=\"submit\" name=\"buySong\" value=\"dsotm$i\">Buy Song</button></form></td></tr>";
					}
				}
				?>
			</table>
		</table></center>
	</div>

</body></html>