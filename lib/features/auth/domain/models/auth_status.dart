enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isAuthenticated => this == authenticated;
  bool get isUnauthenticated => this == unauthenticated;
  bool get isError => this == error;
}
