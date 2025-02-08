import 'package:flutter/material.dart';

class ScheduleToggler extends StatefulWidget {
  final Function(int) onSelected;

  const ScheduleToggler({super.key, required this.onSelected});

  @override
  State<StatefulWidget> createState() => _ScheduleTogglerState();
}

class _ScheduleTogglerState extends State<ScheduleToggler> {
  int selectedIndex = 0;

  void _handleItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.red.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: ToogleItem(
              index: 0,
              text: 'ir agora',
              icon: Icons.flash_on,
              isSelected: (selectedIndex == 0),
              onTap: _handleItemTap,
            ),
          ),
          Expanded(
            child: ToogleItem(
              index: 1,
              text: 'ir outro dia',
              icon: Icons.calendar_today,
              isSelected: (selectedIndex == 1),
              onTap: _handleItemTap,
            ),
          ),
        ],
      ),
    );
  }
}

class ToogleItem extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const ToogleItem({
    super.key,
    required this.index,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isSelected ? Colors.white : Colors.transparent;
    final Color iconColor = isSelected ? Colors.red.shade400 : Colors.white;
    final Color textColor = isSelected ? Colors.black : Colors.white;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTap(index),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 18),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
