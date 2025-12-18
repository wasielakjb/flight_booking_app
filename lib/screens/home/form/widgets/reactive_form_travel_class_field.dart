import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/kotlin_extensions.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/templates/form/ui/reactive_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:skeletonizer/skeletonizer.dart';

typedef SelectorItemBuilder<Item> = Widget Function(BuildContext, Item);
typedef LabelBuilder<Item> = String Function(Item);

class ReactiveFormTravelClassField<Val, Item> extends StatelessWidget {
  ReactiveFormTravelClassField({
    required this.formControlName,
    required this.items,
    required this.itemBuilder,
    this.placeholder,
    this.prefixIcon,
    this.validationMessages,
    this.labelBuilder,
  }) : super(key: ValueKey(formControlName));

  final String? formControlName;
  final String? placeholder;
  final IconData? prefixIcon;
  final Iterable<Item> items;
  final SelectorItemBuilder<Item> itemBuilder;
  final LabelBuilder<Item>? labelBuilder;
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
    
  double popupHeight(int itemCount) {
    const double itemHeight = 56;
    const double maxHeight = 400;
    return (itemCount * itemHeight).clamp(0, maxHeight).toDouble();
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
      child: ReactiveDropdownSearch<Val, Item>(
        formControlName: formControlName,
        compareFn: (item1, item2) => item1 == item2,
        items: (filter, loadProps) => items.toList(),
        itemAsString: labelBuilder,
        validationMessages: validationMessages,
        dropdownDecoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: placeholder,
            hintMaxLines: 1,
            errorMaxLines: 2,
            prefixIcon: prefixIcon.let(prefixIconBuilder),
            prefixIconConstraints: const BoxConstraints.tightFor(),
          ),
        ),
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          constraints: BoxConstraints(maxHeight: popupHeight(items.length)),
          itemBuilder: (context, item, _, isSelected) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: DefaultTextStyle(
              style: isSelected
                  ? context.bodyMediumBold
                      .copyWith(color: isSelected ? context.primary : null)
                  : context.bodyMedium, 
              child: itemBuilder.call(context, item),
            ),
          ),
        ),
      ),
    );
  }
}
