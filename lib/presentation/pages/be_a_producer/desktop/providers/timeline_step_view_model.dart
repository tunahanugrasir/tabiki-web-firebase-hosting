import 'package:flutter/foundation.dart';

class TimelineStepViewModel extends ChangeNotifier {
  bool _isHovered = false;
  double _scaleValue = 1.0;
  double _rotateValue = 0.0;
  
  bool get isHovered => _isHovered;
  double get scaleValue => _scaleValue;
  double get rotateValue => _rotateValue;

  void onHoverChanged(bool value) {
    _isHovered = value;
    _scaleValue = value ? 1.03 : 1.0;
    _rotateValue = value ? 0.05 : 0.0;
    notifyListeners();
  }
} 