part of 'response_dialog_cubit.dart';

class ResponseDialogState extends Equatable {
  const ResponseDialogState({
    required this.title,
    required this.iconData,
    required this.type,
    this.subtitle,
    this.content,
  });

  factory ResponseDialogState.initial() => const ResponseDialogState(
        title: Text(''),
        iconData: Icons.ac_unit,
        type: ResponseDialogTheme.neutral,
      );

  final Widget title;
  final Widget? subtitle;
  final IconData iconData;
  final ResponseDialogTheme type;
  final List<Widget>? content;

  @override
  List<Object?> get props => [title, subtitle, iconData, type, content];
}
