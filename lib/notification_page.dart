import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Notifikasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF073B3A),
                ),
              ),
              const SizedBox(height: 60),

              // Lingkaran efek shadow + icon
              Stack(
                alignment: Alignment.center,
                children: [
                  // Lingkaran luar abu-abu tipis
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Colors.grey.shade300, Colors.white],
                        center: Alignment.center,
                        radius: 0.85,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),

                  // Lingkaran dalam dengan ikon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF073B3A),
                      child: Icon(
                        Icons.notifications_off_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              const Text(
                'Tidak Ada Notifikasi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Notifikasi kamu akan muncul di halaman ini',
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
