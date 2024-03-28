import 'package:flutter/material.dart';

class DottedIndecator extends StatelessWidget {
  const DottedIndecator({
    Key? key,
    required this.size,
    required this.i,
    required this.currentSliderIndex,
  }) : super(key: key);

  final Size size;
  final int i;
  final int currentSliderIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: size.width * 0.015,
      width: i == currentSliderIndex ? size.width * 0.02 : size.width * 0.015,
      decoration: BoxDecoration(
        color: i == currentSliderIndex
            ? const Color.fromARGB(255, 113, 112, 112)
            : const Color.fromARGB(255, 202, 198, 198),
        shape: BoxShape.circle,
      ),
    );
  }
}
