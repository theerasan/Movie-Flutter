import 'package:flutter/cupertino.dart';
import 'package:pop_corn/util/result.dart';

class LCEElement<T> extends ChangeNotifier {
  bool _loading = true;
  bool _error = false;
  T? _result;

  bool get loading => _loading;
  bool get error => _error;
  T? get result => _result;

  void update(T result) {
    _result = result;
    _loading = false;
    _error = false;
    notifyListeners();
  }

  void updateResult(Future<Result<T>> future) {
    future
        .then((result) {
          switch (result) {
            case Success<T>():
              update(result.data);
              break;
            case Error<T>():
              _showError();
              break;
          }
        })
        .catchError((err) {
          _showError();
        });
  }

  void showLoading() {
    _loading = true;
    notifyListeners();
  }

  void _showError() {
    _error = true;
    _loading = false;
    notifyListeners();
  }

  void clearResult() {
    _result = null;
    _loading = true;
    _error = false;
    notifyListeners();
  }
}
