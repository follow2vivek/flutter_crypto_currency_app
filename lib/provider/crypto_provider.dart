import 'package:cryptocurrency/model/crypto_model.dart';
import 'package:cryptocurrency/model/crypto_order_book.dart';
import 'package:get/get.dart';

class CryptoProvider extends GetConnect {
  
  Future<Response<CryptoModel>> searchCrypto(String search) {
    return get(
      'https://www.bitstamp.net/api/ticker/$search',
      decoder: (value) => CryptoModel.fromJson(value),
    );
  }

  Future<Response<CryptoOrderBook>> viewOrderBook(String search) {
    return get(
      'https://www.bitstamp.net/api/order_book/$search',
      decoder: (value) => CryptoOrderBook.fromJson(value),
    );
  }
}
