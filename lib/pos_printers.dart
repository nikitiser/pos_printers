import 'dart:async';
import 'package:pos_printers/pos_printers.pigeon.dart';

import 'models/printer.dart';

class PosPrintersManager implements POSPrintersReceiverApi {
  PosPrintersManager() {
    POSPrintersReceiverApi.setup(this);
  }

  POSPrinter? printer;
  StreamController<XPrinterDTO>? _printerStreamController;

  Stream<XPrinterDTO> findPrinters() async* {
    _printerStreamController = StreamController<XPrinterDTO>();
    POSPrintersApi().getPrinters().then((_) {
      _printerStreamController!.close();
      _printerStreamController = null;
    });
    yield* _printerStreamController!.stream;
  }

  @override
  void newPrinter(XPrinterDTO printer) {
    _printerStreamController?.add(printer);
  }

  @override
  void connectionHandler(ConnectResult message) {}
}
