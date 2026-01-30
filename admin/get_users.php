<?php
include '../config.php';

$result = $conn->query("SELECT id, nama, email, role FROM users");
$data = [];

while ($row = $result->fetch_assoc()) {
  $data[] = $row;
}

echo json_encode($data);
