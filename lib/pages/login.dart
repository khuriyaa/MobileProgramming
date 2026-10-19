import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/control_flow.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isRegistering = false;
  bool _hidePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (!_isRegistering) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const ControlFlowPage()),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: const Text('Pendaftaran berhasil')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFBF9FF),
                    Color(0xFFF1EBFF),
                    Color(0xFFF8F4FF),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: -110,
            right: -75,
            child: _DecorativeCircle(size: 280, color: Color(0x55D7C8FF)),
          ),
          const Positioned(
            bottom: -145,
            left: -90,
            child: _DecorativeCircle(size: 310, color: Color(0x55CFC1F5)),
          ),
          const Positioned(
            top: 190,
            left: -55,
            child: _DecorativeCircle(size: 125, color: Color(0x33E3D7FF)),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 28,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/sevima_logo.png',
                              width: 68,
                              height: 68,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'SEVIMA',
                              style: TextStyle(
                                color: Color(0xFF382568),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        _isRegistering ? 'Buat Akun' : 'Selamat Datang',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF382568),
                          letterSpacing: -0.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _isRegistering
                            ? 'Isi data berikut untuk mendaftar'
                            : 'Masuk untuk melanjutkan ke akun Anda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade600,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.fromLTRB(22, 26, 22, 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: const Color(0xFFF0EDF7)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF493879).withValues(
                                alpha: 0.1,
                              ),
                              blurRadius: 30,
                              offset: const Offset(0, 14),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const _FieldLabel('Username'),
                              const SizedBox(height: 9),
                              TextFormField(
                                controller: _usernameController,
                                textInputAction: TextInputAction.next,
                                decoration: _decoration(
                                  'Masukkan username',
                                  Icons.person_outline_rounded,
                                ),
                                validator: (value) =>
                                    value == null || value.trim().isEmpty
                                    ? 'Username wajib diisi'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              const _FieldLabel('Password'),
                              const SizedBox(height: 9),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _hidePassword,
                                textInputAction: _isRegistering
                                    ? TextInputAction.next
                                    : TextInputAction.done,
                                decoration:
                                    _decoration(
                                      'Masukkan password',
                                      Icons.lock_outline_rounded,
                                    ).copyWith(
                                      suffixIcon: IconButton(
                                        tooltip: _hidePassword
                                            ? 'Tampilkan password'
                                            : 'Sembunyikan password',
                                        onPressed: () => setState(
                                          () => _hidePassword = !_hidePassword,
                                        ),
                                        icon: Icon(
                                          _hidePassword
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: Colors.blueGrey.shade400,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                validator: (value) =>
                                    value == null || value.length < 6
                                    ? 'Password minimal 6 karakter'
                                    : null,
                                onFieldSubmitted: (_) {
                                  if (!_isRegistering) _submit();
                                },
                              ),
                              if (_isRegistering) ...[
                                const SizedBox(height: 20),
                                const _FieldLabel('Konfirmasi password'),
                                const SizedBox(height: 9),
                                TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: _hidePassword,
                                  decoration: _decoration(
                                    'Ulangi password',
                                    Icons.lock_reset_outlined,
                                  ),
                                  validator: (value) =>
                                      value != _passwordController.text
                                      ? 'Konfirmasi password tidak sama'
                                      : null,
                                ),
                              ],
                              const SizedBox(height: 24),
                              SizedBox(
                                height: 54,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF6D4ACD),
                                        Color(0xFF8566DF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(
                                          0xFF6D4ACD,
                                        ).withValues(alpha: 0.25),
                                        blurRadius: 16,
                                        offset: const Offset(0, 7),
                                      ),
                                    ],
                                  ),
                                  child: FilledButton(
                                    onPressed: _submit,
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      _isRegistering ? 'Daftar' : 'Masuk',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _isRegistering
                                        ? 'Sudah punya akun? '
                                        : 'Belum punya akun? ',
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => setState(() {
                                      _isRegistering = !_isRegistering;
                                      _formKey.currentState?.reset();
                                    }),
                                    style: TextButton.styleFrom(
                                      foregroundColor: const Color(0xFF6D4ACD),
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      _isRegistering ? 'Masuk' : 'Daftar',
                                      style: const TextStyle(
                                        fontSize: 13,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _decoration(String hint, IconData icon) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.blueGrey.shade300, fontSize: 13),
    prefixIcon: Icon(
      icon,
      color: const Color(0xFF6D4ACD).withValues(alpha: 0.75),
      size: 20,
    ),
    filled: true,
    fillColor: const Color(0xFFFAF9FC),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Color(0xFFECE9F2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Color(0xFFECE9F2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: Color(0xFF6D4ACD), width: 1.4),
    ),
  );
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF383342),
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  const _DecorativeCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
