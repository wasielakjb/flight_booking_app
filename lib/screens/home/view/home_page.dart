import 'package:auto_route/auto_route.dart';
import 'package:flight_booking_app/app/router/app_router.gr.dart';
import 'package:flight_booking_app/templates/app_navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: AppNavigationBar(activeRoute: HomeRoute()),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: false,
    //     title: Row(
    //       spacing: 12,
    //       children: [
    //         CircleAvatar(backgroundColor: context.primary),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('Good morning! 🌤️', style: context.bodyMedium),
    //             Text('Esther Howard', style: context.titleMedium),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(16),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(24),
    //             color: context.surface,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: context.onSurface.withValues(alpha: 0.1),
    //                 spreadRadius: 1,
    //                 blurRadius: 8,
    //                 offset: const Offset(0, 2),
    //               ),
    //             ],
    //           ),
    //           child: FormBuilder(
    //             child: Column(
    //               spacing: 18,
    //               children: [
    //                 const FormTripTypeField(name: 'trip_type'),
    //                 const FormAirportLocationField(
    //                   name: 'departure_airport',
    //                   labelText: 'Departure airport',
    //                   hintText: 'Enter city or airport code',
    //                   icon: Icons.location_on_outlined,
    //                 ),
    //                 const FormAirportLocationField(
    //                   name: 'arrival_airport',
    //                   labelText: 'Arrival airport',
    //                   hintText: 'Enter city or airport code',
    //                   icon: Icons.location_on_outlined,
    //                 ),
    //                 const FormDepartureDateField(
    //                   name: 'departure_date',
    //                   labelText: 'Departure date',
    //                   hintText: 'Choose your departure date',
    //                   icon: Icons.date_range_outlined,
    //                 ),
    //                 const Row(
    //                   spacing: 18,
    //                   children: [
    //                     Expanded(
    //                       child: FormTravelClassField(
    //                         name: 'travel_class',
    //                         labelText: 'Travel class',
    //                         hintText: 'Choose class',
    //                         icon: Icons.work_outline,
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: FormPassangersField(
    //                         name: 'passengers',
    //                         labelText: 'Passenger',
    //                         hintText: 'Select number of passengers',
    //                         icon: Icons.group_outlined,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 FilledButton(
    //                   style: FilledButton.styleFrom(
    //                     minimumSize: const Size.fromHeight(50),
    //                   ),
    //                   onPressed: () {},
    //                   child: Text(
    //                     'Search',
    //                     style: context.titleMedium
    //                         .copyWith(color: context.surface),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 32),
    //         Text('Recent Search', style: context.titleMedium),
    //         Expanded(
    //           child: ListView.separated(
    //             padding: const EdgeInsets.only(top: 18),
    //             scrollDirection: Axis.horizontal,
    //             itemCount: 20,
    //             itemBuilder: (context, index) => Container(
    //               child: Text('data'),
    //             ),
    //             separatorBuilder: (_, __) => const SizedBox(width: 10),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   bottomNavigationBar: NavigationBar(
    //     destinations: const [
    //       NavigationDestination(
    //         label: 'Home',
    //         icon: Icon(Symbols.home),
    //         selectedIcon: Icon(Icons.home_filled),
    //       ),
    //       NavigationDestination(
    //         label: 'Ticket',
    //         icon: Icon(Icons.airplane_ticket_outlined),
    //       ),
    //       NavigationDestination(
    //         label: 'History',
    //         icon: Icon(Icons.history_outlined),
    //       ),
    //       NavigationDestination(
    //         label: 'Settings',
    //         icon: Icon(Icons.settings_outlined),
    //       ),
    //     ],
    //   ),
    // ); 
  
  }
}
