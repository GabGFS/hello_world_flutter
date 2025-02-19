import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RotatingXScreen(),
    );
  }
}

class RotatingXScreen extends StatefulWidget {
  const RotatingXScreen({super.key});

  @override
  _RotatingXScreenState createState() => _RotatingXScreenState();
}

class _RotatingXScreenState extends State<RotatingXScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double scale = 0.5 + 0.5 * math.sin(_controller.value * 2 * math.pi);
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            );
          },
          child: const Text(
            'Gabrielle \n Psicóloga',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 21, 8, 207),
            ),
          ),
        ),
      ),
    );
  }
}
