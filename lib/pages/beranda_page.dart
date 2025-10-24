import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== HEADER =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol bulat email
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Buka pesan masuk')),
                            );
                          },
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidEnvelope,
                              color: Color(0xFF005285),
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Logo perusahaan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Image.asset(
                      'assets/images/logo_alamin_baru.png',
                      height: 45,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Foto profil bulat
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/pp.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ===== IMAGE CAROUSEL =====
              CarouselSlider.builder(
                itemCount: _images.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 4),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Color(0xFF005285), // biar backgroundnya rapi kalau ada ruang kosong
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // ===== CUSTOM INDICATOR =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _images.asMap().entries.map((entry) {
                  bool isActive = entry.key == _currentIndex;
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: isActive ? 18 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFF005285)
                            : const Color(0xFF8CCDEB),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              //lengkapi Data diri siswa
              DefaultTextStyle(
                style: TextStyle(fontSize: 20, color: Color(0xFF5C5C5C)),
                child: Row(
                  children: const [
                    Text('Lengkapi Data Diri Anda'),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0XFFFFE3A9),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ICON DI KIRI
                    FaIcon(FontAwesomeIcons.peopleGroup, size: 40, color: Color(0xFF5C5C5C)),

                    const SizedBox(width: 16),

                    // TEKS DI TENGAH
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "AT TA'MIN SISWA",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5C5C5C),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Asuransi Kumpulan",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF5C5C5C),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // BUTTON DI KANAN
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5C5C5C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Lengkapi",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ===== ISI BERANDA =====
              Expanded(
                child: Center(
                  child: Text(
                    'Selamat Datang di Beranda',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
