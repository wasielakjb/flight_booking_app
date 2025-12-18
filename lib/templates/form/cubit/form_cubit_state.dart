part of 'form_cubit.dart';

@immutable
class FormCubitState with EquatableMixin {
  const FormCubitState({
    required this.initialized,
    required this.pending,
  });

  factory FormCubitState.initial() {
    return const FormCubitState(
      initialized: false,
      pending: false,
    );
  }

  final bool initialized;
  final bool pending;

  FormCubitState copyWith({
    bool? initialized,
    bool? pending,
  }) {
    return FormCubitState(
      initialized: initialized ?? this.initialized,
      pending: pending ?? this.pending,
    );
  }

  @override
  List<Object?> get props => [initialized, pending];
}
