import 'package:flutter/material.dart';
import 'package:pos_printers/pos_printers.dart';
import '../models/printer_item.dart';

/// For saved (connected) printers
class SavedPrinterTile extends StatelessWidget {
  final PrinterItem item;
  final VoidCallback? onDisconnect;
  final VoidCallback? onGetStatus;
  final VoidCallback? onSetNetworkSettings;
  final void Function(PrinterItem, LabelPrinterLanguage?)? onLanguageSelected;

  const SavedPrinterTile({
    super.key,
    required this.item,
    this.onDisconnect,
    this.onGetStatus,
    this.onSetNetworkSettings,
    this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isNetwork =
        item.discoveredPrinter.type == PosPrinterConnectionType.network;
    final statusColor = item.isConnected ? Colors.green : Colors.red;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isNetwork ? Icons.wifi : Icons.usb,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.discoveredPrinter.id,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  item.isConnected ? Icons.check_circle : Icons.cancel,
                  color: statusColor,
                  size: 20,
                ),
                if (onDisconnect != null)
                  IconButton(
                    icon: const Icon(Icons.close),
                    tooltip: 'Disconnect',
                    onPressed: onDisconnect,
                  ),
              ],
            ),
            // Показываем тип принтера
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                'Type: ${item.discoveredPrinter.printerType.name.toUpperCase()}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            if (onGetStatus != null)
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Printer Status'),
                dense: true,
                onTap: onGetStatus,
              ),
            if (isNetwork && onSetNetworkSettings != null)
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Network Settings'),
                dense: true,
                onTap: onSetNetworkSettings,
              ),
          ],
        ),
      ),
    );
  }
}

/// For found (unsaved) printers
class FoundPrinterTile extends StatelessWidget {
  final PrinterItem item;
  final VoidCallback? onAdd;
  final void Function(PrinterItem, LabelPrinterLanguage?)? onLanguageSelected;
  final VoidCallback? onConfigureUdp;

  const FoundPrinterTile({
    super.key,
    required this.item,
    this.onAdd,
    this.onLanguageSelected,
    this.onConfigureUdp,
  });

  @override
  Widget build(BuildContext context) {
    final isNetwork =
        item.discoveredPrinter.type == PosPrinterConnectionType.network;
    final hasMAC =
        item.discoveredPrinter.networkParams?.macAddress?.isNotEmpty ?? false;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(isNetwork ? Icons.wifi : Icons.usb, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item.discoveredPrinter.id,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (onAdd != null)
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Save'),
                    onPressed: onAdd,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 36)),
                  ),
                if (isNetwork && hasMAC && onConfigureUdp != null)
                  IconButton(
                    icon: const Icon(Icons.settings_ethernet),
                    tooltip: 'Configure via UDP',
                    onPressed: onConfigureUdp,
                  ),
              ],
            ),
            // Показываем тип принтера
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Text(
                'Type: ${item.discoveredPrinter.printerType.name.toUpperCase()}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
