<?php
session_start();
include "koneksi.php";

if(isset($_POST['login'])){

    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM user WHERE username='$username' AND password='$password'";
    $result = mysqli_query($conn,$query);

    if(mysqli_num_rows($result) > 0){

        $data = mysqli_fetch_assoc($result);

        $_SESSION['username'] = $data['username'];
        $_SESSION['role'] = $data['role'];

        if($data['role'] == "admin"){
            header("Location: admin/dashboard.php");
            exit;
        }else{
            header("Location: user/Identitas_User.php");
            exit;
        }

    }else{

        $_SESSION['flash'] = [
            'type' => 'error',
            'message' => 'Username atau password salah.'
        ];

        header("Location: login.php");
        exit;
    }
}
?>