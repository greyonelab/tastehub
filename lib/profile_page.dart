import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ===== Header dengan Gambar dan Profil =====
              Stack(
                children: [
                  Container(
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/image/bg_profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 220,
                    color: Colors.black.withOpacity(0.25),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 42,
                          backgroundImage:
                              AssetImage("assets/image/foto_profile.jpg"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Jumbo",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Wiwok detok, Not onli tok de tok. Kuku-rukuk atok atok, Pokoke yo tok de tok.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ====== Kartu Menu 1 ======
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.location_on_outlined,
                  label: "Biodata",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.person_outline,
                  label: "Akun Saya",
                  onTap: () {},
                ),
              ]),

              const SizedBox(height: 16),

              // ====== Kartu Menu 2 ======
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.notifications_none,
                  label: "Notifikasi",
                  onTap: () {
                    Navigator.pushNamed(context, '/notification_page');
                  },
                ),
                _buildMenuItem(
                  icon: Icons.lock_outline,
                  label: "Password dan Keamanan",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.language_outlined,
                  label: "Bahasa",
                  onTap: () {},
                ),
              ]),

              const SizedBox(height: 16),

              // ====== Kartu Menu 3 ======
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.add_circle_outline,
                  label: "Tambah Resep",
                  onTap: () {
                    Navigator.pushNamed(context, '/chef_page');
                  },
                ),
                _buildMenuItem(
                  icon: Icons.info_outline,
                  label: "Tentang Aplikasi",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.feedback_outlined,
                  label: "Saran dan Masukan",
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  label: "FAQ",
                  onTap: () {},
                ),
              ]),

              const SizedBox(height: 16),

              // ====== Tutup Akun dan Logout ======
              _buildMenuCard([
                _buildMenuItem(
                  icon: Icons.delete_forever_outlined,
                  label: "Tutup / Hapus Akun",
                  color: Colors.redAccent,
                  onTap: () {},
                ),
              ]),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF073B3A),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Keluar / Logout",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ====== Widget Menu Card ======
  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // ====== Widget Item Menu ======
  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 16, color: Colors.black45),
      onTap: onTap,
    );
  }
}
