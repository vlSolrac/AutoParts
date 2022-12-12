import 'package:autoparts/models/models.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String celphone= '';
  String name = '';
  String middlename= '';
  String nickname = '';
  late UserCar currentUser;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    // print(formKey.currentState?.validate());

    // print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }
}
