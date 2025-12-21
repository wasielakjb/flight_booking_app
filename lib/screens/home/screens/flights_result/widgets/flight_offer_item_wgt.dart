import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/flights/domain/models/flight_offers/flight_offer.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FlightOfferItemWidget extends StatelessWidget {
  const FlightOfferItemWidget({
    required this.item,
    super.key,
  });

  final FlightOffer? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.surfaceContainer,
      ),
      child: Column(
        spacing: 14,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              spacing: 8,
              children: [
                Skeleton.leaf(
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: context.primaryFixed,
                  ),
                ),
                Expanded(
                  child: Text('Airlines of Canada', style: context.bodyLarge),
                ),
                Text('${item?.price.total}', style: context.titleMedium),
              ],
            ),
          ),
          const RowIndentationDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('London'),
                    Text(
                      item?.itineraries.first.segments.first.departure.iataCode ??
                          BoneMock.name,
                      style: context.titleMedium,
                    ),
                    Text(
                      '05 July 2025',
                      style: context.bodyMedium.copyWith(
                        color: context.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                const FlightDurationWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('New York'),
                    Text(
                      item?.itineraries.first.segments.first.arrival.iataCode ??
                          BoneMock.name,
                      style: context.titleMedium,
                    ),
                    Text(
                      '05 July 2025',
                      style: context.bodyMedium.copyWith(
                        color: context.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const RowIndentationDivider(indentation: false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Iconsax.user_bold, size: 12, color: context.primary),
                const SizedBox(width: 4),
                Text('Economic Class', style: context.labelSmall),
                const SizedBox(width: 12),
                Skeleton.leaf(
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.outlineVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text('4 Seat', style: context.labelSmall),
                const Spacer(),
                Skeleton.leaf(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.primaryFixed,
                    ),
                    child: Text(
                      'OneWay',
                      style: context.labelSmall.copyWith(
                        color: context.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlightDurationWidget extends StatelessWidget {
  const FlightDurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Skeleton.replace(
          replacement: const Bone.text(words: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DotDurationWidget(),
              SizedBox(
                width: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedLine(
                      dashColor: context.primary,
                      lineThickness: 2,
                    ),
                    Transform.rotate(
                      angle: pi/2,
                      child: Icon(
                        Icons.flight,
                        color: context.primary,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const DotDurationWidget(),
            ],
          ),
        ),
        Text(
          '1 h 50 m',
          style: context.bodyMedium.copyWith(
            color: context.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class DotDurationWidget extends StatelessWidget {
  const DotDurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: context.primary.withValues(alpha: 0.1),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: context.primary.withValues(alpha: 0.2),
        ),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            color: context.primary.withValues(alpha: 0.3),
          ),
          child: Container(
            height: 4,
            width: 4,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: context.primary,
            ),
          ),
        ),
      ),
    );
  }
}

class RowIndentationDivider extends StatelessWidget {
  const RowIndentationDivider({this.indentation = true, super.key,});

  final bool indentation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (indentation)
          Skeleton.keep(
            child: SizedBox(
              height: 16,
              width: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: context.surface,
                ),
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: indentation ? 8 : 18),
            child: DottedLine(
              lineThickness: 2,
              dashColor: context.outlineVariant,
            ),
          ),
        ),
        if (indentation)
          Skeleton.keep(
            child: SizedBox(
              height: 16,
              width: 8,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: context.surface,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
