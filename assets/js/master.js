let dataMaster = []; // Kosong dulu supaya bisa tes "Belum ada data"

function renderTable() {
    const tbody = document.getElementById("tableBody");
    tbody.innerHTML = "";

    if (dataMaster.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="3" style="text-align:center; padding:20px;">
                    Belum ada data
                </td>
            </tr>
        `;
        return;
    }

    dataMaster.forEach((item, index) => {
        tbody.innerHTML += `
            <tr>
                <td><input type="checkbox" value="${index}"></td>
                <td>${item}</td>
                <td>
                    <button class="tombol-ubah" onclick="editData(${index})">✏</button>
                    <button class="tombol-hapus" onclick="hapusData(${index})">🗑</button>
                </td>
            </tr>
        `;
    });
}

function tambahData() {
    const nama = prompt("Masukkan Jenis Kelamin:");

    if (nama && nama.trim() !== "") {
        dataMaster.push(nama.trim());
        renderTable();
    }
}

function editData(index) {
    const namaBaru = prompt("Edit Jenis Kelamin:", dataMaster[index]);

    if (namaBaru && namaBaru.trim() !== "") {
        dataMaster[index] = namaBaru.trim();
        renderTable();
    }
}

function hapusData(index) {
    if (confirm("Yakin ingin menghapus data ini?")) {
        dataMaster.splice(index, 1);
        renderTable();
    }
}

function hapusTerpilih() {
    const checkboxes = document.querySelectorAll("#tableBody input[type='checkbox']:checked");

    if (checkboxes.length === 0) {
        alert("Pilih data yang ingin dihapus.");
        return;
    }

    if (confirm("Yakin ingin menghapus data terpilih?")) {
        let indexToDelete = [];
        checkboxes.forEach(cb => {
            indexToDelete.push(parseInt(cb.value));
        });

        dataMaster = dataMaster.filter((_, index) => !indexToDelete.includes(index));
        renderTable();
    }
}

document.addEventListener("DOMContentLoaded", renderTable);
