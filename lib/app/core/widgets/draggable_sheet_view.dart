import 'dart:ui';

import 'package:flutter/material.dart';

class DraggableSheetView extends StatelessWidget {
  const DraggableSheetView({
    super.key,
    required this.child,
    this.minSize,
  });

  final List<Widget> child;
  final double? minSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: minSize ?? 0.65,
      minChildSize: minSize ?? 0.65,
      maxChildSize: 0.88,
      builder: (context, controller) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 100),
            child: Container(
              color: Colors.black87.withOpacity(.7),
              child: ListView(
                controller: controller,
                children: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
