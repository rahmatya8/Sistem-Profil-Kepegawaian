<?php
include "../config/koneksi.php";

/* =====================
   TAMBAH DATA
===================== */
if (isset($_POST['tambah'])) {

    $hub_keluarga = trim($_POST['hub_keluarga'] ?? '');

    if ($hub_keluarga !== "") {

        $hub_keluarga = mysqli_real_escape_string($conn, $hub_keluarga);

        $insert = mysqli_query(
            $conn,
            "INSERT INTO master_hub_kel (hub_kel) 
             VALUES ('$hub_keluarga')"
        );

        if (!$insert) {
            die("Error: " . mysqli_error($conn));
        }

        header("Location: DM_hub_keluarga.php");
        exit;
    }
}

/* =====================
   HAPUS DATA
===================== */

if (isset($_GET['hapus'])) {
    $id = (int) $_GET['hapus'];

    mysqli_query($conn, "DELETE FROM master_hub_kel WHERE id_hub_kel = $id");

    header("Location: DM_hub_keluarga.php");
    exit;
}

/* =====================
   UPDATE DATA
===================== */
if (isset($_POST['update'])) {

    $id = (int) ($_POST['id_edit'] ?? 0);
    $hub_keluarga = trim($_POST['hub_keluarga_edit'] ?? '');

    if ($id > 0 && $hub_keluarga !== '') {

        $hub_keluarga = mysqli_real_escape_string($conn, $hub_keluarga);

        mysqli_query($conn,
            "UPDATE master_hub_kel
             SET hub_kel = '$hub_keluarga' 
             WHERE id_hub_kel = $id"
        );
    }

    header("Location: DM_hub_keluarga.php");
    exit;
}

/* =====================
   PAGINATION AMBIL DATA
===================== */

$limit = 10; // jumlah data per halaman

// Halaman aktif
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;

$offset = ($page - 1) * $limit;

// Hitung total data
$totalQuery = mysqli_query($conn, "SELECT COUNT(*) as total FROM master_hub_kel");
$totalData = mysqli_fetch_assoc($totalQuery)['total'];

$totalPages = ceil($totalData / $limit);

/* Ambil data sesuai halaman */
$query = mysqli_query($conn,
    "SELECT id_hub_kel, hub_kel
     FROM master_hub_kel
     ORDER BY id_hub_kel
     LIMIT $limit OFFSET $offset"
);

if (!$query) {
    die("Query error: " . mysqli_error($conn));
}

/* =====================
   BULK DELETE
===================== */

if (isset($_POST['id_delete'])) {

    $ids = $_POST['id_delete'];

    if (!empty($ids)) {

        // Amankan jadi integer
        $ids = array_map('intval', $ids);
        $idList = implode(',', $ids);

        mysqli_query($conn,
            "DELETE FROM master_hub_kel
             WHERE id_hub_kel IN ($idList)"
        );
    }

    header("Location: DM_hub_keluarga.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Manage Hubungan Keluarga</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="role-admin" data-jenis="hub_keluarga">

<!-- TOMBOL KELUAR -->
<button class="tombol-keluar">Log Out</button>

<!-- SIDEBAR -->
<aside class="sidebar" id="sidebar">
    <div class="logo">
        <span>LOGO</span>
        <button class="tombol-menu" id="tombolMenu">✕</button>
    </div>

    <hr class="garis-menu">

    <div class="item-menu">Profil Data Pegawai</div>
    <hr class="garis-menu">

    <div class="item-menu">Tambah Data Pegawai Baru</div>
    <hr class="garis-menu">

    <div class="item-menu">Pengaturan Akun</div>
    <hr class="garis-menu">

    <div class="item-menu aktif" id="menuDataMaster">
        Data Master
        <span class="panah-menu" id="panahDataMaster">▼</span>
    </div>

        <hr class="garis-menu" />

    <div class="item-menu">Manajemen Akun</div>

    <div class="submenu aktif" id="submenuDataMaster">
        <a href="DM_gender.php" class="item-submenu">Jenis Kelamin</a>
        <a href="DM_agama.php" class="item-submenu">Agama</a>
        <a href="DM_status_kawin.php" class="item-submenu">Status Perkawinan</a>
        <a href="DM_jenjang_pendidikan.php" class="item-submenu">Jenjang Pendidikan</a>
        <a href="DM_hub_keluarga.php" class="item-submenu aktif">Hubungan Keluarga</a>
        <a href="DM_golongan.php" class="item-submenu">Golongan</a>
        <a href="DM_jabatan.php" class="item-submenu">Jabatan</a>
        <a href="DM_divisi.php" class="item-submenu">Unit Kerja / Divisi</a>
        <a href="DM_diklat.php" class="item-submenu">Jenis Diklat</a>
        <a href="DM_predikat_skp.php" class="item-submenu">Predikat SKP</a>
        <a href="DM_kab_kota.php" class="item-submenu">Kabupaten/Kota</a>
    </div>

    <hr class="garis-menu">
</aside>

<!-- KONTEN -->
<main class="konten">

<h2>Data Master</h2>

<!-- BARIS ATAS -->
<div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">

    <!-- SHOW ENTRIES -->
    <div>
        Show 
        <select id="entriesSelect" style="height:28px;">
            <option value="5">5</option>
            <option value="10" selected>10</option>
        </select>
        Entries
    </div>
</div>

<!-- HEADER MERAH -->
<div class="header-master">
    <span class="judul-master">Manage Hubungan Keluarga</span>

    <div class="header-actions">
        <button type="button"
                class="tombol-hapus"
                onclick="openBulkDeleteModal()">
            Hapus Terpilih
        </button>

        <button type="button"
                class="tombol-tambah"
                onclick="openModal()">
            Add New
        </button>
    </div>
</div>

<!-- TABEL -->
<form method="POST" id="formBulkDelete">

<table width="100%" class="tabel-master">
    <thead>
        <tr>
            <th width="5%">
                <input type="checkbox" id="checkAll">
            </th>
            <th>Hubungan Keluarga</th>
            <th width="15%">Aksi</th>
        </tr>
    </thead>

    <tbody>

    <?php 
    if (mysqli_num_rows($query) > 0) {
        while ($row = mysqli_fetch_assoc($query)) {
    ?>

    <tr>
        <td>
            <input type="checkbox" 
                   name="id_delete[]" 
                   value="<?= $row['id_hub_kel']; ?>">
        </td>

        <td><?= htmlspecialchars($row['hub_kel']); ?></td>

        <td>
            <button type="button"
                    class="tombol-ubah"
                    onclick="openEditModal(<?= $row['id_hub_kel']; ?>, '<?= htmlspecialchars($row['hub_kel']); ?>')">
                <i class="fa-solid fa-pen"></i>
            </button>

            <button type="button"
                    class="tombol-hapus"
                    onclick="openDeleteModal(<?= $row['id_hub_kel']; ?>)">
                <i class="fa-solid fa-trash"></i>
            </button>
        </td>
    </tr>

    <?php 
        }
    } else {
        echo "<tr>
                <td colspan='3' style='text-align:center; padding:20px;'>
                    Belum ada data
                </td>
            </tr>";
    }
    ?>

    </tbody>
</table>

<!-- FOOTER TABLE -->
<?php
$start = $offset + 1;
$end = min($offset + $limit, $totalData);
?>

<div class="table-footer">

    <div>
        Showing <?= $start ?>–<?= $end ?> of <?= $totalData ?> entries
    </div>

    <div id="pagination">

        <!-- Previous -->
        <?php if ($page > 1): ?>
            <a href="?page=<?= $page - 1 ?>" class="tombol-previous">Previous</a>
        <?php else: ?>
            <button class="tombol-previous" disabled>Previous</button>
        <?php endif; ?>

        <!-- Nomor Halaman -->
        <?php for ($i = 1; $i <= $totalPages; $i++): ?>
            <a href="?page=<?= $i ?>"
               class="tombol-next"
               style="<?= $i == $page ? 'background:#1f5fbf;' : '' ?>">
                <?= $i ?>
            </a>
        <?php endfor; ?>

        <!-- Next -->
        <?php if ($page < $totalPages): ?>
            <a href="?page=<?= $page + 1 ?>" class="tombol-next">Next</a>
        <?php else: ?>
            <button class="tombol-next" disabled>Next</button>
        <?php endif; ?>

    </div>
</div>

</main>

<!-- MODAL TAMBAH -->
<div id="modalTambah" class="modal">
    <div class="modal-content">

        <h3 style="margin-top:0;">Tambah Hubungan Keluarga</h3>

        <form method="POST" action="">
            <input type="text" 
                   name="hub_keluarga" 
                   placeholder="Masukkan Hubungan Keluarga" 
                   required
                   style="width:100%; height:35px; margin-bottom:15px; padding:5px;">

            <div style="display:flex; justify-content:flex-end; gap:10px;">
                <button type="button" onclick="closeModal()" class="tombol-hapus">
                    Batal
                </button>

                <button type="submit" name="tambah" class="tombol-tambah">
                    Simpan
                </button>
            </div>
        </form>

    </div>
</div>

<!-- MODAL HAPUS -->
<div id="modalHapus" class="modal">
    <div class="modal-content">

        <h3>Konfirmasi Hapus</h3>
        <p>Yakin ingin menghapus data ini?</p>

        <div style="display:flex; justify-content:flex-end; gap:10px; margin-top:20px;">
            <button type="button"
                    onclick="closeDeleteModal()"
                    class="tombol-tambah">
                Batal
            </button>

            <a id="btnHapusFinal"
               href="#"
               class="tombol-hapus"
               style="padding:8px 15px; text-decoration:none;">
                Hapus
            </a>
        </div>
    </div>
</div>

<!-- MODAL BULK-DELETE -->
<div id="modalBulkDelete" class="modal">
    <div class="modal-content">

        <h3>Konfirmasi Hapus</h3>
        <p>Yakin ingin menghapus data yang dipilih?</p>

        <div style="display:flex; justify-content:flex-end; gap:10px;">
            <button type="button"
                    onclick="closeBulkDeleteModal()"
                    class="tombol-tambah">
                Batal
            </button>

            <button type="button"
                    onclick="submitBulkDelete()"
                    class="tombol-hapus">
                Hapus
            </button>
        </div>
    </div>
</div>

<!-- MODAL EDIT -->
<div id="modalEdit" class="modal">
    <div class="modal-content">

        <h3>Edit Hubungan Keluarga</h3>

        <form method="POST">
            <input type="hidden" name="id_edit" id="editId">

            <input type="text"
                   name="hub_keluarga_edit"
                   id="editHubKeluarga"
                   required
                   style="width:100%; height:35px; margin-bottom:15px; padding:5px;">

            <div style="display:flex; justify-content:flex-end; gap:10px;">
                <button type="button"
                        onclick="closeEditModal()"
                        class="tombol-hapus">
                    Batal
                </button>

                <button type="submit"
                        name="update"
                        class="tombol-tambah">
                    Simpan
                </button>
            </div>
        </form>
    </div>
</div>

<!-- TOAST NOTIFICATION -->
<div id="toastNotif" class="toast"></div>

<script src="../assets/js/script.js"></script>
<script src="../assets/js/master.js"></script>

<script>
//modal edit//
function openEditModal(id, nama) {
    document.getElementById("editId").value = id;
    document.getElementById("editHubKeluarga").value = nama;
    document.getElementById("modalEdit").style.display = "block";
}

function closeEditModal() {
    document.getElementById("modalEdit").style.display = "none";
}
</script>
</body>
</html>