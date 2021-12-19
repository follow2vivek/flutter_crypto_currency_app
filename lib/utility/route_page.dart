import 'package:cryptocurrency/binding/crypto_binding.dart';
import 'package:cryptocurrency/screen/crypto_screen.dart';
import 'package:get/route_manager.dart';

class RoutePage {
  static const cryptoPage = '/searchCrypto';

  static final pages = [
    GetPage(
      name: cryptoPage,
      page: () => CryptoScreen(),
      binding: CryptoBinding(),
    ),
  ];
}
