<?php
	// Connection Instance
	$db = new PDO('mysql:host=sql306.epizy.com;dbname=epiz_27502592_mysqldb;charset=utf8','epiz_27502592','OY9Y2e0kpqcSn');
	// For error handling
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	// $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
?>