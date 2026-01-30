<?php
include '../config.php';

$q = $conn->query("SELECT * FROM mata_kuliah");
$data = [];

while ($row = $q->fetch_assoc()) {
  $data[] = $row;
}

echo json_encode($data);
