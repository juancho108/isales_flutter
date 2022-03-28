import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String lastError = '';

  void login(String email, String password) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      //var res = await ....
      _hasError = false;
      _isLoading = false;
      _isLoggedIn = true;
    } catch (e) {
      print(e);
      lastError = e.toString();
      _hasError = true;
      _isLoading = false;
      _isLoggedIn = false;
    }
    notifyListeners();
  }
}
