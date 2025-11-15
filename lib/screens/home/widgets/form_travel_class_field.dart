import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/screens/home/models/travel_class.dart';
import 'package:flight_booking_app/templates/bottom_sheet_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTravelClassField extends StatelessWidget {
  const FormTravelClassField({
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
    return FormBuilderField<TravelClass>(
      name: name,
      builder: (field) => Material(
        child: InkWell(
          onTap: () async {
            final res = await TravelClassBottomSheet.show(context, field.value);
            field.didChange(res);
          },
          borderRadius: BorderRadius.circular(12),
          child: InputDecorator(
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorText: field.errorText,
              prefixIcon: Icon(icon, size: 18),
              labelText: labelText,
              hintText: hintText,
              hintMaxLines: 1,
            ),
            isEmpty: field.value == null,
            child: field.value != null ? Text(field.value!.resolveName()) : null,
          ),
        ),
      ),
    );
  }
}

class TravelClassBottomSheet extends StatelessWidget {
  const TravelClassBottomSheet({
    this.initialValue,
    super.key,
  });

  final TravelClass? initialValue; 

  static Future<TravelClass?> show(BuildContext c, TravelClass? value) async {
    return showModalBottomSheet<TravelClass>(
      context: c,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      builder: (_) => TravelClassBottomSheet(initialValue: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BottomSheetHeader(title: 'Class'),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: TravelClass.values.length,
              itemBuilder: (context, index) {
                final item = TravelClass.values[index];
                final isSelected = item == initialValue;
                return InkWell(
                  onTap: () => context.maybePop(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.resolveName(),
                          style: context.bodyLarge.copyWith(
                            color: isSelected ? context.primary : null,
                            fontWeight: isSelected ? FontWeight.bold : null,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            color: context.primary,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(indent: 16, endIndent: 16),
            ),
          ],
        ),
      ),
    );
  }
}
