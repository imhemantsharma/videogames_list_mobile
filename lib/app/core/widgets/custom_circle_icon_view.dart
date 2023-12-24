import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCircleIconView extends StatelessWidget {
  const CustomCircleIconView({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: kElevationToShadow[2],
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(.5),
            ),
            child: InkWell(onTap: onTap, child: child),
          ),
        ),
      ),
    );
  }
}
