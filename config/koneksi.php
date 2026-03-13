<?php

$host = "localhost";
$user = "root";
$pass = "";
$db   = "profil_kepegawaian"; //nama database

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}