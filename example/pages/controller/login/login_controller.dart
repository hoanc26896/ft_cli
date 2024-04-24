import 'package:get/get.dart';

class LoginController extends GetxController {
  final _loading = false.obs;
  get loading => _loading.value; // use getter

  setLoading(bool loading){
    _loading.value = loading;
  }
}
          