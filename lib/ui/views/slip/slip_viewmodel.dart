import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';
import 'package:unknown/app/app.locator.dart';
import 'package:unknown/services/store_service.dart';


import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

class SlipViewModel extends BaseViewModel {
  final _storeService = locator<StoreService>();

  List<Product> get products => _storeService.products;
  Map<Product, int> get selectedProducts => _storeService.selectedProducts;

  double get subtotal => _storeService.subtotal;
  double get vat => _storeService.vat;
  double get total => _storeService.total;

final GlobalKey globalKey = GlobalKey();

  Future<void> captureAndSave() async {
      try {
        RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        if (kIsWeb) {
          // For web, we need to trigger a download of the PNG file
          final html.Blob blob = html.Blob([pngBytes]);
          final String url = html.Url.createObjectUrlFromBlob(blob);
          final html.AnchorElement anchor = html.AnchorElement(href: url)
            ..target = 'blank'
            ..download = 'receipt_${DateTime.now().millisecondsSinceEpoch}.png';
          anchor.click();
        }
      } catch (e) {
        print('Error capturing receipt: $e');
      }
    }
}
