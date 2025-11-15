import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FormDepartureDateField extends StatelessWidget {
  const FormDepartureDateField({
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
    return FormBuilderField<DateTime>(
      name: name,
      builder: (field) => Material(
        child: InkWell(
          onTap: () => context.router.pushWidget(
            DepartureDatePicker(
              onChanged: field.didChange,
              initialValue: field.value,
            ),
          ),
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
            child: field.value != null
                ? Text(DateFormat('E, d MMM y').format(field.value!))
                : null,
          ),
        ),
      ),
    );
  }
}

class DepartureDatePicker extends StatefulWidget {
  const DepartureDatePicker({
    required this.onChanged,
    this.initialValue,
    super.key,
  });

  final DateTime? initialValue;
  final void Function(DateTime) onChanged;

  @override
  State<DepartureDatePicker> createState() => _DepartureDatePickerState();
}

class _DepartureDatePickerState extends State<DepartureDatePicker> {
  late DateTime currentDate;

  @override
  void initState() {
    super.initState();
    currentDate = widget.initialValue ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Date', style: context.titleMedium),
        leading: IconButton(
          onPressed: context.maybePop,
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: SafeArea(
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarViewMode: CalendarDatePicker2Mode.scroll,
            weekdayLabels: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
            weekdayLabelTextStyle: context.bodyMedium,
            centerAlignModePicker: true,
            useAbbrLabelForMonthModePicker: true,
            hideScrollViewMonthWeekHeader: true,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().copyWith(year: DateTime.now().year + 1),
          ),
          value: [currentDate],
          onValueChanged: (value) => setState(() {
            currentDate = value.first;
          }),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: () {
              widget.onChanged.call(currentDate);
              context.maybePop();
            },
            child: Text(
              'Done',
              style: context.titleMedium.copyWith(color: context.surface),
            ),
          ),
        ),
      ),
    );
  }
}
