<?php
include '../config.php';
$data = json_decode(file_get_contents("php://input"));

$nama = $data->nama_mk;
$dosen = $data->dosen_id;

$conn->query("INSERT INTO mata_kuliah (nama_mk,dosen_id)
VALUES ('$nama','$dosen')");

echo json_encode(["status"=>"success"]);
