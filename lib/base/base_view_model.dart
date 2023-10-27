
import 'package:flutter_auth/base/base_mixin.dart';
import 'package:flutter/foundation.dart';


class BaseViewModel extends ChangeNotifier with BaseMixin {

  @protected
  void setState() => notifyListeners();
}