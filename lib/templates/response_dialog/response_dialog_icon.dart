import 'package:dotted_border/dotted_border.dart';
import 'package:flight_booking_app/templates/response_dialog/models/response_dialog_theme.dart';
import 'package:flutter/widgets.dart';

class ResponseDialogIcon extends StatelessWidget {
  const ResponseDialogIcon({
    required this.iconData,
    required this.type,
    super.key,
  });

  final IconData iconData;
  final ResponseDialogTheme type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        dashPattern: const [12, 6],
        radius: const Radius.circular(99),
        strokeWidth: 3,
        borderType: BorderType.Circle,
        color: type.resolveForeground(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: type.resolveBackground(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Icon(
              iconData,
              size: 48,
              color: type.resolveForeground(context),
            ),
          ),
        ),
      ),
    );
  }
}
