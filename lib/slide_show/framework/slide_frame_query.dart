import 'package:flutter/material.dart';
import 'package:idobata/slide_show/framework/slide_window.dart';

enum SlideFrameQueryAspect {
  frameHeight,
}

class SlideFrameQuery extends InheritedModel<SlideFrameQueryAspect> {
  const SlideFrameQuery({
    required double frameHeight,
    required super.child,
    super.key,
  }) : _frameHeight = frameHeight;

  final double _frameHeight;

  @override
  bool updateShouldNotify(SlideFrameQuery oldWidget) {
    return _frameHeight != oldWidget._frameHeight;
  }

  @override
  bool updateShouldNotifyDependent(
    SlideFrameQuery oldWidget,
    Set<SlideFrameQueryAspect> dependencies,
  ) {
    for (final dependency in dependencies) {
      switch (dependency) {
        case SlideFrameQueryAspect.frameHeight:
          if (_frameHeight != oldWidget._frameHeight) {
            return true;
          }
      }
    }
    return false;
  }

  static SlideFrameQuery _of(
    BuildContext context, [
    SlideFrameQueryAspect? aspect,
  ]) {
    return InheritedModel.inheritFrom<SlideFrameQuery>(
      context,
      aspect: aspect,
    )!;
  }

  static double _frameHeightOf(BuildContext context) {
    return _of(context, SlideFrameQueryAspect.frameHeight)._frameHeight;
  }
}

extension SlideFrameQueryX on BuildContext {
  double get frameScale =>
      SlideFrameQuery._frameHeightOf(this) / defaultWindowSize.height;
}
