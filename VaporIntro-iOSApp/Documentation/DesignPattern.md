# Basic REST API (iOS App)

> **Note:** Struktur folder di bawah ini berlaku untuk Aplikasi iOS atau aplikasi lainnya dengan arsitektur **MVC** atau **MVVM** yang akan menerima dan mengirim data ke REST API.

---

## 1. Aliran Data

1. **Database (DBMS)**  
   - Menyimpan data aplikasi secara permanen.  

2. **Services**  
   - Mengambil data dari database dan mengubahnya ke dalam bentuk **Models**.  

3. **Models**  
   - Merepresentasikan data yang didapat dari **Services** ke seluruh bagian aplikasi.  

4. **ViewModels (MVVM)**  
   - Melakukan filter data sensitif dari **Models**.  
   - Melakukan validasi data dari client untuk dikembalikan ke client.  

5. **Controller (MVC)**  
   - Melakukan filter data sensitif dari **Models**.  
   - Melakukan validasi data dari client untuk dikembalikan ke client.  

6. **Views**  
   - Menampilkan data yang diberikan oleh **ViewModels** atau **Controller** ke client.  
   - Untuk aplikasi: Menampilkan UI kepada pengguna.  
   - Untuk API: Memberikan API Response berupa JSON/XML.  

### Aliran Data Berdasarkan Arsitektur
- **MVVM:**  
  `Database -> Services -> Models -> ViewModels -> Views`  

- **MVC:**  
  `Database -> Services -> Models -> Controller -> Views`

---

## 2. Struktur Folder

### **Service**
- **Fungsi:**
  - Mengambil data dari database dan mengubah data ke bentuk **Models**.
  - Melakukan abstraksi data antara sumber data dengan aplikasi.  

---

### **Models**
- **Fungsi:**
  - Mewakili model data dari database ke dalam aplikasi.
  - Membuat representasi objek dari suatu data (contoh: `Song` memiliki properti seperti `id`, `title`, `artist`, `album`, `genre`, dll.).
  - Mempermudah pengelolaan data dengan mengonversi data ke tipe yang bisa diolah oleh bahasa pemrograman tertentu.

---

### **Utilities**
- **Fungsi:**
  - Menyimpan kode yang bersifat umum dan dapat digunakan kembali (Reusable Code).
  - Mendukung fungsionalitas aplikasi tanpa terkait langsung dengan fitur inti.
  - **Contoh Kode di Utilities:**
    - Helper Functions
    - Error Handling Custom
    - Logging Tools
    - Configuration Files
    - Encryption dan Security
    - Middleware Custom
    - Third-Party Integration
    - Data Transformation
    - Testing
  - **Tujuan:**
    - Memisahkan tanggung jawab antara logika utama dan logika pendukung.
    - Menerapkan prinsip **DRY (Don't Repeat Yourself)**.

---

### **ViewModels (MVVM) / Controller (MVC)**
- **Fungsi:**
  - Mewakili model data dari folder **Models** untuk disajikan ke client.
  - Menentukan struktur data yang akan dikirimkan ke client dan ditampilkan di **View**.
  - **Tanggung Jawab:**
    - Filter data sensitif (hanya menampilkan data yang diperbolehkan ke client).
    - Transformasi data sesuai kebutuhan client.
    - Validasi input dari client untuk memastikan data yang dikirim sesuai dan mencegah penyalahgunaan.
    - **ViewModel** (MVVM) bertanggung jawab untuk bagaimana data ditampilkan ke client.

---

### **Views**
- **Fungsi:**
  - Bertanggung jawab atas tampilan UI dan data yang akan dilihat oleh client.
  - **Dalam Aplikasi iOS:**
    - Menampilkan data ke pengguna melalui antarmuka.
  - **Dalam API:**
    - Menampilkan data berupa API Response (contoh: JSON/XML).

---

## 3. Catatan Tambahan
- **MVVM** dan **MVC** tidak digunakan bersamaan dalam satu proyek.
- Pilih salah satu arsitektur sesuai dengan kebutuhan aplikasi:
  - **MVVM:** Cocok untuk aplikasi dengan **SwiftUI** yang mendukung data binding.
  - **MVC:** Cocok untuk aplikasi dengan **UIKit** yang lebih sederhana.
