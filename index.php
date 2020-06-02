<?php include 'secret.php'; 

$CONNECT = mysqli_connect('localhost', 'root', $pass, 'film');
/*if (!$CONNECT) {
    die('Қосылу мүмкін болмады: ' . mysql_error());
}
echo 'Сәтті қосылды';*/

// $sql = "SELECT m.*, mp.url,mv.url_1080 as url_HD FROM movies m left join  movies_photo mp on mp.movies_id=m.id left join movies_video mv on mv.movies_id=m.id;";
$sql = "SELECT u.name as user_name, m.name as movies_name, mp.url, mv.url_1080 as url_HD FROM users u left join cart on cart.users_id=u.id left join cart_movies cm on cm.cart_id=cart.id left join movies m on m.id=cm.movies_id left join movies_video mv on mv.movies_id=m.id left join movies_photo mp on mp.movies_id=m.id";


$result = mysqli_query($CONNECT, $sql); 


?>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>join Практика жасаймыз</title>
</head>
<body>


	<table border="1px">
		<tr>
			<td>User Name</td>
			<td>Movies Name</td>
			<td>Photo url</td>
			<td>Video url</td>
		</tr>
		<?php 
			if (mysqli_num_rows($result)>0) {
				while ($Row = mysqli_fetch_array($result)) {
			?>
				
				<tr>
					<td><?php echo $Row["user_name"]; ?></td>
					<td><?php echo $Row["movies_name"]; ?></td>
					<td><?php echo $Row["url"]; ?></td>
					<td><?php echo $Row["url_HD"]; ?></td>
				</tr>

			<?php
				}
			}
		 ?>
	</table>



</body>
</html>