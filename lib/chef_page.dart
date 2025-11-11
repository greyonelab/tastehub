import 'package:flutter/material.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({super.key});

  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  // List untuk bahan-bahan
  List<Map<String, String>> ingredients = [
    {'name': '', 'amount': ''}
  ];

  // List untuk langkah-langkah
  List<Map<String, String>> steps = [
    {'title': '', 'description': ''}
  ];

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    timeController.dispose();
    caloriesController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      ingredients.add({'name': '', 'amount': ''});
    });
  }

  void _removeIngredient(int index) {
    if (ingredients.length > 1) {
      setState(() {
        ingredients.removeAt(index);
      });
    }
  }

  void _addStep() {
    setState(() {
      steps.add({'title': '', 'description': ''});
    });
  }

  void _removeStep(int index) {
    if (steps.length > 1) {
      setState(() {
        steps.removeAt(index);
      });
    }
  }

  void _uploadRecipe() {
    // Validasi input
    if (titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul resep harus diisi!')),
      );
      return;
    }

    // Cek apakah ada bahan yang diisi
    bool hasIngredient = ingredients.any((ing) => 
      ing['name']!.isNotEmpty && ing['amount']!.isNotEmpty
    );

    if (!hasIngredient) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Minimal satu bahan harus diisi!')),
      );
      return;
    }

    // Cek apakah ada langkah yang diisi
    bool hasStep = steps.any((step) => 
      step['title']!.isNotEmpty && step['description']!.isNotEmpty
    );

    if (!hasStep) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Minimal satu langkah harus diisi!')),
      );
      return;
    }

    // Jika semua validasi lolos
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Resep berhasil diunggah!'),
        backgroundColor: Color(0xFF00B388),
      ),
    );

    // Debug print untuk melihat data
    print('=== RESEP BARU ===');
    print('Judul: ${titleController.text}');
    print('Deskripsi: ${descController.text}');
    print('Waktu: ${timeController.text} Min');
    print('Kalori: ${caloriesController.text} Kkal');
    print('Bahan-bahan:');
    for (var i = 0; i < ingredients.length; i++) {
      if (ingredients[i]['name']!.isNotEmpty) {
        print('  ${i + 1}. ${ingredients[i]['name']} - ${ingredients[i]['amount']}');
      }
    }
    print('Langkah-langkah:');
    for (var i = 0; i < steps.length; i++) {
      if (steps[i]['title']!.isNotEmpty) {
        print('  ${i + 1}. ${steps[i]['title']}: ${steps[i]['description']}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Buat Resep Baru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D2818),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Dasar
                    _buildSectionTitle('Informasi Dasar'),
                    const SizedBox(height: 12),
                    _buildCard(
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: titleController,
                            label: 'Judul Resep',
                            hint: 'Contoh: Nasi Goreng Kampung',
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: descController,
                            label: 'Deskripsi',
                            hint: 'Ceritakan tentang resep ini...',
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                  controller: timeController,
                                  label: 'Waktu (Menit)',
                                  hint: '15',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildTextField(
                                  controller: caloriesController,
                                  label: 'Kalori',
                                  hint: '280',
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Bahan-bahan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle('Bahan-bahan'),
                        TextButton.icon(
                          onPressed: _addIngredient,
                          icon: const Icon(Icons.add_circle_outline, size: 20),
                          label: const Text('Tambah'),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF00B388),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      ingredients.length,
                      (index) => _buildIngredientItem(index),
                    ),

                    const SizedBox(height: 24),

                    // Langkah-langkah
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionTitle('Langkah-langkah'),
                        TextButton.icon(
                          onPressed: _addStep,
                          icon: const Icon(Icons.add_circle_outline, size: 20),
                          label: const Text('Tambah'),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF00B388),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      steps.length,
                      (index) => _buildStepItem(index),
                    ),

                    const SizedBox(height: 32),

                    // Tombol Upload
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _uploadRecipe,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D2818),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Upload Resep',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0D2818),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0D2818),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF00B388), width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF0D2818),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
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
              const Expanded(
                child: Text(
                  'Bahan',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF0D2818),
                  ),
                ),
              ),
              if (ingredients.length > 1)
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => _removeIngredient(index),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) {
              ingredients[index]['name'] = value;
            },
            decoration: InputDecoration(
              hintText: 'Nama bahan (Contoh: Nasi Putih)',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF00B388), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              ingredients[index]['amount'] = value;
            },
            decoration: InputDecoration(
              hintText: 'Jumlah (Contoh: 1 Piring)',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF00B388), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF00B388),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
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
              const Expanded(
                child: Text(
                  'Langkah',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF0D2818),
                  ),
                ),
              ),
              if (steps.length > 1)
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => _removeStep(index),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) {
              steps[index]['title'] = value;
            },
            decoration: InputDecoration(
              hintText: 'Judul langkah (Contoh: Panaskan Wajan)',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF00B388), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              steps[index]['description'] = value;
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Deskripsi langkah...',
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF00B388), width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}