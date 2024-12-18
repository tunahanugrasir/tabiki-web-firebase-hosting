import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        'assets/logo/tabiki-appbar-logo.png',
        fit: BoxFit.cover,
        width: context.sized.width * 0.2,
        height: context.sized.height * 0.05,
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
      elevation: 4,
    );
  }
}
