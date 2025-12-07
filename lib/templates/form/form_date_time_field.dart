import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/any_button_content.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

class FormDateTimeField extends StatefulWidget {
  FormDateTimeField({
    required this.name,
    this.initialValue,
    this.prefixIcon,
    this.placeholder,
    this.inputType = InputType.date,
    this.format,
    this.keyboardType = TextInputType.datetime,
    this.inputFormatters = const [],
    this.validator,
  }) : super(key: ValueKey(name));

  final String name;
  final DateTime? initialValue;
  final IconData? prefixIcon;
  final String? placeholder;
  final InputType inputType;
  final DateFormat? format;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(DateTime?)? validator;

  @override
  State<FormDateTimeField> createState() => _FormDateTimeFieldState();
}

class _FormDateTimeFieldState extends State<FormDateTimeField> {
  bool isFocused = false;

  Widget? get prefixIconBuilder {
    if (widget.prefixIcon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.prefixIcon, size: 20),
            const VerticalDivider(),
          ],
        ),
      ),
    );
  }

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
      child: FormBuilderField<DateTime>(
        name: widget.name,
        initialValue: widget.initialValue,
        validator: widget.validator,
        valueTransformer: (value) => value?.toIso8601String(),
        builder: (field) => InkWell(
          onTap: () async {
            setState(() => isFocused = true);
            final res = await DateTimePickerBottom.show(context, value: field.value);
            setState(() => isFocused = false);
            field.didChange(res);
          },
          child: InputDecorator(
            isEmpty: field.value == null,
            isFocused: isFocused,
            decoration: InputDecoration(
              errorMaxLines: 2,
              errorText: field.errorText,
              hintMaxLines: 1,
              hintText: widget.placeholder,
              prefixIcon: prefixIconBuilder,
              prefixIconConstraints: const BoxConstraints.tightFor(),
            ),
            child: field.value.let(
              (value) => Text(
                DateFormat('dd MMM yyyy').format(value),
                style: context.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DateTimePickerBottom extends StatefulWidget {
  const DateTimePickerBottom({
    this.value,
    super.key,
  });

  final DateTime? value;

  static Future<DateTime?> show(
    BuildContext context, {
    required DateTime? value,
  }) async {
    return showModalBottomSheet<DateTime>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: (_) => DateTimePickerBottom(value: value),
    );
  }

  @override
  State<DateTimePickerBottom> createState() => _DateTimePickerBottomState();
}

class _DateTimePickerBottomState extends State<DateTimePickerBottom> {
  late DateTime current;
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    current = widget.value ?? DateTime.now();
    focusedDay = current;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetHeader(
              padding: EdgeInsets.only(top: 20),
              title: 'Select Date',
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2035),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(day, current),
              daysOfWeekHeight: 24,
              sixWeekMonthsEnforced: true,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: Icon(Icons.chevron_left, color: context.onSurface),
                rightChevronIcon: Icon(Icons.chevron_right, color: context.onSurface),
                titleTextStyle: context.titleLarge,
                headerMargin: const EdgeInsets.only(bottom: 12),
              ),
              calendarStyle: CalendarStyle(
                defaultDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.surfaceContainer,
                ),
                weekendDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.surfaceContainer,
                ),
                todayDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.primaryContainer,
                ),
                selectedDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.primary,
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
              calendarBuilders: CalendarBuilders<DateTime>(
                outsideBuilder: (context, day, focused) =>
                    const SizedBox.shrink(),
              ),
              onDaySelected: (selectedDay, fd) => setState(() {
                current = selectedDay;
                focusedDay = fd;
              }),
            ),
            const SizedBox(height: 20),
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
