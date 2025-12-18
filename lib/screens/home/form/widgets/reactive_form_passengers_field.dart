import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/flights/domain/models/passenger_count.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReactiveFormPassengersField extends StatelessWidget {
  ReactiveFormPassengersField({
    required this.formControlName,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
  }) : super(key: ValueKey(formControlName));

  final String? formControlName;
  final String? placeholder;
  final IconData? prefixIcon;
  final ValidationMsgMap? validationMessages;

  Widget prefixIconBuilder(IconData icon) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20),
              const VerticalDivider(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Skeleton.replace(
      replacement: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.surfaceContainer,
        ),
      ),
      child: ReactiveFocusableFormField<PassengerCount, PassengerCount>(
        formControlName: formControlName,
        validationMessages: validationMessages,
        builder: (field) => InkWell(
          onTap: () async {
            final res = await PassengersBottomSheet.show(context, field.value);
            field.didChange(res);
          },
          child: InputDecorator(
            isEmpty: field.value == null,
            decoration: InputDecoration(
              hintText: placeholder,
              hintMaxLines: 1,
              errorText: field.errorText,
              errorMaxLines: 2,
              prefixIcon: prefixIcon?.let(prefixIconBuilder),
              prefixIconConstraints: const BoxConstraints.tightFor(),
            ),
            child: field.value.let(
              (value) => Text(
                '${value.total} seat',
                style: context.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PassengersBottomSheet extends StatefulWidget {
  const PassengersBottomSheet({
    this.initialValue,
    super.key,
  });

  final PassengerCount? initialValue;

  static Future<PassengerCount?> show(
    BuildContext c,
    PassengerCount? value,
  ) async {
    return showModalBottomSheet<PassengerCount>(
      context: c,
      useSafeArea: true,
      builder: (_) => PassengersBottomSheet(initialValue: value),
    );
  }

  @override
  State<PassengersBottomSheet> createState() => _PassengersBottomSheetState();
}

class _PassengersBottomSheetState extends State<PassengersBottomSheet> {
  late PassengerCount current;

  @override
  void initState() {
    super.initState();
    current = widget.initialValue ?? const PassengerCount();
  }

  void update(int value, int index) {
    switch (index) {
      case 0:
        current = current.copyWith(adults: value);
      case 1:
        current = current.copyWith(children: value);
      case 2:
        current = current.copyWith(infants: value);
      default:
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BottomSheetHeader(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            title: 'Passengers',
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: switch (index) {
                          0 => 'Adults',
                          1 => 'Children',
                          2 => 'Infants',
                          int() => throw UnimplementedError(),
                        },
                        style: context.titleMedium,
                        children: [
                          TextSpan(
                            text: switch (index) {
                              0 => ' (Age 18+)',
                              1 => ' (Age 4-17)',
                              2 => ' (Bellow age 4)',
                              int() => throw UnimplementedError(),
                            },
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
                      ),
                      onPressed: () {
                        final value = switch (index) {
                          0 => current.adults,
                          1 => current.children,
                          2 => current.infants,
                          int() => 0,
                        };
                        if (value > 0) update(value - 1, index);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 20,
                      child: Text(
                        switch (index) {
                          0 => current.adults,
                          1 => current.children,
                          2 => current.infants,
                          int() => throw UnimplementedError(),
                        }.toString(),
                        style: context.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton.outlined(
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        minimumSize: const Size(20, 20),
                      ),
                      onPressed: () {
                        final value = switch (index) {
                          0 => current.adults,
                          1 => current.children,
                          2 => current.infants,
                          int() => 0,
                        };
                        if (value < 9) update(value + 1, index);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FilledButton(
              onPressed: () => context.maybePop(current),
              child: const AnyButtonContent.filled(
                text: 'Done',
                fullWidth: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
