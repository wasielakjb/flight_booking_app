extension LetExtension<T> on T? {
  /// Calls the specified function block with this value as its argument and returns its result.
  R? let<R>(R? Function(T it) block) => this != null ? block(this as T) : null;

  R letOrElse<R>(R Function(T it) block, {required R orElse}) =>
      this != null ? block(this as T) : orElse;
}
