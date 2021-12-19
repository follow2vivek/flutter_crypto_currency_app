import 'package:cryptocurrency/controller/crypto_controller.dart';
import 'package:cryptocurrency/model/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class CryptoScreen extends GetView<CryptoController> {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            controller.searchCrypto(controller.searchController.text),
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Crypto',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: Get.height),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: 'Enter currency pair',
                    labelStyle: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => controller
                          .searchCrypto(controller.searchController.text),
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),
                  ),
                  onChanged: (value) => controller.searchController.text = value,
                ),
                Obx(
                  () => controller.cryptoModel.value.ask == null
                      ? Container(
                        margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              
                              Icon(
                                Icons.search,
                                size: 100,
                                color: Colors.grey,
                              ),
                              Text(
                                'Enter currency pair to load data',
                                style: GoogleFonts.nunito(
                                    color: Colors.grey, fontSize: 20),
                              )
                            ],
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.searchController.text
                                        .toUpperCase(),
                                    style: GoogleFonts.nunito(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    Jiffy(controller.cryptoModel.value.timestamp)
                                        .format('dd MMM yyyy, hh:mm:ss'),
                                    style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OPEN',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$ ${controller.cryptoModel.value.open}',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'HIGH',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$ ${controller.cryptoModel.value.high}',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'LOW',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$ ${controller.cryptoModel.value.low}',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'LAST',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$ ${controller.cryptoModel.value.last}',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'VOLUME',
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${controller.cryptoModel.value.volume}',
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  child: Text(
                                    controller.showOrderBook.value
                                        ? 'HIDE ORDER BOOK'
                                        : 'VIEW ORDER BOOK',
                                    style: GoogleFonts.nunito(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onTap: () => controller.viewBorderBook(),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => controller.cryptoOrderBookModel.value.asks != null &&
                        controller.showOrderBook.value
                    ? Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: DataTable(
                          columnSpacing: 10,
                          showCheckboxColumn: false,
                          columns: controller.bookValueColumn
                              .map(
                                (e) => DataColumn(
                                  numeric: false,
                                  label: Expanded(
                                    child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          rows: [
                            for (var i = 0;
                                i <
                                    controller
                                        .cryptoOrderBookModel.value.asks!.length;
                                i++)
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(controller
                                        .cryptoOrderBookModel.value.bids![i][0]),
                                  ),
                                  DataCell(Text(controller
                                      .cryptoOrderBookModel.value.bids![i][1])),
                                  DataCell(Text(controller
                                      .cryptoOrderBookModel.value.asks![i][1])),
                                  DataCell(Text(controller
                                      .cryptoOrderBookModel.value.bids![i][0])),
                                ],
                              )
                          ],
                        ),
                      )
                    : SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
