import 'package:flutter/material.dart';

class SlideShowApp extends StatelessWidget {
  const SlideShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('スライドショー'),
        ),
      ),
    );
  }
}
