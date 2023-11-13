import 'package:flutter/material.dart';

class CustomFading extends StatefulWidget {
  final Widget child;

  const CustomFading({super.key, required this.child});

  @override
  State<CustomFading> createState() => _CustomFadingState();
}

class _CustomFadingState extends State<CustomFading> with SingleTickerProviderStateMixin {
  late Animation animation;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 800));
    animation = Tween<double>(begin: 0.3, end: 0.8).animate(animationController);
    animationController.addListener(() {setState(() {});});
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: animation.value, child: widget.child);
  }
}
