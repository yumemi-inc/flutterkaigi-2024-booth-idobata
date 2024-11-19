enum OperationEvent {
  go,
  playVideo,
  pauseVideo,
}

extension ByNameOrNull on Iterable<OperationEvent> {
  OperationEvent? byNameOrNull(String name) {
    for (final value in this) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}
