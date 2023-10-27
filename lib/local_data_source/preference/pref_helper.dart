import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


import '../../logger/log.dart';
import '../../models/order_model.dart';
import 'i_pref_helper.dart';

class PrefHelper implements IPrefHelper {
  late final SharedPreferences _pref;

  PrefHelper(SharedPreferences preferences) : _pref = preferences;

  // @override
  // String? retrieveToken() {
  //   if (_pref.containsKey("userToken")) {
  //     return _pref.getString("userToken");
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // void saveToken(value) {
  //   d("userToken => $value");
  //   _pref.setString("userToken", value);
  // }

  @override
  void clear() {
    _pref.clear();
  }

  @override
  SharedPreferences get() {
    return _pref;
  }

  // @override
  // void removeToken() {
  //   _pref.remove('userToken');
  // }
  //
  @override
  void removeUser() {
    _pref.remove('user_data');
  }

  @override
   retrieveBranch() {
    if (_pref.containsKey("branch")) {
      Map<String, dynamic> jsonData = json.decode(_pref.getString("branch")!);
      return jsonData;
    } else {
      return null;
    }
  }

  @override
  void saveBranch(res) {
    _pref.setString("branch", json.encode(res.toJson()));
  }

  @override
  retrieveCart() {
    if (_pref.containsKey("cart")) {
      d( 'ITEMS IN CART FROM PREF :::: ${_pref.getString("cart")}');
      var jsonData = json.decode(_pref.getString("cart")!);
      return jsonData;
    } else {
      return null;
    }
  }

  @override
  void saveCart(List<CartItemModel> items) {
    _pref.setString('cart', items.map((e) => e.toJson()).toString());
  }

  @override
  bool? getBool(String key) {
    if(_pref.containsKey(key))
      {
        return _pref.getBool(key);
      }
    return null ;
  }

  @override
  void saveBool(String key, bool value) {
    _pref.setBool(key, value);
  }

  @override
  String? selectedRestaurant() {
    return _pref.getString('restaurant');
  }

  @override
  void setRestaurant(String name) {
    _pref.setString('restaurant', name);
  }



}
