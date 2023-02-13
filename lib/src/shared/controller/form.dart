import 'package:driver/services/response/response.dart';
import 'package:get/get.dart';

abstract class FormController {
  RxBool isLoading = false.obs;
  RxMap error = {}.obs;
  RxString message = "".obs;

  void setError(ServiceResponse response) {
    error.value = response.error;
    message.value = response.message!;
  }

  void formStarted() {
    isLoading.value = true;
    error.value = {}.obs;
    message.value = "";
  }

  void formEnded(ServiceResponse response) {
    message.value = response.message!;
    isLoading.value = false;

    if (response.isError) {
      error.value = response.error;
    }
  }

  void reset() {
    isLoading = RxBool(false);
    error = RxMap();
    message = RxString("");
  }
}
