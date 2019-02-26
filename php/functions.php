<?php

function address($array)
{
    $address = '';
    foreach ($array[0] as $key => $value) {
        switch ($key) {
            case ('street'):
                $address = "ул. $value";
                break;
            case ('home'):
                $address .= ", д. $value";
                break;
            case ('part'):
                if (!empty($value)) {
                    $address .= ", корп. $value";
                }
                break;
            case ('appt'):
                if (!empty($value)) {
                    $address .= ", кв. $value";
                }
                break;
            case ('floor'):
                if (!empty($value)) {
                    $address .= ", эт. $value";
                }
                break;
            }
        }
    return $address;
}

function orderCallback($arrayElement) {
    if (isset($arrayElement)) {
        return "Не перезванивать";
    } else {
        return "Перезвонить";
    }
}

function orderId($userId, $pdo)
{
    $orderIdDatabase = $pdo->query("SELECT id FROM orders WHERE user_id = '$userId'")->fetchAll();
    $lastItem = array_pop($orderIdDatabase);
    return $lastItem['id'];
}

function thankYou($userId, $pdo)
{
    $arrayUserId = $pdo->query("SELECT user_id FROM orders WHERE user_id = '$userId'")->fetchAll();

    $counter = count($arrayUserId);
    if ($counter === 1) {
        return "Спасибо - это ваш первый заказ!";
    } else {
        return "Спасибо! Это уже $counter заказ!";
    }
}

function userAuthentication($name, $email, $phone, $pdo)
{
    $trigger = 0;
    $emailDatabase = $pdo->query('SELECT email FROM users')->fetchAll();
    $dataEmailLower = strtolower($email);

    for ($i=0, $arrayLength = count($emailDatabase); $i < $arrayLength; $i++) {
        if ($emailDatabase[$i]['email'] === $dataEmailLower) {
            $trigger = 1;
        }
    }

    if ($trigger) {
        $userDatabase = $pdo->query("SELECT * FROM users WHERE email = '$dataEmailLower'")->fetchAll();
        $userId = $userDatabase[0]['id'];
        return $userId;
    } else {
        $pdo->query("INSERT INTO users (name, email, phone) VALUES ('$name', '$dataEmailLower', '$phone')")->fetchAll();
        $userDatabase = $pdo->query("SELECT id FROM users WHERE email = '$dataEmailLower'")->fetchAll();
        $userId = $userDatabase[0]['id'];
        return $userId;
    }
}

function orderRegistration($id, $address, $comment, $cardpay, $callback, $pdo)
{
   $pdo->query("INSERT INTO orders (user_id, address, comment, cardpay, callback) VALUES ('$id', '$address', '$comment', '$cardpay', '$callback')")->fetchAll();
   return;
}

function usersList($pdo)
{
    $arrayUsers = $pdo->query('SELECT * FROM users')->fetchAll();
    foreach ($arrayUsers as $key => $value) {
        $userString = implode('; ', $value);
        echo "$userString<br>";
    }
}

function ordersList($pdo)
{
    $arrayOrders = $pdo->query('SELECT * FROM orders')->fetchAll();
    foreach ($arrayOrders as $key => $value) {
        $orderString = implode('; ', $value);
        echo "$orderString<br>";
    }
}

function sendMail($id, $address, $thankYou)
{
    $mail_message = '
        <html>
            <head>
                <title>Заказ № ' . $id . '</title>
            </head>
            <body>
                <h2>Заказ № ' . $id . '</h2>
                <ul>
                    <li>Ваш заказ будет доставлен по адресу: ' . $address . '</li>
                    <li>Содержимое заказа: DarkBeefBurger за 500 рублей, 1 шт</li>
                    <li>' . $thankYou . '</li>
                </ul>
            </body>
        </html>';

    $headers = "From: Администратор сайта burger@burger.ru\r\n" .
        "MIME-Version: 1.0" . "\r\n" .
        "Content-type: text/html; charset=UTF-8" . "\r\n";

    return mail('kirill_ice@bk.ru', 'Заявка на доставку', $mail_message, $headers);
}
