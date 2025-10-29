import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> kategori = [
      'Makan Siang',
      'Sarapan',
      'Snack',
      'Makan Malam',
    ];
    final List<Map<String, String>> populer = [
      {'gambar': 'assets/image/papeda.jpg', 'judul': 'Papeda'},
      {'gambar': 'assets/image/nasi_kuning.jpg', 'judul': 'Nasi Kuning'},
      {'gambar': 'assets/image/rendang.jpeg', 'judul': 'Rendang'},
      {'gambar': 'assets/image/puncake.webp', 'judul': 'Puncake Pisang'},
      {'gambar': 'assets/image/sate.jpg', 'judul': 'Sate'},
      {'gambar': 'assets/image/nasi-goreng.webp', 'judul': 'Nasi Goreng'},
      {'gambar': 'assets/image/buburkacang.webp', 'judul': 'Bubur Kacang'},
    ];
    final List<Map<String, String>> unggulan = [
      {'judul': 'Papeda', 'gambar': 'assets/image/papeda.jpg'},
      {'judul': 'Nasi kuning', 'gambar': 'assets/image/nasi_kuning.jpg'},
      {'judul': 'Rendang', 'gambar': 'assets/image/rendang.jpeg'},
      {'judul': 'puncake', 'gambar': 'assets/image/puncake.webp'},
      {'judul': 'sate', 'gambar': 'assets/image/sate.jpg'},
      {'judul': 'nasi goreng', 'gambar': 'assets/image/nasi-goreng.webp'},
      {'judul': 'bubur kacang', 'gambar': 'assets/image/buburkacang.webp'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tombol back
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),

                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Kategori (chips)
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: kategori.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(
                            kategori[index],
                            style: const TextStyle(color: Colors.black87),
                          ),
                          selectedColor: const Color(0xFF6EB4A6),
                          selected: index == 0,
                          onSelected: (_) {},
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Resep Populer
                _buildSectionTitle('Resep Populer'),
                const SizedBox(height: 10),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: populer.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Container(
                              width: 110,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    populer[index]['gambar']!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              populer[index]['judul']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                _buildSectionTitle('Resep Unggulan'),
                const SizedBox(height: 10),

                // Resep Unggulan (list)
                Column(
                  children: unggulan.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item['gambar']!,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['judul']!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Rina Nur Hasanah',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xFF073B3A),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Semua',
            style: TextStyle(
              color: Color(0xFF6EB4A6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
