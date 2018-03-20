<?php 
include 'songs.php';
/*required for session anc song class*/
session_start();
?>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link rel="icon" type="img" href="images/logo.png">
</head>
<body>
	<?php
		/*Albums Decalrations into cookies. Dont know why it doesnt work without this*/

		$_COOKIE['dsotm0'] = new Song("Speak to Me");
		$_COOKIE['dsotm1'] = new Song("Breathe (In the Air)");
		$_COOKIE['dsotm2'] = new Song("On the Run");
		$_COOKIE['dsotm3'] = new Song("Time");
		$_COOKIE['dsotm4'] = new Song("The Great Gig in the Sky");
		$_COOKIE['dsotm5'] = new Song("Money");
		$_COOKIE['dsotm6'] = new Song("Us and Them");
		$_COOKIE['dsotm7'] = new Song("Any Colour You Like");
		$_COOKIE['dsotm8'] = new Song("Brain Damage");
		$_COOKIE['dsotm9'] = new Song("Eclipse");

		$_COOKIE['wywh0'] = new Song("Shine On You Crazy Diamond Pt. 1-5");
		$_COOKIE['wywh1'] = new Song("Welcome to the Machine");
		$_COOKIE['wywh2'] = new Song("Have a Cigar");
		$_COOKIE['wywh3'] = new Song("Wish You Were Here");
		$_COOKIE['wywh4'] = new Song("Shine On You Crazy Diamond Pt. 6-9");

		$_COOKIE['a0'] = new Song("Pigs on the Wing Pt. 1");
		$_COOKIE['a1'] = new Song("Dogs");
		$_COOKIE['a2'] = new Song("Pigs (Three Different Ones)");
		$_COOKIE['a3'] = new Song("Sheep");
		$_COOKIE['a4'] = new Song("Pigs on the Wing Pt. 2");

		$_COOKIE['tfc0']= new Song("The Post War Dream");
		$_COOKIE['tfc1']= new Song("Your Possible Pasts");
		$_COOKIE['tfc2']= new Song("One of the Few");
		$_COOKIE['tfc3']= new Song("When the Tigers Broke Free");
		$_COOKIE['tfc4']= new Song("The Hero's Return");
		$_COOKIE['tfc5']= new Song("The Gunner's Dream");
		$_COOKIE['tfc6']= new Song("Paranoid Eyes");
		$_COOKIE['tfc7']= new Song("Get Your Filthy Hands Off My Desert");
		$_COOKIE['tfc8']= new Song("The Fletcher Memorial Home");
		$_COOKIE['tfc9']= new Song("Southhampton Dock");
		$_COOKIE['tfc10'] = new Song("The Final Cut");
		$_COOKIE['tfc11'] = new Song("Not Now John");
		$_COOKIE['tfc12'] = new Song("Two Suns in the Sunset");
		
	?>
	<div class="menu">
		<br>
		<br>
		<br>
		<div class="cont">
			<a href="about.php"><img src="images/info.png">About</a>
		</div>
	</div>
	<div class="lib">
		<form method="post">
			<h1>Login</h1>
			<input type="text" name="user" placeholder="Username">
			<button type="submit">Login</button>
			<?php  
			/*if the user in post is found in cookies*/
			if (isset($_POST['user'])) {
				foreach ($_COOKIE as $nameC) {
					if ($_POST['user'] == $nameC) {
						header("Location: library.php");
					}
				}
				echo "<br> <p>Invalid Username</p>";
			}
			?>
		</form>
		<form method="post">
			<h1>Register</h1>
			<input type="text" name="new" placeholder="New Username">
			<br>
			<br>
			<input type="password" name="admin" placeholder="Admin Password">
			<br>
			<br>
			<button type="submit">Register</button>
			<?php  
			/*regiters new user in cookies and decares the initial values of the songs 
			that can be purchased */
			if (isset($_POST['new']) && $_POST['admin'] == "3659") {
				setcookie($_POST['new'], $_POST['new'], time() + (86400 * 30), "/");
				$_SESSION['dsotm0'] = new Song("Speak to Me");
				$_SESSION['dsotm1'] = new Song("Breathe (In the Air)");
				$_SESSION['dsotm2'] = new Song("On the Run");
				$_SESSION['dsotm3'] = new Song("Time");
				$_SESSION['dsotm4'] = new Song("The Great Gig in the Sky");
				$_SESSION['dsotm5'] = new Song("Money");
				$_SESSION['dsotm6'] = new Song("Us and Them");
				$_SESSION['dsotm7'] = new Song("Any Colour You Like");
				$_SESSION['dsotm8'] = new Song("Brain Damage");
				$_SESSION['dsotm9'] = new Song("Eclipse");
		
				$_SESSION['wywh0'] = new Song("Shine On You Crazy Diamond Pt. 1-5");
				$_SESSION['wywh1'] = new Song("Welcome to the Machine");
				$_SESSION['wywh2'] = new Song("Have a Cigar");
				$_SESSION['wywh3'] = new Song("Wish You Were Here");
				$_SESSION['wywh4'] = new Song("Shine On You Crazy Diamond Pt. 6-9");
		
				$_SESSION['a0'] = new Song("Pigs on the Wing Pt. 1");
				$_SESSION['a1'] = new Song("Dogs");
				$_SESSION['a2'] = new Song("Pigs (Three Different Ones)");
				$_SESSION['a3'] = new Song("Sheep");
				$_SESSION['a4'] = new Song("Pigs on the Wing Pt. 2");
		
				$_SESSION['tfc0']= new Song("The Post War Dream");
				$_SESSION['tfc1']= new Song("Your Possible Pasts");
				$_SESSION['tfc2']= new Song("One of the Few");
				$_SESSION['tfc3']= new Song("When the Tigers Broke Free");
				$_SESSION['tfc4']= new Song("The Hero's Return");
				$_SESSION['tfc5']= new Song("The Gunner's Dream");
				$_SESSION['tfc6']= new Song("Paranoid Eyes");
				$_SESSION['tfc7']= new Song("Get Your Filthy Hands Off My Desert");
				$_SESSION['tfc8']= new Song("The Fletcher Memorial Home");
				$_SESSION['tfc9']= new Song("Southhampton Dock");
				$_SESSION['tfc10'] = new Song("The Final Cut");
				$_SESSION['tfc11'] = new Song("Not Now John");
				$_SESSION['tfc12'] = new Song("Two Suns in the Sunset");
			}
			?>
		</form>
	</div>
</body>
</html>