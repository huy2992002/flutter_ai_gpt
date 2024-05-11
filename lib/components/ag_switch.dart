import 'package:flutter/material.dart';

class AGSwitch extends StatelessWidget {
  const AGSwitch({
    required this.onChanged,
    this.isDark = false,
    super.key,
  });

  final Function() onChanged;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        height: 30,
        width: 46,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: isDark ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isDark ? Icons.nightlight_round_sharp : Icons.wb_sunny_rounded,
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
