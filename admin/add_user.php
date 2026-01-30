<?php
include '../config.php';
$data = json_decode(file_get_contents("php://input"));

$nama = $data->nama;
$email = $data->email;
$password = password_hash($data->password, PASSWORD_DEFAULT);
$role = $data->role;

$conn->query("INSERT INTO users (nama,email,password,role)
VALUES ('$nama','$email','$password','$role')");

echo json_encode(["status"=>"success"]);
