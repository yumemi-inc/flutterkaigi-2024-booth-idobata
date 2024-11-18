import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idobata/slide_show/slide_data.dart';

class TalkSlideScreen extends HookConsumerWidget {
  const TalkSlideScreen({
    required TalkData data,
    super.key,
  }) : _data = data;

  final TalkData _data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(_data.title),
      ),
    );
  }
}
