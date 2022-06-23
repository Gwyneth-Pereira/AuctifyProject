<?php
session_start();
require('controlled.php');
extract($_REQUEST);
	
try{
	require('connection.php');


	$sql = $db->prepare("SELECT * FROM auctions WHERE id=?");
	$sql->execute(array($auctionid));
	$auctions = $sql->fetch(PDO::FETCH_ASSOC);
	$productid = $auctions['product'];

	$sql = $db->prepare("SELECT * FROM products WHERE id=?");
	$sql->execute(array($productid));
	$products = $sql->fetch(PDO::FETCH_ASSOC);

} catch(PDOExecption $e){
	die ("ERROR:".$e->getMessage());
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>View Auction</title>
	<?php include 'head.php'; ?>
</head>
<body>
	<?php include 'header.php'; ?>

<?php  
	// Retrieving highest bid and bidder
	if ($auction = $auctions) {
		$highestBid = $auctions['bid'];
		$highestBidder = $auctions['bidder'];
	}
	
	$name = $products['name'];
	$category = $products['category'];
	$details = $products['details'];
	$owner = $auctions['owner'];
	$startprice = $auctions['startprice'];
	$start = $auctions['start'];
	$end = $auctions['end'];
	$status = $auction['status'];
    $bid = $auction['bid'];
    $highestBidder = $auction['bidder'];
	// echo "<h1>Auction Details:</h1>";
	
	//picturefile in folder
	//echo "<img src=picturefile/".$products['picture'].">";
	// echo "<h3>Product:</h3>";
	
	// echo "<h3>Category:</h3>";
	
	// echo "<h3>Product Details:</h3>";
	
	// echo "<h3>Owner:</h3>";
	
	// echo "<h3>Starting Bid:</h3>";
	// echo "<h3>Start date:</h3>";
	// echo "<h3>End date:</h3>";
	
	// echo "<h3>Current Highest Bid:</h3>";
	// if (isset($highestBid)) {
	// 	echo "$highestBid by $highestBidder";
	// } else {
	// 	echo "No Bids Yet!";
	// }

	
	
?>

	<div class="container">
		<div class="row" style="max-height: 100vh;">

			<div id="auctioninfo" class="col-6">
				<h2 class="h1 text-center"><?php echo $name; ?></h2>
				<p class="h5 text-center"><?php echo $category; ?></p>
				<?php 
				if($status=='active') echo "<p class='h6 font-weight-bold text-center text-success'><u>Active</u></p>"; 
				elseif($status=='failed') echo "<p class='h6 font-weight-bold text-center text-danger'><u>Failed</u></p>";
				elseif($status=='successful') echo "<p class='h6 font-weight-bold text-center text-success'><u>Successful</u></p>";
				elseif($status=='noparticipation') echo "<p class='h6 font-weight-bold text-center text-secondary'><u>No Participations</u></p>";
				?>
				
				<p class="h5 text-left m-5 mb-0"><span class="font-weight-bold">Owner: </span>&nbsp; <u><a href="viewUser.php?user=<?php echo $owner; ?>" class="h5"> <?php echo $owner; ?></a></u></p>
				<p class="h5 text-left m-5 mt-4"><span class="font-weight-bold">Product Details: </span class="h6"><?php echo $details; ?></p>
				
				<div class="row text-center">
					<div class="col-6 border-right">
						<?php echo "<p class='h6 font-weight-bold mb-1'>Starting Bid:</p>"; ?>
						<?php echo "<p class='h3 font-weight-bold'>BD $startprice</p>"; ?>
					</div>
					<div class="col-6">
						<?php echo "<p class='h6 font-weight-bold mb-1'>Current Bid</p>"; ?>
						<?php if(isset($bid)) echo "<p class='h3 font-weight-bold'>BD $bid <br><span class='h6'><a href='viewUser.php?user=$highestBidder'>by $highestBidder</a></span></p>"; else echo "<p class='h3 font-weight-bold'>No bids yet</p>";?>
					</div>
					<div class="col-12 text-center">
						<?php
						if (!isset($_SESSION['username'])) {
							echo "<p><a href='bid.php?auctionid=$auctionid' class='btn btn-lg btn-outline-success mt-5'>Bid on Auction</a></p>";
						}
						elseif ($auctions['owner']!=$_SESSION['username']) {
							echo "<p><a href='bid.php?auctionid=$auctionid' class='btn btn-lg btn-outline-success mt-5'>Bid on Auction</a></p>";
						}
						elseif ($auctions['owner']==$_SESSION['username']) {
							echo "<p><a href='myAuctions.php' class='btn btn-lg btn-outline-primary mt-5'>Go to My Auctions</a></p>";
						}
						?>
					</div>
				</div>
			</div>
			
			<div id="pictures" class="col-6 border rounded h-75" style="max-height: 60vh;">
			
			<?php 
			try {
				require('connection.php');

				$sql = $db->prepare("SELECT picture FROM pictures WHERE product=?");
				$sql->execute(array($productid));
				$pictures = $sql->fetchAll();
				
				if (!$pictures) 
					echo "<img src='images/products/default-image.png' class='card-img-top' style='height: 300px;'>";
				else{

					echo '<div id="picturesCarousel" class="carousel slide" data-ride="carousel">';
					echo '<div class="carousel-inner" >';
					$first = true;
					foreach ($pictures as $holder) {
						$picture = $holder['picture'];
						if ($first) {
							echo '<div class="carousel-item active">';
							$first = false;
						} else {
							echo '<div class="carousel-item">';
						}
						echo "<img src='$picture' class=' img-fluid px-5' style='max-height: 60vh;'>"; 
						echo '</div>';
					}
					echo '</div>';
					echo '</div>';
					echo '<a class="carousel-control-prev btn btn-lg btn-dark" style="width: 3.7rem;" href="#picturesCarousel" role="button" data-slide="prev">';
					echo '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
					echo '<span class="sr-only">Previous</span>';
					echo '</a>';
					echo '<a class="carousel-control-next btn btn-lg btn-dark" style="width: 3.7rem;" href="#picturesCarousel" role="button" data-slide="next">';
					echo '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
					echo '<span class="sr-only">Next</span>';
					echo '</a>';
					// echo '</div>';
				}
				$db=null;
			} catch (PDOException $ex) {
				echo $x->getMessage();
				exit;
			}
			?>
			</div>

			<div class="col-12">
				<?php 
				if (isset($_SESSION['username'])) {
					echo '<div class="mt-5 text-center"><a href="#question-section" id="scrollClick" class="smoothScroll"><span class="display-1 text-dark text-center">&#8659;</span></a></div>';
				}
				?>
			</div>
		</div>

		<div id="question-section" class="row pt-5" style="height: 100vh;">
			<div class="col-12 text-center">
				<?php 
				if (isset($_SESSION['username'])) {
					include('questionbar.php'); 
				}
				?>
			</div>
		</div>
	</div>
	<?php include 'scripts.php'; ?>
</body>
</html>