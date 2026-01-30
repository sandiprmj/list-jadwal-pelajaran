<?php
include 'config.php';
$data = json_decode(file_get_contents("php://input"));

$mk_id = $data->mk_id;
$tanggal = date("Y-m-d");

$conn->query("INSERT INTO sesi_absensi (mk_id, tanggal, status)
VALUES ('$mk_id','$tanggal','dibuka')");

echo json_encode(["status"=>"ok"]);
