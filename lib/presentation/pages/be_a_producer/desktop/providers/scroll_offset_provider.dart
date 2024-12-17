import 'package:flutter/foundation.dart';

class ScrollOffsetProvider extends ChangeNotifier {
  double _scrollOffset = 0;
  final double maxScrollLimit = 150;
  double get scrollOffset => _scrollOffset;

  void updateScrollOffset(double offset) {
    final limitedOffset = offset > maxScrollLimit ? maxScrollLimit : offset;
    if (_scrollOffset != limitedOffset) {
      _scrollOffset = limitedOffset;
      notifyListeners();
    }
  }
}
