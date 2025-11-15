import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/screens/home/models/travelers_count.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormPassangersField extends StatelessWidget {
  const FormPassangersField({
    required this.name,
    this.hintText,
    this.labelText,
    this.icon,
    super.key,
  });

  final String name;
  final String? hintText;
  final String? labelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<TravelersCount>(
      name: name,
      builder: (field) => Material(
        child: InkWell(
          onTap: () async {
            final res = await PassangersBottomSheet.show(context, field.value);
            field.didChange(res);
          },
          borderRadius: BorderRadius.circular(12),
          child: InputDecorator(
            isEmpty: field.value == null,
            decoration: InputDecoration(
              errorText: field.errorText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(icon, size: 18),
              hintText: hintText,
              labelText: labelText,
              hintMaxLines: 1,
            ),
            child: field.value != null ? Text('${field.value!.count} seats') : null,
          ),
        ),
      ),
    );
  }
}

class PassangersBottomSheet extends StatefulWidget {
  const PassangersBottomSheet({
    this.initialValue,
    super.key,
  });

  final TravelersCount? initialValue;

  static Future<TravelersCount?> show(
    BuildContext context,
    TravelersCount? value,
  ) async {
    return showModalBottomSheet<TravelersCount>(
      context: context,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: (_) => PassangersBottomSheet(initialValue: value),
    );
  }

  @override
  State<PassangersBottomSheet> createState() => _PassangersBottomSheetState();
}

class _PassangersBottomSheetState extends State<PassangersBottomSheet> {
  late TravelersCount current;

  @override
  void initState() {
    super.initState();
    current = widget.initialValue ??
        const TravelersCount(adults: 0, children: 0, infants: 0);
  }

  Widget buildPassengerWidget({
    required Widget title,
    required int value,
    required void Function(int) onUpdate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          title,
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.surfaceContainerHigh,
            ),
            onPressed: () => onUpdate.call(value - 1),
            icon: const Icon(Icons.remove, size: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(value.toString(), style: context.titleMedium),
          ),
          IconButton.filled(
            onPressed: () => onUpdate.call(value + 1),
            icon: const Icon(Icons.add, size: 18),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const BottomSheetHeader(title: 'Passengers'),
            buildPassengerWidget(
              title: Text('Adult', style: context.titleMedium),
              value: current.adults,
              onUpdate: (value) => setState(() {
                if (value < 0 || value > 9) return;
                current = current.copyWith(adults: value);
              }),
            ),
            const Divider(indent: 16, endIndent: 16),
            buildPassengerWidget(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Children', style: context.titleMedium),
                  Text('2-11 years at time of travel', style: context.bodyMedium),
                ],
              ),
              value: current.children,
              onUpdate: (value) => setState(() {
                if (value < 0 || value > 9) return;
                current = current.copyWith(children: value);
              }),
            ),
            const Divider(indent: 16, endIndent: 16),
            buildPassengerWidget(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Infants (Lap)', style: context.titleMedium),
                  Text('Under 2 years at time of travel', style: context.bodyMedium),
                ],
              ),
              value: current.infants,
              onUpdate: (value) => setState(() {
                if (value < 0 || value > 9) return;
                current = current.copyWith(infants: value);
              }),
            ),
            const Divider(indent: 16, endIndent: 16),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => context.maybePop(current),
                child: Text(
                  'Confirmation',
                  style: context.titleMedium.copyWith(color: context.surface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
