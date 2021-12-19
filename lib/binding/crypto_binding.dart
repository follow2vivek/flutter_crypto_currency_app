import 'package:cryptocurrency/controller/crypto_controller.dart';
import 'package:cryptocurrency/provider/crypto_provider.dart';
import 'package:get/get.dart';

class CryptoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      CryptoController(
        cryptoProvider: Get.put(
          CryptoProvider(),
        ),
      ),
    );
  }
}
