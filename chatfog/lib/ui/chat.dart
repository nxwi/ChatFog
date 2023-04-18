import 'package:chatfog/ui/home.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Group(
          rad: 20,
        ),
      ),
    );
  }
}
