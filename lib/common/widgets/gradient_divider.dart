import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final bool reverse;
  final double? width;
  final Color color;

  const GradientDivider({
    super.key,
    this.color = Colors.black,
    this.width,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Colors.transparent,
            Color.fromARGB(255, 255, 255, 255),
            Colors.black26,
          ],
          begin: !reverse ? Alignment.centerLeft : Alignment.centerRight,
          end: !reverse ? Alignment.centerLeft : Alignment.centerRight,
        ),
      ),
    );
  }
}
