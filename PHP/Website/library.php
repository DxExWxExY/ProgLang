<?php 
include 'songs.php';
/*required for session anc song class*/
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Library</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="icon" type="img" href="images/logo.png">
</head>
<body>
	<?php
	/*if the delete song was deleted it will retriveve the index value submited to post to set the song to false*/
		if (isset($_POST['deleteSong'])) {
			$_SESSION[$_POST['deleteSong']]->purchased = false;
			/*reets value of the note*/
			$_SESSION[$_POST['deleteSong']]->note = "";
			/*resets post just in case*/
			$_POST['deleteSong'] = "";
		}
	?>
	<div class="menu" tag="menu">
		<br>
		<br>
		<br>
		<div class="cont">
			<a href=""><img src="images/lib.png" align="middle">My Library</a>
		</div>
		<br>
		<div class="cont">
			<a href="store.php<?php echo "?'".SID."'";  ?>>"><img src="images/store.png">Stores</a>
		</div>
		<br>
		<div class="cont">
			<a href="about.php"><img src="images/info.png">About</a>
		</div>
		<br>
		<div class="cont">
			<a href="index.php"><img src="images/logout.png">Logout</a>
		</div>
	</div>
	<div class="lib">
		<h1>My Music Library</h1>
		<table>
			<?php
			/*Display purchased songs by checking if purchased is true
			* Deletes a song by sending an index value to post and setting purchased to false 
			this is repeated in all the forloops bellow*/
			for ($i=0; $i < 5; $i++) { 
				$index = "a".$i;
				if ($_SESSION[$index]->purchased == true) {
					echo "<tr><td><p><img src=\"images/a.jpg\">".$_SESSION[$index]->name."</p></td>";
					echo "<td><p><i>".$_SESSION[$index]->note."</i></p></td>";
					echo "<td><form method=\"post\">";
					/*when dleting a song each button return a unique valeu wich corresponds to its index identifier in the session array
					this is the same for athe foloops below*/
					echo "<button type=\"submit\" name=\"deleteSong\" value=\"a$i\">Delete Song</button></form></td></tr>";
				}
			}
			for ($i=0; $i < 10; $i++) { 
				$index = "dsotm".$i;
				if ($_SESSION[$index]->purchased == true) {
					echo "<tr><td><p><img src=\"images/dsotm.png\">".$_SESSION[$index]->name."</p></td>";
					echo "<td><p><i>".$_SESSION[$index]->note."</i></p></td>";
					echo "<td><form method=\"post\">";
					echo "<button type=\"submit\" name=\"deleteSong\" value=\"dsotm$i\">Delete Song</button></form></td></tr>";
				}
			}
			for ($i=0; $i < 13; $i++) { 
				$index = "tfc".$i;
				if ($_SESSION[$index]->purchased == true) {
					echo "<tr><td><p><img src=\"images/tfc.jpg\">".$_SESSION[$index]->name."</p></td>";
					echo "<td><p><i>".$_SESSION[$index]->note."</i></p></td>";
					echo "<td><form method=\"post\">";
					echo "<button type=\"submit\" name=\"deleteSong\" value=\"tfc$i\">Delete Song</button></form></td></tr>";
				}
			}
			for ($i=0; $i < 5; $i++) { 
				$index = "wywh".$i;
				if ($_SESSION[$index]->purchased == true) {
					echo "<tr><td><p><img src=\"images/wywh.png\">".$_SESSION[$index]->name."</p></td>";
					echo "<td><p><i>".$_SESSION[$index]->note."</i></p></td>";
					echo "<td><form method=\"post\">";
					echo "<button type=\"submit\" name=\"deleteSong\" value=\"wywh$i\">Delete Song</button></form></td></tr>";
				}
			}
			?>
		</table>
	</div>
</body>
</html>