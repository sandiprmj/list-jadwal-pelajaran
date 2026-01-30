<?php
include 'config.php';
$data = json_decode(file_get_contents("php://input"));

$sesi_id = $data->sesi_id;
$mahasiswa_id = $data->mahasiswa_id;
$waktu = date("H:i:s");

$conn->query("INSERT INTO absensi (sesi_id, mahasiswa_id, waktu, status)
VALUES ('$sesi_id','$mahasiswa_id','$waktu','Hadir')");

echo json_encode(["status"=>"hadir"]);
