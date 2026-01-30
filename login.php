<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

$conn = new mysqli("localhost", "root", "", "absensi_kampus");

$email = $_POST['email'];
$password = $_POST['password'];

$q = $conn->query("SELECT * FROM users WHERE email='$email'");

if ($q->num_rows == 0) {
    echo json_encode([
        "success" => false,
        "message" => "Email tidak ditemukan"
    ]);
    exit;
}

$user = $q->fetch_assoc();

if ($password == $user['password']) {
    echo json_encode([
        "success" => true,
        "role" => $user['role'],
        "user" => $user
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Password salah"
    ]);
}
