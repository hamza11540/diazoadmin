import 'dart:io';

import 'package:flutter_auth/network/external_values/ExternalValues.dart';
import 'package:flutter_auth/network/external_values/iExternalValue.dart';
import 'package:flutter_auth/services/navService/i_navigation_service.dart';
import 'package:flutter_auth/services/navService/nav_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../local_data_source/preference/i_pref_helper.dart';
import '../local_data_source/preference/pref_helper.dart';

import '../utilis/overlay_helper.dart';
import '../utilis/utils.dart';

final inject = GetIt.instance;

Future<void> setupLocator() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton<IExternalValues>(() => ExternalValues());
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));
  inject.registerLazySingleton<Px>(() => Px());
  inject.registerLazySingleton<Utils>(() => Utils());
  //
  // // inject.registerLazySingleton<INavigationService>(() => NavigationService());
  //
  // if (Platform.isIOS) {
  //   inject
  //       .registerLazySingleton<OverlayEntryHelper>(() => OverlayEntryHelper());
  // }
}
