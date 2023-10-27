
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/order_model.dart';

abstract class IPrefHelper {
  // String? retrieveToken();
  // void saveToken(value);
  // void removeToken();
  void saveBool(String key, bool value);
  retrieveCart();
  void saveCart(List<CartItemModel> items);
  bool?  getBool(String key);
  void saveBranch(var verificationModel);
  retrieveBranch();
  void removeUser();

  void setRestaurant(String name);
  String? selectedRestaurant();

  SharedPreferences get();
  void clear();
}
