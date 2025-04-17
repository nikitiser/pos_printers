// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.kicknext.pos_printers.gen

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMethodCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

private fun createConnectionError(channelName: String): FlutterError {
  return FlutterError("channel-error",  "Unable to establish connection on channel: '$channelName'.", "")}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

enum class PosPrinterConnectionType(val raw: Int) {
  USB(0),
  NETWORK(1);

  companion object {
    fun ofRaw(raw: Int): PosPrinterConnectionType? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/** Язык лейбл-принтера (CPCL / TSPL / ZPL) */
enum class LabelPrinterLanguage(val raw: Int) {
  CPCL(0),
  TSPL(1),
  ZPL(2);

  companion object {
    fun ofRaw(raw: Int): LabelPrinterLanguage? {
      return values().firstOrNull { it.raw == raw }
    }
  }
}

/**
 * DTO c параметрами для *подключения* к принтеру.
 * Используется для connect, print, disconnect и других операций.
 * НЕ используется для обнаружения (для этого есть DiscoveredPrinter).
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class PrinterConnectionParams (
  val connectionType: PosPrinterConnectionType,
  val usbParams: UsbParams? = null,
  val networkParams: NetworkParams? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): PrinterConnectionParams {
      val connectionType = pigeonVar_list[0] as PosPrinterConnectionType
      val usbParams = pigeonVar_list[1] as UsbParams?
      val networkParams = pigeonVar_list[2] as NetworkParams?
      return PrinterConnectionParams(connectionType, usbParams, networkParams)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      connectionType,
      usbParams,
      networkParams,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class UsbParams (
  val vendorId: Long,
  val productId: Long,
  val usbSerialNumber: String? = null,
  val manufacturer: String? = null,
  val productName: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): UsbParams {
      val vendorId = pigeonVar_list[0] as Long
      val productId = pigeonVar_list[1] as Long
      val usbSerialNumber = pigeonVar_list[2] as String?
      val manufacturer = pigeonVar_list[3] as String?
      val productName = pigeonVar_list[4] as String?
      return UsbParams(vendorId, productId, usbSerialNumber, manufacturer, productName)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      vendorId,
      productId,
      usbSerialNumber,
      manufacturer,
      productName,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class NetworkParams (
  val ipAddress: String,
  val mask: String? = null,
  val gateway: String? = null,
  val macAddress: String? = null,
  val dhcp: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): NetworkParams {
      val ipAddress = pigeonVar_list[0] as String
      val mask = pigeonVar_list[1] as String?
      val gateway = pigeonVar_list[2] as String?
      val macAddress = pigeonVar_list[3] as String?
      val dhcp = pigeonVar_list[4] as Boolean?
      return NetworkParams(ipAddress, mask, gateway, macAddress, dhcp)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      ipAddress,
      mask,
      gateway,
      macAddress,
      dhcp,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class NetSettingsDTO (
  val ipAddress: String,
  val mask: String,
  val gateway: String,
  val dhcp: Boolean
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): NetSettingsDTO {
      val ipAddress = pigeonVar_list[0] as String
      val mask = pigeonVar_list[1] as String
      val gateway = pigeonVar_list[2] as String
      val dhcp = pigeonVar_list[3] as Boolean
      return NetSettingsDTO(ipAddress, mask, gateway, dhcp)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      ipAddress,
      mask,
      gateway,
      dhcp,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class ConnectResult (
  val success: Boolean,
  val message: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): ConnectResult {
      val success = pigeonVar_list[0] as Boolean
      val message = pigeonVar_list[1] as String?
      return ConnectResult(success, message)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      success,
      message,
    )
  }
}

/**
 * DTO с расширенной информацией о принтере
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class PrinterDetailsDTO (
  val serialNumber: String? = null,
  val firmwareVersion: String? = null,
  val deviceModel: String? = null,
  val currentStatus: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): PrinterDetailsDTO {
      val serialNumber = pigeonVar_list[0] as String?
      val firmwareVersion = pigeonVar_list[1] as String?
      val deviceModel = pigeonVar_list[2] as String?
      val currentStatus = pigeonVar_list[3] as String?
      return PrinterDetailsDTO(serialNumber, firmwareVersion, deviceModel, currentStatus)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      serialNumber,
      firmwareVersion,
      deviceModel,
      currentStatus,
    )
  }
}

/**
 * Result for getting printer status.
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class StatusResult (
  val success: Boolean,
  val errorMessage: String? = null,
  val status: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): StatusResult {
      val success = pigeonVar_list[0] as Boolean
      val errorMessage = pigeonVar_list[1] as String?
      val status = pigeonVar_list[2] as String?
      return StatusResult(success, errorMessage, status)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      success,
      errorMessage,
      status,
    )
  }
}

/**
 * Result for getting printer serial number or other string values.
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class StringResult (
  val success: Boolean,
  val errorMessage: String? = null,
  val value: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): StringResult {
      val success = pigeonVar_list[0] as Boolean
      val errorMessage = pigeonVar_list[1] as String?
      val value = pigeonVar_list[2] as String?
      return StringResult(success, errorMessage, value)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      success,
      errorMessage,
      value,
    )
  }
}

/**
 * DTO для найденного принтера (USB или Сеть) - результат поиска `findPrinters`.
 * Содержит информацию, достаточную для отображения пользователю и
 * для создания `PrinterConnectionParams` для последующего подключения.
 *
 * Generated class from Pigeon that represents data sent in messages.
 */
data class DiscoveredPrinter (
  /**
   * Уникальный идентификатор *найденного* устройства в данный момент.
   * Для USB: это временный `deviceName` (например, /dev/bus/usb/001/002). Не стабилен!
   * Для Network: это `ip` (например, 192.168.1.100). Стабилен, если IP не меняется.
   */
  val id: String,
  val type: PosPrinterConnectionType,
  /** Человекочитаемое имя/метка принтера. */
  val label: String,
  val vendorId: Long? = null,
  val productId: Long? = null,
  val usbSerialNumber: String? = null,
  val ipAddress: String? = null,
  val macAddress: String? = null,
  val manufacturer: String? = null,
  val productName: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): DiscoveredPrinter {
      val id = pigeonVar_list[0] as String
      val type = pigeonVar_list[1] as PosPrinterConnectionType
      val label = pigeonVar_list[2] as String
      val vendorId = pigeonVar_list[3] as Long?
      val productId = pigeonVar_list[4] as Long?
      val usbSerialNumber = pigeonVar_list[5] as String?
      val ipAddress = pigeonVar_list[6] as String?
      val macAddress = pigeonVar_list[7] as String?
      val manufacturer = pigeonVar_list[8] as String?
      val productName = pigeonVar_list[9] as String?
      return DiscoveredPrinter(id, type, label, vendorId, productId, usbSerialNumber, ipAddress, macAddress, manufacturer, productName)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      id,
      type,
      label,
      vendorId,
      productId,
      usbSerialNumber,
      ipAddress,
      macAddress,
      manufacturer,
      productName,
    )
  }
}
private open class PosPrintersPluginAPIPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          PosPrinterConnectionType.ofRaw(it.toInt())
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as Long?)?.let {
          LabelPrinterLanguage.ofRaw(it.toInt())
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PrinterConnectionParams.fromList(it)
        }
      }
      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          UsbParams.fromList(it)
        }
      }
      133.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          NetworkParams.fromList(it)
        }
      }
      134.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          NetSettingsDTO.fromList(it)
        }
      }
      135.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          ConnectResult.fromList(it)
        }
      }
      136.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          PrinterDetailsDTO.fromList(it)
        }
      }
      137.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          StatusResult.fromList(it)
        }
      }
      138.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          StringResult.fromList(it)
        }
      }
      139.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          DiscoveredPrinter.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is PosPrinterConnectionType -> {
        stream.write(129)
        writeValue(stream, value.raw)
      }
      is LabelPrinterLanguage -> {
        stream.write(130)
        writeValue(stream, value.raw)
      }
      is PrinterConnectionParams -> {
        stream.write(131)
        writeValue(stream, value.toList())
      }
      is UsbParams -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }
      is NetworkParams -> {
        stream.write(133)
        writeValue(stream, value.toList())
      }
      is NetSettingsDTO -> {
        stream.write(134)
        writeValue(stream, value.toList())
      }
      is ConnectResult -> {
        stream.write(135)
        writeValue(stream, value.toList())
      }
      is PrinterDetailsDTO -> {
        stream.write(136)
        writeValue(stream, value.toList())
      }
      is StatusResult -> {
        stream.write(137)
        writeValue(stream, value.toList())
      }
      is StringResult -> {
        stream.write(138)
        writeValue(stream, value.toList())
      }
      is DiscoveredPrinter -> {
        stream.write(139)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}


/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface POSPrintersApi {
  /**
   * Инициирует асинхронный поиск принтеров (USB, SDK Net, TCP Net).
   * Найденные принтеры (`DiscoveredPrinter`) будут отправляться через `PrinterDiscoveryEventsApi.onPrinterFound`.
   * По завершении поиска будет вызван `PrinterDiscoveryEventsApi.onDiscoveryComplete`.
   *
   * Жизненный цикл:
   * 1. Вызвать `findPrinters()`.
   * 2. Получать `DiscoveredPrinter` через `onPrinterFound`.
   * 3. Пользователь выбирает принтер из списка найденных.
   * 4. Создать `PrinterConnectionParams`, используя *стабильные* идентификаторы из `DiscoveredPrinter`
   *    (VID/PID/Serial для USB; IP для Network).
   * 5. Вызвать `connectPrinter()` с созданными параметрами.
   * 6. Выполнять операции (печать и т.д.).
   * 7. Вызвать `disconnectPrinter()`.
   */
  fun findPrinters()
  /**
   * Подключается к принтеру, используя параметры из `printer`.
   * Для USB: необходимы `vendorId`, `productId`. `usbSerialNumber` желателен.
   * Для Network: необходим `ipAddress`.
   * Возвращает `ConnectResult` с успехом/ошибкой подключения.
   * При успешном подключении плагин сохраняет соединение для последующих операций.
   * Если для этих параметров уже есть активное соединение, оно будет разорвано перед новым подключением.
   */
  fun connectPrinter(printer: PrinterConnectionParams, callback: (Result<ConnectResult>) -> Unit)
  /**
   * Отключает принтер, идентифицированный параметрами `printer`.
   * Используйте те же параметры (`vendorId`/`productId`/`usbSerialNumber` или `ipAddress`),
   * которые использовались для `connectPrinter`.
   */
  fun disconnectPrinter(printer: PrinterConnectionParams, callback: (Result<Unit>) -> Unit)
  fun getPrinterStatus(printer: PrinterConnectionParams, callback: (Result<StatusResult>) -> Unit)
  fun getPrinterSN(printer: PrinterConnectionParams, callback: (Result<StringResult>) -> Unit)
  fun openCashBox(printer: PrinterConnectionParams, callback: (Result<Unit>) -> Unit)
  /** Печать HTML для обычных чековых ESC/POS принтеров. */
  fun printHTML(printer: PrinterConnectionParams, html: String, width: Long, upsideDown: Boolean, callback: (Result<Unit>) -> Unit)
  /** Печать сырых ESC/POS команд. */
  fun printData(printer: PrinterConnectionParams, data: ByteArray, width: Long, upsideDown: Boolean, callback: (Result<Unit>) -> Unit)
  /** Настройка сетевых параметров через существующее соединение */
  fun setNetSettingsToPrinter(printer: PrinterConnectionParams, netSettings: NetSettingsDTO, callback: (Result<Unit>) -> Unit)
  /** Настройка сетевых параметров через UDP broadcast (требуется MAC-адрес) */
  fun configureNetViaUDP(macAddress: String, netSettings: NetSettingsDTO, callback: (Result<Unit>) -> Unit)
  /** Печать "сырых" команд (CPCL/TSPL/ZPL), если нужно. */
  fun printLabelData(printer: PrinterConnectionParams, language: LabelPrinterLanguage, labelCommands: ByteArray, width: Long, callback: (Result<Unit>) -> Unit)
  /** Печать HTML на лейбл-принтер (рендерим HTML -> bitmap), */
  fun printLabelHTML(printer: PrinterConnectionParams, language: LabelPrinterLanguage, html: String, width: Long, height: Long, callback: (Result<Unit>) -> Unit)
  /** Установка базовых параметров (размер этикетки, скорость, плотность) */
  fun setupLabelParams(printer: PrinterConnectionParams, language: LabelPrinterLanguage, labelWidth: Long, labelHeight: Long, densityOrDarkness: Long, speed: Long, callback: (Result<Unit>) -> Unit)
  /** Получение расширенной информации о принтере */
  fun getPrinterDetails(printer: PrinterConnectionParams, callback: (Result<PrinterDetailsDTO>) -> Unit)

  companion object {
    /** The codec used by POSPrintersApi. */
    val codec: MessageCodec<Any?> by lazy {
      PosPrintersPluginAPIPigeonCodec()
    }
    /** Sets up an instance of `POSPrintersApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: POSPrintersApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.findPrinters$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            val wrapped: List<Any?> = try {
              api.findPrinters()
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.connectPrinter$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.connectPrinter(printerArg) { result: Result<ConnectResult> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.disconnectPrinter$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.disconnectPrinter(printerArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinterStatus$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.getPrinterStatus(printerArg) { result: Result<StatusResult> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinterSN$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.getPrinterSN(printerArg) { result: Result<StringResult> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.openCashBox$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.openCashBox(printerArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.printHTML$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val htmlArg = args[1] as String
            val widthArg = args[2] as Long
            val upsideDownArg = args[3] as Boolean
            api.printHTML(printerArg, htmlArg, widthArg, upsideDownArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.printData$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val dataArg = args[1] as ByteArray
            val widthArg = args[2] as Long
            val upsideDownArg = args[3] as Boolean
            api.printData(printerArg, dataArg, widthArg, upsideDownArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.setNetSettingsToPrinter$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val netSettingsArg = args[1] as NetSettingsDTO
            api.setNetSettingsToPrinter(printerArg, netSettingsArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.configureNetViaUDP$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val macAddressArg = args[0] as String
            val netSettingsArg = args[1] as NetSettingsDTO
            api.configureNetViaUDP(macAddressArg, netSettingsArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.printLabelData$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val languageArg = args[1] as LabelPrinterLanguage
            val labelCommandsArg = args[2] as ByteArray
            val widthArg = args[3] as Long
            api.printLabelData(printerArg, languageArg, labelCommandsArg, widthArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.printLabelHTML$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val languageArg = args[1] as LabelPrinterLanguage
            val htmlArg = args[2] as String
            val widthArg = args[3] as Long
            val heightArg = args[4] as Long
            api.printLabelHTML(printerArg, languageArg, htmlArg, widthArg, heightArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.setupLabelParams$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            val languageArg = args[1] as LabelPrinterLanguage
            val labelWidthArg = args[2] as Long
            val labelHeightArg = args[3] as Long
            val densityOrDarknessArg = args[4] as Long
            val speedArg = args[5] as Long
            api.setupLabelParams(printerArg, languageArg, labelWidthArg, labelHeightArg, densityOrDarknessArg, speedArg) { result: Result<Unit> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                reply.reply(wrapResult(null))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val taskQueue = binaryMessenger.makeBackgroundTaskQueue()
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.pos_printers.POSPrintersApi.getPrinterDetails$separatedMessageChannelSuffix", codec, taskQueue)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val printerArg = args[0] as PrinterConnectionParams
            api.getPrinterDetails(printerArg) { result: Result<PrinterDetailsDTO> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
/**
 * API для получения событий обнаружения принтеров из нативного кода во Flutter.
 *
 * Generated class from Pigeon that represents Flutter messages that can be called from Kotlin.
 */
class PrinterDiscoveryEventsApi(private val binaryMessenger: BinaryMessenger, private val messageChannelSuffix: String = "") {
  companion object {
    /** The codec used by PrinterDiscoveryEventsApi. */
    val codec: MessageCodec<Any?> by lazy {
      PosPrintersPluginAPIPigeonCodec()
    }
  }
  /**
   * Вызывается при обнаружении нового (уникального) принтера.
   * `printer` содержит информацию о найденном принтере. Используйте стабильные
   * идентификаторы из него (`vendorId`/`productId`/`usbSerialNumber` или `ipAddress`)
   * для создания `PrinterConnectionParams` при вызове `connectPrinter`.
   */
  fun onPrinterFound(printerArg: DiscoveredPrinter, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onPrinterFound$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(printerArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
  /**
   * Вызывается по завершении всего процесса поиска.
   * `success` = true, если поиск завершился без критических ошибок (даже если ничего не найдено).
   * `errorMessage` содержит сообщение об ошибке, если `success` = false.
   */
  fun onDiscoveryComplete(successArg: Boolean, errorMessageArg: String?, callback: (Result<Unit>) -> Unit)
{
    val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
    val channelName = "dev.flutter.pigeon.pos_printers.PrinterDiscoveryEventsApi.onDiscoveryComplete$separatedMessageChannelSuffix"
    val channel = BasicMessageChannel<Any?>(binaryMessenger, channelName, codec)
    channel.send(listOf(successArg, errorMessageArg)) {
      if (it is List<*>) {
        if (it.size > 1) {
          callback(Result.failure(FlutterError(it[0] as String, it[1] as String, it[2] as String?)))
        } else {
          callback(Result.success(Unit))
        }
      } else {
        callback(Result.failure(createConnectionError(channelName)))
      } 
    }
  }
}
