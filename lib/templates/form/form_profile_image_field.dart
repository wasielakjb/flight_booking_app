import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FormProfileImageField extends StatelessWidget {
  FormProfileImageField({
    required this.name,
    this.initialValue,
    this.validator,
  }): super(key: ValueKey(name));

  final String name;
  final String? initialValue;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: FormBuilderField<String>(
        name: name,
        initialValue: initialValue,
        validator: validator,
        builder: (field) => Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: context.outlineVariant,
              ),
              child: CircleAvatar(
                radius: 62,
                backgroundColor: context.surfaceContainer,
              ),
            ),
            Icon(
              Iconsax.camera_outline,
              size: 48,
              color: context.outlineVariant,
            ),
          ],
        ),
      ),
    );
  }
}
