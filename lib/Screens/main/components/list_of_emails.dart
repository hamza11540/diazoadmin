import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/logger/log.dart';
import 'package:flutter_auth/models/order_model.dart';
import 'package:flutter_auth/view_model/order_detail_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../components/side_menu.dart';
import '../../../colors.dart';
import '../../../models/Email.dart';
import '../../../responsive.dart';
import '../../email/email_screen.dart';
import 'email_card.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;

class ListOfEmails extends StatefulWidget {
  // Press "Command + ."
  const ListOfEmails({
    Key? key,
  }) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final OrderDetailViewModel orderDetailViewModel =
        context.read<OrderDetailViewModel>();
    orderDetailViewModel.listenAllOrderFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    final OrderDetailViewModel orderDetailViewModel =
        context.watch<OrderDetailViewModel>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context))
                      const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding:
                                EdgeInsets.all(kDefaultPadding * 0.75), //15
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: const Icon(
                        Icons.sort,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: orderDetailViewModel.currentIndex == 0
                      ? orderDetailViewModel.cookingOrder.length
                      : orderDetailViewModel.currentIndex == 1
                          ? orderDetailViewModel.onTheWayOrder.length
                          : orderDetailViewModel.deliveredOrder.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => OrderItemWidget(
                    press: () async {
                      const PaperSize paper = PaperSize.mm80;
                      final profile = await CapabilityProfile.load();
                      final printer = NetworkPrinter(paper, profile);

                      printReceiptOverWifi('192.168.1.152', 9100,
                          'This is test print we are testing', printer);

                      final PosPrintResult res =
                          await printer.connect('192.168.1.152', port: 9100);

                      if (res == PosPrintResult.success) {
                        // testReceipt(printer, widget.ordersModel);
                        printDemoReceipt(
                            printer,
                            orderDetailViewModel.currentIndex == 0
                                ? orderDetailViewModel.cookingOrder[index]
                                : orderDetailViewModel.currentIndex == 1
                                    ? orderDetailViewModel.onTheWayOrder[index]
                                    : orderDetailViewModel
                                        .deliveredOrder[index]);
                        printer.disconnect();
                      }
                      d('Print result: ${res.msg}');

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         EmailScreen(email: emails[index]),
                      //   ),
                      // );
                    },
                    tabIndex: orderDetailViewModel.currentIndex,
                    ordersModel: orderDetailViewModel.currentIndex == 0
                        ? orderDetailViewModel.cookingOrder[index]
                        : orderDetailViewModel.currentIndex == 1
                            ? orderDetailViewModel.onTheWayOrder[index]
                            : orderDetailViewModel.deliveredOrder[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> printDemoReceipt(
      NetworkPrinter printer, OrdersModel ordersModel) async {
    // Print image
    // final ByteData data = await rootBundle.load('assets/images/logo.png');
    // final Uint8List bytes = data.buffer.asUint8List();
    // final image = decodeImage(bytes);
    // printer.image(image!);
    //
    printer.text('Diazo',
        styles: const PosStyles(
          align: PosAlign.center,
          underline: true,
          height: PosTextSize.size5,
          width: PosTextSize.size5,
        ),
        linesAfter: 1);

    printer.text('Reinickendorferstr 3',
        styles: const PosStyles(align: PosAlign.center));
    printer.text('13347 Berlin',
        styles: const PosStyles(align: PosAlign.center));
    printer.text('Tel: 03071042321',
        styles: const PosStyles(align: PosAlign.center));
    printer.text('Email: info@diazo.pizza.de',
        styles: const PosStyles(align: PosAlign.center), linesAfter: 1);

    printer.hr();

    printer.row([
      PosColumn(text: 'Qty', width: 1),
      PosColumn(text: 'Item', width: 7),
      PosColumn(
          text: 'Price',
          width: 2,
          styles: const PosStyles(align: PosAlign.right)),
      PosColumn(
          text: 'Total',
          width: 2,
          styles: const PosStyles(align: PosAlign.right)),
    ]);

    for (int i = 0; i < ordersModel.items!.length; i++) {
      printer.row([
        PosColumn(text: '${ordersModel.items![i].quantity}x', width: 1),
        PosColumn(text: '${ordersModel.items![i].name}', width: 7),
        PosColumn(
            text: '${ordersModel.items![i].size!.discountedPrice}',
            width: 2,
            styles: const PosStyles(align: PosAlign.right)),
        PosColumn(
            text: '${ordersModel.items![i].size!.discountedPrice}',
            width: 2,
            styles: const PosStyles(align: PosAlign.right)),
      ]);
    }
    printer.hr();

    printer.row([
      PosColumn(
          text: 'TOTAL',
          width: 6,
          styles: const PosStyles(
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
      PosColumn(
          text: '${ordersModel.totalPrice}',
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
            codeTable: 'CP1252',
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          )),
    ]);

    printer.hr(ch: '=', linesAfter: 1);

    printer.feed(2);
    printer.text('Thank you!',
        styles: const PosStyles(align: PosAlign.center, bold: true));

    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy H:m');
    final String timestamp = formatter.format(now);
    printer.text(timestamp,
        styles: const PosStyles(align: PosAlign.center), linesAfter: 2);

    // Print QR Code from image
    // try {
    //   const String qrData = 'example.com';
    //   const double qrSize = 200;
    //   final uiImg = await QrPainter(
    //     data: qrData,
    //     version: QrVersions.auto,
    //     gapless: false,
    //   ).toImageData(qrSize);
    //   final dir = await getTemporaryDirectory();
    //   final pathName = '${dir.path}/qr_tmp.png';
    //   final qrFile = File(pathName);
    //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
    //   final img = decodeImage(imgFile.readAsBytesSync());

    //   printer.image(img);
    // } catch (e) {
    //   print(e);
    // }

    // Print QR Code using native function
    // printer.qrcode('example.com');

    printer.feed(1);
    printer.cut();
  }
  //
  // void printReceipt(String receiptText) {
  //   final receiptWindow = html.window.open('', '_blank');
  //   receiptWindow.document.write('<html><head><title>Receipt</title></head><body>');
  //   receiptWindow.document.write('<pre>$receiptText</pre>');
  //   receiptWindow.document.write('</body></html>');
  //   receiptWindow.document.close();
  //   receiptWindow.print();
  //   receiptWindow.onPrint.listen((event) {
  //     receiptWindow.close();
  //   });
  // }

  void printReceiptOverWifi(String printerIp, int printerPort,
      String receiptText, NetworkPrinter printer) async {
    print('This is in the funcatuion');
    final printerUrl = Uri.parse('http://$printerIp:$printerPort');

    try {
      final response = await http.post(
        printerUrl,
        body: receiptText,
      );

      if (response.statusCode == 200) {
        print('Receipt sent to printer successfully');
      } else {
        print(
            'Failed to send receipt to printer. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {}
    printer.cut();
  }
}
