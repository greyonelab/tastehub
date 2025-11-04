import 'package:flutter/material.dart';
import 'login.dart';
import 'home_page.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6DC8C7), // warna biru muda
      body: SafeArea(
        child: Stack(
          children: [
            // Tombol Lewati (pojok kanan atas)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: TextButton(
                  onPressed: () {
                    // pindah ke halaman Home
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                  child: const Text(
                    "Lewati",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            // Isi utama
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                const SizedBox(height: 40),

                // Teks utama
                const Text(
                  "Nikmati masakan\nlezat setiap hari",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 60),

                // Tombol Login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // navigasi ke HomePage juga
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF042A2B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Tombol Create New Account
                TextButton(
                  onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpPage()),
                        );
                      },
                  child: const Text(
                    "Create New Account",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
