// ========================================
// File: lib/home_page.dart
// ========================================
import 'package:flutter/material.dart';
import 'resep/nasi_goreng/bahan.dart'; // Import halaman bahan

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Resep Praktis",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    Icons.wb_sunny_outlined,
                    size: 18,
                    color: Color(0xFF6DC8C7),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Selamat Pagi",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Section Unggulan
              const Text(
                "Unggulan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _featuredCard(
                      "Mie Kuah Topping Seafood",
                      "Farhan Fauzan A",
                      "20 Min",
                      "assets/image/featured1.png",
                      context,
                      null,
                    ),
                    _featuredCard(
                      "Pancake Pisang Madu",
                      "Caca Sandi Permana",
                      "25 Min",
                      "assets/image/featured2.png",
                      context,
                      null,
                    ),
                    _featuredCard(
                      "Soup Vgeratian Food",
                      "Rina Nurhasanah",
                      "30 Min",
                      "assets/image/featured3.png",
                      context,
                      null,
                    ),
                    _featuredCard(
                      "Nasi Goreng Telur Kecap",
                      "Sopyan Yusuf",
                      "35 Min",
                      "assets/image/featured4.png",
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NasiGorengBahanPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Kategori
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Kategori",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Semua",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6DC8C7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _CategorySection(),

              const SizedBox(height: 24),

              // Resep Populer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Resep Populer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Semua",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6DC8C7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.78,
                children: [
                  _recipeCard(
                    "Salad Renyah ala Nusantara",
                    "assets/image/salad.jpg",
                    "120 Kalori",
                    "20 Min",
                    context,
                  ),
                  _recipeCard(
                    "Pancake Pisang Fluffy",
                    "assets/image/pancake.jpg",
                    "64 Kalori",
                    "12 Min",
                    context,
                  ),
                  _recipeCard(
                    "Kue Pancake Pisang",
                    "assets/image/pancake2.jpg",
                    "120 Kalori",
                    "20 Min",
                    context,
                  ),
                  _recipeCard(
                    "Nasi goreng Telur Kecap",
                    "assets/image/nasgor.jpg",
                    "64 Kalori",
                    "12 Min",
                    context,
                  ),
                  _recipeCard(
                    "Pempek Dos Palembang",
                    "assets/image/pempek.jpg",
                    "120 Kalori",
                    "20 Min",
                    context,
                  ),
                  _recipeCard(
                    "Bubur Ayam",
                    "assets/image/bubur.jpg",
                    "64 Kalori",
                    "12 Min",
                    context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _featuredCard(
    String title,
    String author,
    String time,
    String imagePath,
    BuildContext context,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap ?? () {
        print('Featured card tapped: $title');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 220,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF6DC8C7),
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6DC8C7).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _recipeCard(
    String title,
    String image,
    String calorie,
    String time,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        if (title.toLowerCase().contains('nasi goreng')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NasiGorengBahanPage(),
            ),
          );
        } else {
          print('Resep yang dipilih: $title');
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Image.asset(
                        image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            size: 16,
                            color: const Color(0xFF6DC8C7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 14,
                          color: const Color(0xFF6DC8C7),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          calorie,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: const Color(0xFF6DC8C7),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySection extends StatefulWidget {
  @override
  __CategorySectionState createState() => __CategorySectionState();
}

class __CategorySectionState extends State<_CategorySection> {
  int _selectedIndex = 0;
  final List<String> _categories = ["Semua", "Sarapan", "Makan Siang"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_categories.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? const Color(0xFF6DC8C7)
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _categories[index],
              style: TextStyle(
                color: _selectedIndex == index ? Colors.white : Colors.black87,
                fontWeight: _selectedIndex == index
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
          ),
        );
      }),
    );
  }
}