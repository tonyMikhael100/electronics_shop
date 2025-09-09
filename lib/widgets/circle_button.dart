import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
