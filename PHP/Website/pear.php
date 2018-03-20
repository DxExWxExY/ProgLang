<?php 
include 'songs.php';
/*required for session anc song class*/
session_start();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<title>Pear Music</title>
	<meta charset="iso-8859-1">
	<link rel="stylesheet" href="styles/layout.css" type="text/css">
	<link rel="icon" type="img" href="images/pear.jpg">
</head>
<body>
	<div class="wrapper row1">
		<header id="header" class="clear">
			<div id="hgroup">
				<h1><a href="pear.php">Pear Music</a></h1>
			</div>
			<nav>
				<ul>
					<li><a href="library.php">Go Back to Library</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<!-- content -->
	<div class="wrapper row2">
		<div id="container" class="clear">
			<!-- Slider -->
			<section id="slider" class="clear">
				<figure><img src="images/pear.jpg" alt="">
					<figcaption>
						<h2>Just for You...</h2>
						<p>If you like a not-so-mainstream band, but don't like people that only like their most popular albums, then this store is fr you.</p>
					</figcaption>
				</figure>
			</section>
			<!-- main content -->
			<div id="intro">
				<center><section class="clear">
					
					<article>
						<figure>
							<ul class="clear">
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
									/*method used to print a html list containing songs that have benn not purchased
									by accesing the unique identifier*/
									for ($i=0; $i < 5; $i++) { 
										$index = "a".$i;
										if ($_SESSION[$index]->purchased == false) {
											echo "<li><img src=\"images/a.jpg\" width=\"130\" height=\"130\">";
											echo "<form method=\"post\"><p>".$_SESSION[$index]->name."</p>";
											echo "<input type=\"text\" name=\"note\" placeholder=\"Optional Note\">";
											echo "<button type=\"submit\" name=\"buySong\" value=\"a$i\">Buy Song</button></form></li>";
										}
									}
									for ($i=0; $i < 13; $i++) { 
										$index = "tfc".$i;
										if ($_SESSION[$index]->purchased == false) {
											echo "<li><img src=\"images/tfc.jpg\" width=\"130\" height=\"130\">";
											echo "<form method=\"post\"><p>".$_SESSION[$index]->name."</p>";
											echo "<input type=\"text\" name=\"note\" placeholder=\"Optional Note\">";
											echo "<button type=\"submit\" name=\"buySong\" value=\"tfc$i\">Buy Song</button></form></p></li>";
										}
									}
								?>							
							</ul>
						</figure>
					</article>
					
				</section></center>
			</div>
			<!-- ########################################################################################## -->
			<!-- ########################################################################################## -->
			<!-- ########################################################################################## -->
			<!-- ########################################################################################## -->
			
			<!-- / content body -->
		</div>
	</div>
	<!-- Footer -->
	<div class="wrapper row3">
		<footer id="footer" class="clear">
			<p class="fl_left">Copyright &copy; 2018 - All Rights Reserved</p>
			<p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
		</footer>
	</div>
</body>
</html>
