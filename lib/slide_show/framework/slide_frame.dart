import 'package:flutter/material.dart';
import 'package:idobata/slide_show/framework/slide_frame_query.dart';
import 'package:idobata/slide_show/framework/slide_window.dart';

class SlideFrame extends StatelessWidget {
  const SlideFrame({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final frameHeight = constraints.maxHeight;
            return SlideFrameQuery(
              frameHeight: frameHeight > defaultWindowSize.height
                  ? frameHeight
                  : defaultWindowSize.height,
              child: _SlideFrameContent(
                child: _child,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SlideFrameContent extends StatelessWidget {
  const _SlideFrameContent({
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(
        // テキストのサイズをフレームのサイズに合わせて調整する
        textScaler: TextScaler.linear(context.frameScale),
      ),
      child: _child,
    );
  }
}
