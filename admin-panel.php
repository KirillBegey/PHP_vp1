<?php
require("./php/pdo.php");
require("./php/functions.php");

echo "<h3>Административная панель</h3>";
echo "<h4>Всего пользователей зарегистрировано:</h4>";
echo usersList($pdo);
echo "<h4>Общее количество заказов:</h4>";
echo ordersList($pdo);