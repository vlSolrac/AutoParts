import 'package:autoparts/models/models.dart';
import 'package:flutter/cupertino.dart';

class AddCarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Car car;

  AddCarFormProvider(this.car);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
