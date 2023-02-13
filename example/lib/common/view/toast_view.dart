import 'package:flutter/material.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(msg, style: const TextStyle(color: Colors.white)),
    );
  }
}
