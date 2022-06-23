<?php 
session_start();
if (!isset($_SESSION['active'])) {
	header('location: notAuthorized.php');
	exit;
}
require('controlled.php');
extract($_REQUEST);
try {
	require('connection.php');
	
	// Retrieving highest bid and bidder
	$sql = $db->prepare("SELECT * FROM auctions, products WHERE auctions.id=? AND auctions.product=products.id");
	$sql->execute(array($auctionid));
	if ($auction = $sql->fetch()) {
		$name = $auction['name'];
		$owner = $auction['owner'];
		$details = $auction['details'];
		$highestBid = $auction['bid'];
		$highestBidder = $auction['bidder'];
		$startPrice = $auction['startprice'];
	}
} catch (PDOException $ex) {
	echo $ex->getMessage();
	exit;
}

if(isset($bid)){
	if (trim($userbid)=='') {
		echo "Please enter your bid";
	}
	else {
		try{
			$bidder = $_SESSION['username'];

			if($userbid > $highestBid){
				// $sql=$db->prepare("UPDATE auctions SET bid=:bid AND bidder=:bidder WHERE id=:auction");
				// $sql->bindParam(':bid', $userbid);
				// $sql->bindParam(':bidder', $bidder);
				// $sql->bindParam(':auction', $auctionid);
				$sql=$db->prepare("UPDATE auctions SET bid=?, bidder=? WHERE id=?");
				$sql->execute(array($userbid, $bidder, $auctionid));
				if ($sql->rowCount() == 1) {
					header('location: myAuctions.php?message=bid');
					exit;
				}
				else {
					$message = "Sorry something went wrong... Please try again";
				}
			}
			else 
				$error = "Please enter a higher bid than the current highest bid!";


			$db=null;
		} catch(PDOExecption $e){
			die("There is an Error: ".$e->getMessage());
		}
		// } // end of preg_match if-block
	}
} // end of isset(bid) if-block
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Bid on Auction</title>
	<?php include 'head.php'; ?>
</head>
<body>
	<?php include 'header.php'; ?>
	
	<div class="container text-center">
	<h1 class="font-weight-bold mb-5">Bid on Auction</h1>
	<form method="POST" class="form-group w-25 mx-auto">
        
		<p class="h5 text-left mt-4">Product name: <span class="font-weight-bold"><?php echo $name; ?></span></p>

		<p class="h5 text-left mt-4">Current Highest Bid: </p>
		<p><span class="h5 font-weight-bold"><?php if (isset($highestBid)) {
			echo $highestBid." BD";
		} else {
			$highestBid = $startPrice;
			echo "starting at $highestBid BD";
		}
		?></span></p>
        
		<p class="h5 text-left mt-4">Bidding Price:</p>
        <div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">BD</span>
			</div>
			<input class="form-control" type="number" name="userbid" placeholder="Bid" min="<?php echo $highestBid; ?>" step="any" required/>
			<?php if (isset($message)) {
				echo "<h2 class='text-warning'>$message</h2>";
			} ?>
			<div><?php if(isset($error)){ echo "<p class='text-danger'>$error</p>"; } ?></div>
		</div>
        
		<?php 
		if ($_SESSION['username']!=$owner) {
			echo '<p><input class="btn btn-success" type="submit" name="bid" value="Bid Auction"></p>'; 
		}
		?>
    </form>
	</div>

<?php include 'scripts.php'; ?>
</body>
</html>