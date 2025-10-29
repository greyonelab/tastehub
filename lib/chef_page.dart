import 'package:flutter/material.dart';

class ChefPage extends StatelessWidget {
  const ChefPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller untuk setiap input
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController ingredientsController = TextEditingController();
    final TextEditingController stepsController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Tombol close =====
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // ===== Judul Halaman =====
                const Text(
                  'Masukan Resep',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF073B3A),
                  ),
                ),
                const SizedBox(height: 20),

                // ===== Form Card =====
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Judul Resep',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildInputField(titleController, 'judul...'),

                      const SizedBox(height: 14),
                      const Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildInputField(descController, 'deskripsi...'),

                      const SizedBox(height: 14),
                      const Text(
                        'Bahan-bahan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildInputField(ingredientsController, 'bahan..'),

                      const SizedBox(height: 14),
                      const Text(
                        'Langkah-langkah',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      _buildInputField(stepsController, 'langkah..'),

                      const SizedBox(height: 20),

                      // ===== Tombol Upload =====
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi upload resep nanti di sini
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Resep berhasil diunggah!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== Widget TextField Reusable =====
  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      maxLines: 1,
    );
  }
}
