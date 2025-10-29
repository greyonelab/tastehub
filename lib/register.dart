import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6EB4A6), // warna latar belakang
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // First Name
                  _buildTextField("First Name", false),
                  const SizedBox(height: 15),

                  // Last Name
                  _buildTextField("Last Name", false),
                  const SizedBox(height: 15),

                  // Email
                  _buildTextField("Email", false),
                  const SizedBox(height: 15),

                  // Password
                  _buildTextField("Password", true, isConfirm: false),
                  const SizedBox(height: 15),

                  // Confirm Password
                  _buildTextField("Confirm Password", true, isConfirm: true),
                  const SizedBox(height: 10),

                  // Remember me
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text("Remember me"),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Divider
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("Or login with"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Social Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton("assets/image/icon_google.png"),
                      const SizedBox(width: 20),
                      _socialButton("assets/image/icon_fb.png"),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Back to Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
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

  // Fungsi reusable untuk textfield
  Widget _buildTextField(
    String hint,
    bool isPassword, {
    bool isConfirm = false,
  }) {
    return TextField(
      obscureText: isPassword
          ? (isConfirm ? _obscureConfirmPassword : _obscurePassword)
          : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  (isConfirm ? _obscureConfirmPassword : _obscurePassword)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    if (isConfirm) {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    } else {
                      _obscurePassword = !_obscurePassword;
                    }
                  });
                },
              )
            : null,
      ),
    );
  }

  // Tombol Google & Facebook
  Widget _socialButton(String imagePath) {
    return Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: Image.asset(imagePath, height: 24)),
    );
  }
}
