enum ResourceStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ResourceStatus.initial;
  bool get isLoading => this == ResourceStatus.loading;
  bool get isSuccess => this == ResourceStatus.success;
  bool get isFailure => this == ResourceStatus.failure;
}
