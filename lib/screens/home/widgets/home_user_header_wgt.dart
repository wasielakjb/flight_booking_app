import 'package:flight_booking_app/extensions/color_scheme_extension.dart';
import 'package:flight_booking_app/extensions/text_theme_extension.dart';
import 'package:flight_booking_app/features/users/domain/models/user_resource.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeUserHeaderWidget extends StatelessWidget {
  const HomeUserHeaderWidget({
    required this.resource,
    super.key,
  });

  final UserResource? resource;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: resource == null,
      child: Row(
        children: [
          const CircleAvatar(radius: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: context.labelLarge.copyWith(
                  color: context.surface.withValues(alpha: 0.4),
                ),
              ),
              Text(
                resource?.fullName ?? BoneMock.fullName,
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.surface,
                ),
              ),
            ],
          ),
          const Spacer(),
          Skeleton.leaf(
            child: Material(
              color: context.surface.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(99),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(99),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Iconsax.notification_bold,
                    size: 22,
                    color: context.surface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
