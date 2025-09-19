import 'package:flutter/material.dart';
import 'generate_password_page.dart';

class AddAccountPage extends StatelessWidget {
  const AddAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController accountController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final Color neon = const Color(0xFF00F39A);
    final Color panel = const Color(0xFF071826);

    return Scaffold(
      backgroundColor: const Color(0xFF06121A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "إضافة حساب جديد",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF04121A),
              const Color(0xFF071826),
              const Color(0xFF081E2A),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField(accountController, "اسم الحساب (مثلاً Gmail)", neon, false),
              const SizedBox(height: 12),
              _buildTextField(usernameController, "اسم المستخدم / البريد", neon, false),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "كلمة المرور",
                  labelStyle: TextStyle(color: neon.withOpacity(0.8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: neon.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: neon),
                  ),
                  fillColor: panel,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.autorenew, color: Colors.white70),
                    onPressed: () async {
                      final newPassword = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GeneratePasswordPage(),
                        ),
                      );

                      if (newPassword != null) {
                        passwordController.text = newPassword;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: neon,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: neon.withOpacity(0.5),
                  elevation: 6,
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'account': accountController.text,
                    'username': usernameController.text,
                    'password': passwordController.text,
                  });
                },
                icon: const Icon(Icons.save),
                label: const Text(
                  "حفظ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, Color neon, bool obscure) {
    final Color panel = const Color(0xFF071826);
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: neon.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: neon.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: neon),
        ),
        fillColor: panel,
        filled: true,
      ),
    );
  }
}