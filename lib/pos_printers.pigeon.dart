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

/// Язык принтера (ESC/POS / CPCL / TSPL / ZPL / Unknown)
enum PrinterLanguage {
  escPos,
  cpcl,
  tspl,
  zpl,
  unknown,
}

/// DTO c настройками подключения (USB, Network, etc.)
/// Без поля PrinterLanguage.
class PrinterConnectionParams {
  PrinterConnectionParams({
    required this.connectionType,
    this.usbPath,
    this.macAddress,
    this.ipAddress,
    this.mask,
    this.gateway,
    this.dhcp,
  });

  PosPrinterConnectionType connectionType;

  String? usbPath;

  String? macAddress;

  String? ipAddress;

  String? mask;

  String? gateway;

  bool? dhcp;

  Object encode() {
    return <Object?>[
      connectionType,
      usbPath,
      macAddress,
      ipAddress,
      mask,
      gateway,
      dhcp,
    ];
  }

  static PrinterConnectionParams decode(Object result) {
    result as List<Object?>;
    return PrinterConnectionParams(
      connectionType: result[0]! as PosPrinterConnectionType,
      usbPath: result[1] as String?,
      macAddress: result[2] as String?,
      ipAddress: result[3] as String?,
      mask: result[4] as String?,
      gateway: result[5] as String?,
      dhcp: result[6] as bool?,
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

class ConnectResult {
  ConnectResult({
    required this.success,
    this.message,
  });

  bool success;

  String? message;

  Object encode() {
    return <Object?>[
      success,
      message,
    ];
  }

  static ConnectResult decode(Object result) {
    result as List<Object?>;
    return ConnectResult(
      success: result[0]! as bool,
      message: result[1] as String?,
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
    }    else if (value is PrinterLanguage) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    }    else if (value is PrinterConnectionParams) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    }    else if (value is NetSettingsDTO) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    }    else if (value is ConnectResult) {
      buffer.putUint8(133);
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
        return value == null ? null : PrinterLanguage.values[value];
      case 131: 
        return PrinterConnectionParams.decode(readValue(buffer)!);
      case 132: 
        return NetSettingsDTO.decode(readValue(buffer)!);
      case 133: 
        return ConnectResult.decode(readValue(buffer)!);
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

  Future<bool> getPrinters() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinters$pigeonVar_messageChannelSuffix';
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<ConnectResult> connectPrinter(PrinterConnectionParams printer) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as ConnectResult?)!;
    }
  }

  Future<bool> disconnectPrinter(PrinterConnectionParams printer) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<String> getPrinterStatus(PrinterConnectionParams printer) async {
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
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  Future<String> getPrinterSN(PrinterConnectionParams printer) async {
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
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  Future<String> openCashBox(PrinterConnectionParams printer) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as String?)!;
    }
  }

  /// Печать HTML для обычных чековых ESC/POS принтеров.
  Future<bool> printHTML(PrinterConnectionParams printer, String html, int width) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printHTML$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, html, width]) as List<Object?>?;
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
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Печать сырых ESC/POS команд.
  Future<bool> printData(PrinterConnectionParams printer, Uint8List data, int width) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.printData$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, data, width]) as List<Object?>?;
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
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Настройка сетевых параметров
  Future<bool> setNetSettingsToPrinter(PrinterConnectionParams printer, NetSettingsDTO netSettings) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Печать "сырых" команд (CPCL/TSPL/ZPL), если нужно.
  /// [language] - указываем, какой именно формат (cpcl, tspl, zpl, ...)
  Future<bool> printLabelData(PrinterConnectionParams printer, PrinterLanguage language, Uint8List labelCommands, int width) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Печать HTML на лейбл-принтер (рендерим HTML -> bitmap),
  /// [language] - тип команды (cpcl, tspl, zpl) для отправки.
  Future<bool> printLabelHTML(PrinterConnectionParams printer, PrinterLanguage language, String html, int width, int height) async {
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
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Установка базовых параметров (размер этикетки, скорость, плотность)
  /// [language] - cpcl, tspl, zpl
  Future<bool> setupLabelParams(PrinterConnectionParams printer, PrinterLanguage language, int labelWidth, int labelHeight, int densityOrDarkness, int speed) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.pos_printers.POSPrintersApi.setupLabelParams$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[printer, language, labelWidth, labelHeight, densityOrDarkness, speed]) as List<Object?>?;
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
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }
}

abstract class POSPrintersReceiverApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void newPrinter(PrinterConnectionParams message);

  void connectionHandler(ConnectResult message);

  static void setUp(POSPrintersReceiverApi? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.newPrinter$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.newPrinter was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final PrinterConnectionParams? arg_message = (args[0] as PrinterConnectionParams?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.newPrinter was null, expected non-null PrinterConnectionParams.');
          try {
            api.newPrinter(arg_message!);
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
          'dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.connectionHandler$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.connectionHandler was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final ConnectResult? arg_message = (args[0] as ConnectResult?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.pos_printers.POSPrintersReceiverApi.connectionHandler was null, expected non-null ConnectResult.');
          try {
            api.connectionHandler(arg_message!);
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
