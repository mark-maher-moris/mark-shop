import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = true;
  changeIsAdmin(bool val) {
    isAdmin = val;
    notifyListeners();
  }
}
