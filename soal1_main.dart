import 'package:flutter/material.dart'; // Mengimpor paket material design untuk UI Flutter

void main() {
  // Fungsi utama yang dijalankan saat aplikasi dimulai
  runApp(
    const MyApp(),
  ); // Menjalankan aplikasi dengan widget MyApp sebagai root
}

class MyApp extends StatelessWidget {
  // Kelas utama aplikasi yang bersifat stateless (tidak berubah state)
  const MyApp({
    super.key,
  }); // Constructor dengan parameter key yang diteruskan ke parent

  @override
  Widget build(BuildContext context) {
    // Method yang membangun UI aplikasi
    return MaterialApp(
      // Widget dasar aplikasi Material Design
      title:
          'ListView.Builder Demo', // Judul aplikasi yang muncul di task manager
      theme: ThemeData(
        // Konfigurasi tema aplikasi
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(
            0xFF800000,
          ), // Menggunakan warna maroon sebagai warna dasar tema
        ),
        useMaterial3: true, // Menggunakan Material Design 3
        textTheme: ThemeData.light().textTheme.copyWith(
          // Menyesuaikan tema teks dari tema terang default
          bodyLarge: TextStyle(
            // Gaya teks untuk bodyLarge
            fontFamily: 'Roboto', // Font Roboto
            fontWeight: FontWeight.w400, // Ketebalan font normal (400)
          ),
          bodyMedium: TextStyle(
            // Gaya teks untuk bodyMedium
            fontFamily: 'Roboto', // Font Roboto
            fontWeight: FontWeight.w400, // Ketebalan font normal (400)
          ),
          bodySmall: TextStyle(
            // Gaya teks untuk bodySmall
            fontFamily: 'Roboto', // Font Roboto
            fontWeight: FontWeight.w400, // Ketebalan font normal (400)
          ),
          titleLarge: TextStyle(
            // Gaya teks untuk titleLarge
            fontFamily: 'Roboto', // Font Roboto
            fontWeight: FontWeight.bold, // Ketebalan font tebal
          ),
        ),
      ),
      home: const MyHomePage(
        title: 'ListView.Builder',
      ), // Halaman utama aplikasi dengan judul
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Kelas halaman utama yang bersifat stateless
  const MyHomePage({
    super.key,
    required this.title,
  }); // Constructor dengan parameter wajib title

  final String title; // Properti untuk menyimpan judul halaman

  final List<Map<String, String>> people = const [
    // Daftar data orang dengan bidang keahlian (data statis)
    {"name": "ANNABIYA", "field": "Data Science"}, // Orang pertama
    {"name": "ADELA", "field": "Creative Design"}, // Orang kedua
    {"name": "LEVINA", "field": "Cyber Security"}, // Orang ketiga
    {"name": "ORIHA", "field": "Game Development"}, // Orang keempat
    {"name": "CARMELLO", "field": "Artificial Intelligence"}, // Orang kelima
    {"name": "MINGYU", "field": "UI/UX Engineering"}, // Orang keenam
    {"name": "JENNIE", "field": "Digital Marketing"}, // Orang ketujuh
    {"name": "LISA", "field": "Music Technology"}, // Orang kedelapan
    {"name": "ROSE", "field": "Multimedia Arts"}, // Orang kesembilan
    {"name": "JISOO", "field": "Cloud Computing"}, // Orang kesepuluh
  ];

  @override
  Widget build(BuildContext context) {
    // Method yang membangun UI halaman
    return Scaffold(
      // Widget dasar untuk halaman dengan struktur material design
      appBar: AppBar(
        // Bar aplikasi di bagian atas
        title: Text(title), // Judul app bar menggunakan properti title
        centerTitle: true, // Judul diposisikan di tengah
        backgroundColor: Color(
          0xFF800000,
        ), // Warna latar belakang app bar maroon
        foregroundColor: Colors.white, // Warna teks dan ikon di app bar putih
      ),
      body: ListView.builder(
        // Widget untuk membuat daftar yang dapat di-scroll dengan builder
        itemCount: people.length, // Jumlah item dalam daftar (10 orang)
        itemBuilder: (context, index) {
          // Fungsi builder yang dipanggil untuk setiap item
          final person =
              people[index]; // Mengambil data orang pada indeks saat ini
          final initials =
              person["name"]!
                  .substring(0, 2)
                  .toUpperCase(); // Mengambil 2 huruf pertama dari nama
          return Card(
            // Mengembalikan widget Card untuk setiap item
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ), // Margin 8px atas-bawah, 16px kiri-kanan
            elevation: 8, // Elevasi kartu (bayangan) 8 piksel
            shape: RoundedRectangleBorder(
              // Bentuk kartu dengan sudut melengkung
              borderRadius: BorderRadius.circular(12), // Radius sudut 12 piksel
            ),
            child: ListTile(
              // Widget ListTile sebagai konten kartu
              leading: CircleAvatar(
                // Avatar lingkaran di bagian depan
                backgroundColor: Color(
                  0xFF800000,
                ), // Warna latar belakang avatar maroon
                child: Text(
                  // Teks di dalam avatar
                  initials, // Menampilkan inisial (2 huruf pertama nama)
                  style: const TextStyle(
                    color: Colors.white,
                  ), // Gaya teks putih
                ),
              ),
              title: Text(
                // Teks judul (nama orang)
                person["name"]!, // Mengambil nilai dari kunci "name"
                style: const TextStyle(
                  // Gaya teks judul
                  fontWeight: FontWeight.bold, // Tebal
                  fontSize: 18, // Ukuran font 18
                  color:
                      Colors.black87, // Warna hitam dengan sedikit transparansi
                ),
              ),
              subtitle: Text(
                // Teks subjudul (bidang keahlian)
                person["field"]!, // Mengambil nilai dari kunci "field"
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ), // Gaya teks ukuran 14, warna abu-abu
              ),
            ),
          );
        },
      ),
    );
  }
}
