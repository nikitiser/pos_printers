// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum PosPrinterConnectionType {
  usb,
  network,
}

/// Язык лейбл-принтера (CPCL / TSPL / ZPL)
enum LabelPrinterLanguage {
  cpcl,
  tspl,
  zpl,
}

class PrinterConnectionParams {
  PrinterConnectionParams({
    required this.connectionType,
    this.usbParams,
    this.networkParams,
  });

  PosPrinterConnectionType connectionType;

  UsbParams? usbParams;

  NetworkParams? networkParams;

  Object encode() {
    return <Object?>[
      connectionType,
      usbParams,
      networkParams,
    ];
  }

  static PrinterConnectionParams decode(Object result) {
    result as List<Object?>;
    return PrinterConnectionParams(
      connectionType: result[0]! as PosPrinterConnectionType,
      usbParams: result[1] as UsbParams?,
      networkParams: result[2] as NetworkParams?,
    );
  }
}

class UsbParams {
  UsbParams({
    required this.vendorId,
    required this.productId,
    this.usbSerialNumber,
    this.manufacturer,
    this.productName,
  });

  int vendorId;

  int productId;

  String? usbSerialNumber;

  String? manufacturer;

  String? productName;

  Object encode() {
    return <Object?>[
      vendorId,
      productId,
      usbSerialNumber,
      manufacturer,
      productName,
    ];
  }

  static UsbParams decode(Object result) {
    result as List<Object?>;
    return UsbParams(
      vendorId: result[0]! as int,
      productId: result[1]! as int,
      usbSerialNumber: result[2] as String?,
      manufacturer: result[3] as String?,
      productName: result[4] as String?,
    );
  }
}

class NetworkParams {
  NetworkParams({
    required this.ipAddress,
    this.mask,
    this.gateway,
    this.macAddress,
    this.dhcp,
  });

  String ipAddress;

  String? mask;

  String? gateway;

  String? macAddress;

  bool? dhcp;

  Object encode() {
    return <Object?>[
      ipAddress,
      mask,
      gateway,
      macAddress,
      dhcp,
    ];
  }

  static NetworkParams decode(Object result) {
    result as List<Object?>;
    return NetworkParams(
      ipAddress: result[0]! as String,
      mask: result[1] as String?,
      gateway: result[2] as String?,
      macAddress: result[3] as String?,
      dhcp: result[4] as bool?,
    );
  }
}

class NetSettingsDTO {
  NetSettingsDTO({
    required this.ipAddress,
    required this.mask,
    required this.gateway,
    required this.dhcp,
  });

  String ipAddress;

  String mask;

  String gateway;

  bool dhcp;

  Object encode() {
    return <Object?>[
      ipAddress,
      mask,
      gateway,
      dhcp,
    ];
  }

  static NetSettingsDTO decode(Object result) {
    result as List<Object?>;
    return NetSettingsDTO(
      ipAddress: result[0]! as String,
      mask: result[1]! as String,
      gateway: result[2]! as String,
      dhcp: result[3]! as bool,
    );
  }
}

/// DTO с расширенной информацией о принтере
/// Result for getting printer status.
class StatusResult {
  StatusResult({
    required this.success,
    this.errorMessage,
    this.status,
  });

  bool success;

  String? errorMessage;

  String? status;

  Object encode() {
    return <Object?>[
      success,
      errorMessage,
      status,
    ];
  }

  static StatusResult decode(Object result) {
    result as List<Object?>;
    return StatusResult(
      success: result[0]! as bool,
      errorMessage: result[1] as String?,
      status: result[2] as String?,
    );
  }
}

class StringResult {
  StringResult({
    required this.success,
    this.errorMessage,
    this.value,
  });

  bool success;

  String? errorMessage;

  String? value;

  Object encode() {
    return <Object?>[
      success,
      errorMessage,
      value,
    ];
  }

  static StringResult decode(Object result) {
    result as List<Object?>;
    return StringResult(
      success: result[0]! as bool,
      errorMessage: result[1] as String?,
      value: result[2] as String?,
    );
  }
}

class DiscoveredPrinterDTO {
  DiscoveredPrinterDTO({
    required this.id,
    required this.type,
    this.usbParams,
    this.networkParams,
  });

  String id;

  PosPrinterConnectionType type;

  UsbParams? usbParams;

  NetworkParams? networkParams;

  Object encode() {
    return <Object?>[
      id,
      type,
      usbParams,
      networkParams,
    ];
  }

  static DiscoveredPrinterDTO decode(Object result) {
    result as List<Object?>;
    return DiscoveredPrinterDTO(
      id: result[0]! as String,
      type: result[1]! as PosPrinterConnectionType,
      usbParams: result[2] as UsbParams?,
      networkParams: result[3] as NetworkParams?,
    );
  }
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is PosPrinterConnectionType) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    }    else if (value is LabelPrinterLanguage) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    }    else if (value is PrinterConnectionParams) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    }    else if (value is UsbParams) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    }    else if (value is NetworkParams) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    }    else if (value is NetSettingsDTO) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    }    else if (value is StatusResult) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    }    else if (value is StringResult) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    }    else if (value is DiscoveredPrinterDTO) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : PosPrinterConnectionType.values[value];
      case 130: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : LabelPrinterLanguage.values[value];
      case 131: 
        return PrinterConnectionParams.decode(readValue(buffer)!);
      case 132: 
        return UsbParams.decode(readValue(buffer)!);
      case 133: 
        return NetworkParams.decode(readValue(buffer)!);
      case 134: 
        return NetSettingsDTO.decode(readValue(buffer)!);
      case 135: 
        return StatusResult.decode(readValue(buffer)!);
      case 136: 
        return StringResult.decode(readValue(buffer)!);
      case 137: 
        return DiscoveredPrinterDTO.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class POSPrintersApi {
  /// Constructor for [POSPrintersApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  POSPrintersApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  /// Инициирует асинхронный поиск принтеров (USB, SDK Net, TCP Net).
  /// Найденные принтеры (`DiscoveredPrinter`) будут отправляться через `PrinterDiscoveryEventsApi.onPrinterFound`.
  /// По завершении поиска будет вызван `PrinterDiscoveryEventsApi.onDiscoveryComplete`.
  ///
  /// Жизненный цикл:
  /// 1. Вызвать `findPrinters()`.
  /// 2. Получать `DiscoveredPrinter` через `onPrinterFound`.
  /// 3. Пользователь выбирает принтер из списка найденных.
  /// 4. Создать `PrinterConnectionParams`, используя *стабильные* идентификаторы из `DiscoveredPrinter`
  ///    (VID/PID/Serial для USB; IP для Network).
  /// 5. Вызвать `connectPrinter()` с созданными параметрами.
  /// 6. Выполнять операции (печать и т.д.).
  /// 7. Вызвать `disconnectPrinter()`.
  Future<void> findPrinters() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.findPrinters$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> connectPrinter(PrinterConnectionParams printer) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.connectPrinter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> disconnectPrinter(PrinterConnectionParams printer) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.disconnectPrinter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<StatusResult> getPrinterStatus(PrinterConnectionParams printer) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinterStatus$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as StatusResult?)!;
    }
  }

  Future<StringResult> getPrinterSN(PrinterConnectionParams printer) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinterSN$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as StringResult?)!;
    }
  }

  Future<void> openCashBox(PrinterConnectionParams printer) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.openCashBox$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Печать HTML для обычных чековых ESC/POS принтеров.
  Future<void> printHTML(PrinterConnectionParams printer, String html, int width, bool upsideDown) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printHTML$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, html, width, upsideDown]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Печать сырых ESC/POS команд.
  Future<void> printData(PrinterConnectionParams printer, Uint8List data, int width, bool upsideDown) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printData$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, data, width, upsideDown]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Настройка сетевых параметров через существующее соединение
  Future<void> setNetSettingsToPrinter(PrinterConnectionParams printer, NetSettingsDTO netSettings) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.setNetSettingsToPrinter$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, netSettings]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Настройка сетевых параметров через UDP broadcast (требуется MAC-адрес)
  Future<void> configureNetViaUDP(String macAddress, NetSettingsDTO netSettings) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.configureNetViaUDP$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[macAddress, netSettings]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Печать "сырых" команд (CPCL/TSPL/ZPL), если нужно.
  Future<void> printLabelData(PrinterConnectionParams printer, LabelPrinterLanguage language, Uint8List labelCommands, int width) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printLabelData$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, language, labelCommands, width]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Печать HTML на лейбл-принтер (рендерим HTML -> bitmap),
  Future<void> printLabelHTML(PrinterConnectionParams printer, LabelPrinterLanguage language, String html, int width, int height) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printLabelHTML$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, language, html, width, height]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }
}

/// API для получения событий обнаружения принтеров из нативного кода во Flutter.
abstract class PrinterDiscoveryEventsApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  /// Вызывается при обнаружении нового (уникального) принтера.
  /// `printer` содержит информацию о найденном принтере. Используйте стабильные
  /// идентификаторы из него (`vendorId`/`productId`/`usbSerialNumber` или `ipAddress`)
  /// для создания `PrinterConnectionParams` при вызове `connectPrinter`.
  void onPrinterFound(DiscoveredPrinterDTO printer);

  /// Вызывается по завершении всего процесса поиска.
  /// `success` = true, если поиск завершился без критических ошибок (даже если ничего не найдено).
  /// `errorMessage` содержит сообщение об ошибке, если `success` = false.
  void onDiscoveryComplete(bool success, String? errorMessage);

  static void setUp(PrinterDiscoveryEventsApi? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onPrinterFound$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onPrinterFound was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final DiscoveredPrinterDTO? arg_printer = (args[0] as DiscoveredPrinterDTO?);
          assert(arg_printer != null,
              'Argument for dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onPrinterFound was null, expected non-null DiscoveredPrinterDTO.');
          try {
            api.onPrinterFound(arg_printer!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onDiscoveryComplete$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onDiscoveryComplete was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final bool? arg_success = (args[0] as bool?);
          assert(arg_success != null,
              'Argument for dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onDiscoveryComplete was null, expected non-null bool.');
          final String? arg_errorMessage = (args[1] as String?);
          try {
            api.onDiscoveryComplete(arg_success!, arg_errorMessage);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
