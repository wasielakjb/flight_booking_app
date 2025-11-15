import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/screens/home/models/trip_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTripTypeField extends StatelessWidget {
  const FormTripTypeField({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<TripType>(
      name: name,
      initialValue: TripType.oneWay,
      builder: (field) => SizedBox(
        width: double.infinity,
        child: SegmentedButton<TripType>(
          style: SegmentedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: BorderSide.none,
            selectedBackgroundColor: context.primary,
            selectedForegroundColor: context.surface,
            foregroundColor: context.onSurface.withValues(alpha: 0.4),
            backgroundColor: context.surfaceContainer,
          ),
          showSelectedIcon: false,
          selected: {field.value!},
          onSelectionChanged: (value) => field.didChange(value.first),
          segments: TripType.values.map((value) {
            return ButtonSegment(
              value: value,
              label: Text(value.resolveName()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
