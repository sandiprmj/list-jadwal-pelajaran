<?php
$conn = new mysqli("localhost", "root", "", "absensi_kampus");
if ($conn->connect_error) {
  die("Koneksi gagal");
}
?>
