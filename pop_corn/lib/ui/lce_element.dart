import 'package:flutter/cupertino.dart';
import 'package:pop_corn/util/result.dart';

class LCEElement<T> extends ChangeNotifier {

  bool _loading = true;
  bool _error = false;
  T? _result;

  get loading => _loading;
  get error => _error;
  get result => _result;

  void update(T result) {
    _result = result;
    _loading = false;
    _error = false;
    print('update funtion');
    notifyListeners();
  }

  void updateResult(Future<Result<T>> future) {
    print('update result');
    future.then((result) {
      switch (result) {
        case Success<T>():
          update(result.data);
          break;
        case Error<T>():
          print('error in update result');
          _showError();
          break;
      }
    }).catchError((err) {
      _showError();
    });
  }

  void showLoading(bool clearData) {
    _loading = true;
    if (clearData) {
      _result = null;
    }
    notifyListeners();
  }

  void _showError() {
    _error = true;
    notifyListeners();
  }

  /// Clear last action result
  void clearResult() {
    _result = null;
    notifyListeners();
  }
}
