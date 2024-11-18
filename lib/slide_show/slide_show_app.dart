import 'package:flutter/material.dart';
import 'package:idobata/slide_show/framework/slide_frame.dart';

class SlideShowApp extends StatelessWidget {
  const SlideShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SlideFrame(
        child: Scaffold(
          body: Center(
            child: Text('スライドショー'),
          ),
        ),
      ),
    );
  }
}
