

import 'iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrl() {
    return '';
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }
}
