import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormAirportLocationField extends StatelessWidget {
  const FormAirportLocationField({
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
    return FormBuilderField<String>(
      name: name,
      builder: (field) => Material(
        child: InkWell(
          onTap: () => context.router.pushWidget(
            const AirportLocationSearch(),
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
          ),
        ),
      ),
    );
  }
}

class AirportLocationSearch extends StatefulWidget {
  const AirportLocationSearch({super.key});

  @override
  State<AirportLocationSearch> createState() => _AirportLocationSearchState();
}

class _AirportLocationSearchState extends State<AirportLocationSearch> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Airport', style: context.titleMedium),
        leading: IconButton(
          onPressed: context.maybePop,
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              SearchBar(
                controller: controller,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.search_outlined),
                ),
                hintText: 'Country, City or Airport',
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
