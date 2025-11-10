import 'package:flutter/cupertino.dart';
import 'package:popcorn/util/result.dart';

class LCEElement<T> extends ChangeNotifier {
  bool _loading = true;
  bool _error = false;
  T? _result;

  bool get loading => _loading;
  bool get error => _error;
  T? get result => _result;

  Future<void> update(T result) async {
    _result = result;
    _loading = false;
    _error = false;
    notifyListeners();
  }

  Future<void> updateResult(Future<Result<T>> future) async {
    return future
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
