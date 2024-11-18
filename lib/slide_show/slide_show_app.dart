import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/data/all_slides_provider.dart';
import 'package:idobata/slide_show/framework/slide_frame.dart';

class SlideShowApp extends ConsumerWidget {
  const SlideShowApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slides = ref.watch(allSlidesProvider);
    log('slides: $slides');
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
