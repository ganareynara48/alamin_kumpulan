import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0), // ✅ opacity maksimum 1.0
          duration: const Duration(seconds: 3),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Opacity(
              opacity: 1, // sekarang dijamin antara 0 dan 1
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Transform.scale(
                  scale: 0.5 + value * 0.5, // tetap animasi grow dari kecil ke besar
                  child: Image.asset(
                    'assets/images/logo_alamin_baru.png',
                    width: double.infinity, // biar lebar ngikut lebar layar
                    fit: BoxFit.contain,    // menjaga proporsi gambar
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
