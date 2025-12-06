import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/screens/home/models/passengers_type.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPassengersField extends StatelessWidget {
  FormPassengersField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final Map<PassengersType, int>? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final String? Function(Map<PassengersType, int>?)? validator;

  Widget? get prefixIconBuilder {
    if (prefixIcon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(prefixIcon, size: 20),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Map<PassengersType, int>>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      builder: (field) => InkWell(
        onTap: () async {
          final res = await PassengersSelectorBottom.show(
            context,
            value: field.value,
          );
          final total = res?.values.fold(0, (sum, value) => sum + value) ?? 0;
          field.didChange(total == 0 ? null : res);
        },
        child: InputDecorator(
          isEmpty: field.value == null,
          decoration: InputDecoration(
            errorText: field.errorText,
            errorMaxLines: 2,
            hintText: placeholder,
            hintMaxLines: 1,
            prefixIcon: prefixIconBuilder,
            prefixIconConstraints: const BoxConstraints.tightFor(),
          ),
          child: field.value.let((value) {
            final total = value.values.fold(0, (sum, value) => sum + value);
            return Text('$total Seat');
          }),
        ),
      ),
    );
  }
}

class PassengersSelectorBottom extends StatefulWidget {
  const PassengersSelectorBottom({this.initialValue, super.key});

  final Map<PassengersType, int>? initialValue;

  static Future<Map<PassengersType, int>?> show(
    BuildContext context, {
    required Map<PassengersType, int>? value,
  }) async {
    return showModalBottomSheet<Map<PassengersType, int>>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: (_) => PassengersSelectorBottom(
        initialValue: value,
      ),
    );
  }

  @override
  State<PassengersSelectorBottom> createState() =>
      _PassengersSelectorBottomState();
}

class _PassengersSelectorBottomState extends State<PassengersSelectorBottom> {
  late Map<PassengersType, int> current;

  @override
  void initState() {
    super.initState();
    current = widget.initialValue ??
        {
          PassengersType.old: 0,
          PassengersType.adult: 0,
          PassengersType.child: 0,
          PassengersType.infant: 0,
        };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetHeader(
              padding: EdgeInsets.only(top: 20),
              title: 'Passenger',
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PassengersType.values.length,
              itemBuilder: (context, index) {
                final item = PassengersType.values[index];
                return PassengersItemWidget(
                  type: item,
                  currentValue: current[item]!,
                  onIncrease: () => setState(
                    () => current[item] = current[item]! + 1,
                  ),
                  onDecrease: current[item] != 0
                      ? () => setState(
                            () => current[item] =
                                (current[item]! - 1).clamp(0, 10),
                          )
                      : null,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
            FilledButton(
              onPressed: () => context.maybePop(current),
              child: const AnyButtonContent.filled(
                text: 'Done',
                fullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PassengersItemWidget extends StatelessWidget {
  const PassengersItemWidget({
    required this.type,
    required this.currentValue,
    required this.onDecrease,
    required this.onIncrease,
    super.key,
  });

  final PassengersType type;
  final int currentValue;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: type.resolveTitle(),
            style: context.titleMedium,
            children: [
              TextSpan(
                text: ' (${type.resolveSubtitle()})',
                style: context.bodyMedium.copyWith(
                  color: context.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton.outlined(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(4),
            minimumSize: const Size(20, 20),
            iconSize: 16,
          ),
          onPressed: currentValue != 0 ? onDecrease : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 18,
          child: Text(
            currentValue.toString(),
            style: context.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        IconButton.outlined(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(4),
            minimumSize: const Size(20, 20),
            iconSize: 16,
          ),
          onPressed: currentValue != 10 ? onIncrease : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
