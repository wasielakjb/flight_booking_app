part of 'response_dialog_cubit.dart';

class ResponseDialogState extends Equatable {
  const ResponseDialogState({
    required this.title,
    required this.iconData,
    required this.type,
    this.content,
  });

  factory ResponseDialogState.initial() => const ResponseDialogState(
        title: Text(''),
        iconData: Icons.ac_unit,
        type: ResponseDialogTheme.neutral,
      );

  final Widget title;
  final IconData iconData;
  final ResponseDialogTheme type;
  final List<Widget>? content;

  @override
  List<Object?> get props => [title, iconData, type, content];
}
