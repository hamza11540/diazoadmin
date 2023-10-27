// final serviceLocator = GetIt.instance;

import 'package:flutter_auth/di/di.dart';

Future<void> initMainServiceLocator() async {
  await setupLocator();
  return inject.allReady();
}
