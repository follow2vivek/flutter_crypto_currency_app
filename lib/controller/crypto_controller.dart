import 'package:cryptocurrency/model/crypto_model.dart';
import 'package:cryptocurrency/model/crypto_order_book.dart';
import 'package:cryptocurrency/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoController extends GetxController {
  CryptoProvider? cryptoProvider;

  CryptoController({@required this.cryptoProvider});

  TextEditingController searchController = TextEditingController();
  final bookValueColumn = ['BID PRICE', 'QTY', 'QTY', 'ASK PRICE'];
  final cryptoModel = CryptoModel().obs;
  final cryptoOrderBookModel = CryptoOrderBook().obs;
  final showOrderBook = false.obs;

  void searchCrypto(String searchValue) {
    if (searchValue.trim().isNotEmpty) {
      cryptoProvider?.searchCrypto(searchValue).then((value) {
        showOrderBook.value = false;
        cryptoModel.value = value.body!;
      }).catchError((error) {
        cryptoModel.value = CryptoModel();
      });
    }
  }

  void viewBorderBook() {
    if (showOrderBook.value) {
      showOrderBook.value = false;
    } else {
      if (searchController.text.trim().isNotEmpty) {
        cryptoProvider?.viewOrderBook(searchController.text).then((value) {
          showOrderBook.value = true;
          cryptoOrderBookModel.value = value.body!;
        }).catchError(
          (error) {
            cryptoOrderBookModel.value = CryptoOrderBook();
          },
        );
      }
    }
  }

  @override
  void onClose() {
    searchController.clear();
    super.onClose();
  }
}
