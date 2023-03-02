import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelHud with ChangeNotifier {
  bool isLoading = false;

  cahngeLoading(val) {
    isLoading = val;
    notifyListeners();
  }
}
