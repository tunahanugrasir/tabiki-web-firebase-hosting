import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ParallaxLayer extends StatelessWidget {
  final double scrollOffset;
  final double parallaxFactor;
  final double topPosition;
  final double height;
  final String imagePath;

  const ParallaxLayer({
    super.key,
    required this.scrollOffset,
    required this.parallaxFactor,
    required this.topPosition,
    required this.height,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition - (scrollOffset * parallaxFactor),
      left: 0,
      right: 0,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: context.sized.width,
        height: height,
      ),
    );
  }
} 