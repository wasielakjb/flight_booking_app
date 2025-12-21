typedef NullableCopy<T> = T? Function();

extension NullableCopyApply<T> on NullableCopy<T>? {
  T? apply(T? current) => this != null ? this!.call() : current;
}
