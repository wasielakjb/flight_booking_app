part of 'toastr_cubit.dart';

class ToastrState extends Equatable {
  const ToastrState({
    required this.type,
    required this.message,
    this.title,
    this.action,
  });

  factory ToastrState.initial() =>
      const ToastrState(type: ToastrType.neutral, message: '');

  final ToastrType type;
  final String? title;
  final String message;
  final SnackBarAction? action;

  ToastrState copyWith({
    ToastrType? type,
    String? title,
    String? message,
    SnackBarAction? action,
  }) {
    return ToastrState(
      type: type ?? this.type,
      title: title ?? this.title,
      message: message ?? this.message,
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [type, title, message, action];
}
