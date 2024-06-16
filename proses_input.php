<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "reservasi_lapangan";

// Membuat koneksi ke MySQL
$conn = new mysqli($host, $username, $password, $database);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nik = $_POST["nik"];
    $nama = $_POST["nama"];
    $no_telp = $_POST["no_telp"];
    $email = $_POST["email"];
    $jns_lapangan = $_POST["jns_lapangan"];
    $tanggal_booking = $_POST["tanggal_booking"];
    $jam_mulai = $_POST["jam_mulai"];
    $jam_selesai = $_POST["jam_selesai"];
    $harga = $_POST["harga"];

    // Menyimpan data ke dalam database
    $sql = "INSERT INTO booking (tanggal_booking, jam_mulai, jam_selesai, harga)
    VALUES ('$tanggal_booking', '$jam_mulai', '$jam_selesai', '$harga');";

    if ($conn->query($sql) === TRUE) {
        $sql2 = "INSERT INTO pemesan (nik, nama, no_telp, email)
        VALUES ('$nik', '$nama', '$no_telp', '$email');";
        if ($conn->query($sql2) === TRUE) {
            if (isset($_FILES['bukti_pembayaran'])) {
                $nama_gambar = $_FILES['bukti_pembayaran']['name'];
                $ukuran_gambar = $_FILES['bukti_pembayaran']['size'];
                $tipe_gambar = $_FILES['bukti_pembayaran']['type'];
                $lokasi_gambar = $_FILES['bukti_pembayaran']['tmp_name'];

                // Periksa tipe file
                $allowed_types = array('image/jpeg', 'image/png', 'image/gif');
                if (!in_array($tipe_gambar, $allowed_types)) {
                    echo "Tipe file tidak didukung.";
                    exit;
                }

                // Direktori tujuan penyimpanan
                $upload_dir = 'C:/xampp/xampp/htdocs/reservasi lapangan/buktiPembayaran/';

                // Pindahkan file ke direktori tujuan
                if (move_uploaded_file($lokasi_gambar, $upload_dir . $nama_gambar)) {
                    // Baca data gambar
                    $data_gambar = file_get_contents($upload_dir . $nama_gambar);

                    // Masukkan data gambar ke dalam tabel
                    $sql3 = "INSERT INTO pembayaran (bukti_pembayaran) VALUES ('$upload_dir$nama_gambar')";
                    $stmt = $conn->prepare($sql3);
                    if ($stmt->execute()) {
                        echo "Berhasil mengunggah data.";
                        // kalo berhasil 
  
                    } else {
                        echo "Gagal mengunggah gambar.";
                    }
                    $stmt->close();
                } else {
                    echo "Gagal memindahkan file.";
                }
            } else {
                echo "File gambar tidak ditemukan.";
            }
        } else {
            echo "Error: " . $sql2 . "<br>" . $conn->error;
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Menutup koneksi
$conn->close();
?>