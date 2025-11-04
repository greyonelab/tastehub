import 'package:flutter/material.dart';

class NasiGorengLangkahPage extends StatefulWidget {
  const NasiGorengLangkahPage({Key? key}) : super(key: key);

  @override
  State<NasiGorengLangkahPage> createState() => _NasiGorengLangkahPageState();
}

class _NasiGorengLangkahPageState extends State<NasiGorengLangkahPage> {
  bool isBahanSelected = false; // Default ke Langkah

  // List untuk tracking langkah yang sudah selesai
  List<bool> completedSteps = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image with Back and Favorite buttons
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),

              // Content Section
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Time
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Nasi Goreng Kamp...',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0D2818),
                              ),
                            ),
                          ),
                          Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            '15 Min',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Description
                      Text(
                        'Masakan rumahan yang simpel, gurih, dan bikin nagih yang bisa kamu masak dalam hitungan menit!',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Nutrition Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNutritionItem(
                            Icons.grain_outlined,
                            '50g karbo',
                          ),
                          _buildNutritionItem(
                            Icons.egg_outlined,
                            '12g protein',
                          ),
                          _buildNutritionItem(
                            Icons.local_fire_department_outlined,
                            '280 Kkal',
                          ),
                          _buildNutritionItem(
                            Icons.water_drop_outlined,
                            '10g lemak',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Bahan and Langkah Tabs
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Kembali ke halaman Bahan
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: isBahanSelected
                                      ? const Color(0xFF0D2818)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Bahan',
                                    style: TextStyle(
                                      color: isBahanSelected
                                          ? Colors.white
                                          : Colors.grey[600],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0D2818),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Langkah',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Langkah Section
                      const Text(
                        'Langkah',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D2818),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '6 Langkah',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Steps List
                      _buildStepItem(
                        0,
                        'Panaskan Wajan',
                        'Panaskan wajan dengan api sedang, tambahkan sedikit minyak goreng.',
                      ),
                      _buildStepItem(
                        1,
                        'Tumis Bumbu',
                        'Tumis bawang putih dan bawang merah hingga harum dan berwarna kecoklatan.',
                      ),
                      _buildStepItem(
                        2,
                        'Masukkan Telur',
                        'Masukkan telur, orak-arik hingga setengah matang. Sisihkan ke pinggir wajan.',
                      ),
                      _buildStepItem(
                        3,
                        'Tambahkan Nasi',
                        'Masukkan nasi putih, aduk rata dengan bumbu dan telur.',
                      ),
                      _buildStepItem(
                        4,
                        'Beri Kecap Manis',
                        'Tuang kecap manis secukupnya, aduk hingga nasi berwarna merata.',
                      ),
                      _buildStepItem(
                        5,
                        'Sajikan',
                        'Koreksi rasa, angkat dan sajikan nasi goreng selagi hangat.',
                      ),
                      const SizedBox(height: 24),

                      // Creator Section
                      const Text(
                        'Pembuat Resep',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D2818),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Rina Nur Hasanah',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0xFF0D2818),
                                ),
                              ),
                              Text(
                                'Penulis dan pengembang resep',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Other Recipes Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Resep lain',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D2818),
                            ),
                          ),
                          Text(
                            'Semua',
                            style: TextStyle(
                              color: Color(0xFF00B388),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Recipe Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.85,
                        children: [
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400',
                            'Spageti T...',
                          ),
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=400',
                            'Nasi Gor...',
                          ),
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=400',
                            'Ayam Ke...',
                          ),
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=400',
                            'Ayam Bet...',
                          ),
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=400',
                            'Rendang P...',
                          ),
                          _buildRecipeCard(
                            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400',
                            'Pempek P...',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 24, color: const Color(0xFF0D2818)),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF0D2818),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStepItem(int index, String title, String description) {
    return GestureDetector(
      onTap: () {
        setState(() {
          completedSteps[index] = !completedSteps[index];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: completedSteps[index] ? const Color(0xFFE8F5F3) : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: completedSteps[index] 
                ? const Color(0xFF00B388) 
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step Number Circle
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: completedSteps[index] 
                    ? const Color(0xFF00B388) 
                    : const Color(0xFF0D2818),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: completedSteps[index]
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                    : Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            // Step Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0D2818),
                      decoration: completedSteps[index] 
                          ? TextDecoration.lineThrough 
                          : null,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                      decoration: completedSteps[index] 
                          ? TextDecoration.lineThrough 
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(String imageUrl, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D2818),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}