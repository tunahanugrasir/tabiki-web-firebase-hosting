import 'package:flutter/material.dart';

class ResponsiveLayoutProvider extends ChangeNotifier {
  LayoutType _currentLayout = LayoutType.desktop;

  LayoutType get currentLayout => _currentLayout;

  void updateLayout(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    if (width < 650) {
      if (_currentLayout != LayoutType.mobile) {
        _currentLayout = LayoutType.mobile;
        notifyListeners();
      }
    } else if (width < 1100) {
      if (_currentLayout != LayoutType.tablet) {
        _currentLayout = LayoutType.tablet;
        notifyListeners();
      }
    } else {
      if (_currentLayout != LayoutType.desktop) {
        _currentLayout = LayoutType.desktop;
        notifyListeners();
      }
    }
  }
}

enum LayoutType {
  mobile,
  tablet, 
  desktop
} 