<?php
require("pdo.php");
require("functions.php");

$dataEntered[] = $_POST;

$userName = $_POST['name'];
$userEmail = $_POST['email'];
$userPhone = $_POST['phone'];

$orderAddress = address($dataEntered);
$orderComment = $_POST['comment'];
$orderCardpay = $_POST['payment'];
$orderCallback = orderCallback($dataEntered[0]['callback']);

$userId = userAuthentication($userName, $userEmail, $userPhone, $pdo);
orderRegistration($userId, $orderAddress, $orderComment, $orderCardpay, $orderCallback, $pdo);
$orderId = orderId($userId, $pdo);
$thankYou = thankYou($userId, $pdo);
sendMail($orderId, $orderAddress, $thankYou);
