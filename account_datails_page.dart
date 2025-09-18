import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountDetailsPage extends StatefulWidget {
  final Map<String, String> account;

  const AccountDetailsPage({super.key, required this.account});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Color neon = const Color(0xFF00F39A);
    final Color panel = const Color(0xFF071826);
    final Color glow = const Color(0xFF07212A);

    return Scaffold(
      backgroundColor: const Color(0xFF06121A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.account['account'] ?? "تفاصيل الحساب",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: panel,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: neon.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.05),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  "اسم المستخدم: ${widget.account['username']}",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: panel,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: neon.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.05),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _obscurePassword
                            ? "كلمة المرور: ********"
                            : "كلمة المرور: ${widget.account['password']}",
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: neon,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
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
                    Clipboard.setData(
                        ClipboardData(text: widget.account['password'] ?? ''));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("تم نسخ كلمة المرور")),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text(
                    "نسخ كلمة المرور",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}