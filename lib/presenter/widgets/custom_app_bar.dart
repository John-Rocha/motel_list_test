import 'package:flutter/material.dart';
import 'package:motel_list_test/presenter/widgets/location_filter.dart';
import 'package:motel_list_test/presenter/widgets/schedule_toggler.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => AppBar(
        toolbarHeight: 100,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScheduleToggler(
              onSelected: (onSelected) {},
            ),
            const SizedBox(height: 8),
            LocationFilter(
              cityName: 'Macapá',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(100);
}
