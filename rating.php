<?php
extract($_REQUEST);
if (isset($rating)) {
	try {
		require('connection.php');
		
		$sql = $db->prepare("SELECT * FROM ratings WHERE auctionid=?");
		$sql->execute(array($auctionid));
		$ratings = $sql->fetch();
		if ($sql->rowCount()==0) {
			if ($rater=='buyer') {
				$sql = $db->prepare("INSERT INTO ratings VALUES(?, ?, NULL)");
				$sql->execute(array($auctionid, $rate));
			}
			elseif ($rater=='seller') {
				$sql = $db->prepare("INSERT INTO ratings VALUES(?, NULL, ?)");
				$sql->execute(array($auctionid, $rate));
			}	
		}
		else {
			if ($rater=='buyer') {
				$sql = $db->prepare("UPDATE ratings SET buyerRating=? WHERE auctionid=?");
				$sql->execute(array($rate, $auctionid));
			}
			elseif ($rater=='seller') {
				$sql = $db->prepare("UPDATE ratings SET sellerRating=? WHERE auctionid=?");
				$sql->execute(array($rate, $auctionid));
			}	
		
	}
	
	$db=null;
	} catch (PDOException $ex) {
		echo $ex->getMessage();
		exit;
	}
	header('location: myAuctions.php');
	// exit;
}
?>