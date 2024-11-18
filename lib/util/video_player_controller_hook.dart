import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

const useVideoPlayerController = _VideoPlayerControllerCreator();

class _VideoPlayerControllerCreator {
  const _VideoPlayerControllerCreator();

  VideoPlayerController asset(
    String dataSource, {
    String? package,
    Future<ClosedCaptionFile>? closedCaptionFile,
    VideoPlayerOptions? videoPlayerOptions,
    List<Object?>? keys,
  }) {
    return use(
      _VideoPlayerControllerAssetHook(
        dataSource,
        package: package,
        closedCaptionFile: closedCaptionFile,
        videoPlayerOptions: videoPlayerOptions,
        keys: keys,
      ),
    );
  }
}

class _VideoPlayerControllerAssetHook extends Hook<VideoPlayerController> {
  const _VideoPlayerControllerAssetHook(
    this._dataSource, {
    String? package,
    Future<ClosedCaptionFile>? closedCaptionFile,
    VideoPlayerOptions? videoPlayerOptions,
    super.keys,
  })  : _videoPlayerOptions = videoPlayerOptions,
        _closedCaptionFile = closedCaptionFile,
        _package = package;
  final String _dataSource;
  final String? _package;
  final Future<ClosedCaptionFile>? _closedCaptionFile;
  final VideoPlayerOptions? _videoPlayerOptions;

  @override
  HookState<VideoPlayerController, Hook<VideoPlayerController>> createState() =>
      _VideoPlayerControllerAssetHookState();
}

class _VideoPlayerControllerAssetHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerAssetHook> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initHook() {
    super.initHook();
    _videoPlayerController = VideoPlayerController.asset(
      hook._dataSource,
      closedCaptionFile: hook._closedCaptionFile,
      package: hook._package,
      videoPlayerOptions: hook._videoPlayerOptions,
    );
  }

  @override
  void didUpdateHook(_VideoPlayerControllerAssetHook oldHook) {
    if (oldHook._dataSource != hook._dataSource) {
      unawaited(
        _videoPlayerController.dispose(),
      );
      _videoPlayerController = VideoPlayerController.asset(
        hook._dataSource,
        closedCaptionFile: hook._closedCaptionFile,
        package: hook._package,
        videoPlayerOptions: hook._videoPlayerOptions,
      );
    }
    super.didUpdateHook(oldHook);
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return _videoPlayerController;
  }

  @override
  void dispose() {
    unawaited(
      _videoPlayerController.dispose(),
    );
    super.dispose();
  }
}
