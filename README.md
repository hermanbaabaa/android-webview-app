Android WebView app for https://smartlearningslb.id/
Android WebView app for https://smartlearningslb.id/

Cara menggunakan (Windows + Android Studio):

1) Buka Android Studio dan pilih "Open an existing project" lalu arahkan ke folder `android-webview-app`.
2) Biarkan Android Studio sinkronisasi Gradle. Jika diminta untuk meng-upgrade Gradle/Plugin, izinkan atau ikuti petunjuk Android Studio.
3) Hubungkan perangkat Android Anda via USB (aktifkan USB debugging / Developer Options).
4) Build -> "Build Bundle(s) / APK(s)" -> "Build APK(s)". Setelah selesai, klik "Locate" untuk menemukan APK debug.
5) Atau install langsung dari Android Studio Run -> pilih perangkat -> Run.

Cara install via adb (jika Anda punya APK debug):

- Pastikan `adb` tersedia (dalam PATH atau gunakan Android SDK Platform Tools).
- Jalankan di PowerShell:

```powershell
adb devices
adb install -r path\to\app-debug.apk
```

Catatan penting:
- Aplikasi ini hanya memuat situs `https://smartlearningslb.id/` di WebView.
- Pastikan server website menggunakan HTTPS yang valid agar konten load tanpa masalah.
- Jika situs memblokir embed (X-Frame-Options atau Content-Security-Policy), beberapa resource mungkin tidak tampil.

Perubahan terbaru:
- Menambahkan indikator progress saat halaman memuat (`ProgressBar`).
- Menambahkan halaman lokal `assets/error.html` yang tampil saat WebView gagal memuat konten.

File penting di project:
- `app/src/main/java/id/smartlearningslb/webviewapp/MainActivity.java` : activity WebView
- `app/src/main/AndroidManifest.xml` : izin INTERNET
- `app/src/main/res/layout/activity_main.xml` : layout WebView (termasuk `ProgressBar`)
- `app/src/main/assets/error.html` : halaman error lokal yang ditampilkan saat gagal muat

Jika ingin fitur tambahan, saya dapat menambahkan:
- Splash screen sederhana.
- Handling untuk deep links dan pembukaan link eksternal di browser.
- Penandatanganan release APK dan pembuatan bundle untuk Play Store.

Jika Anda ingin, saya bisa buat skrip `adb` untuk build & install otomatis (butuh Gradle wrapper).
