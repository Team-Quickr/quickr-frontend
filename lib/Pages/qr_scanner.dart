import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:quickr/Pages/detail.dart';

import '../Models/location_mock.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  QRScannerState createState() => QRScannerState();
}

class QRScannerState extends State<QRScanner> {
  String overlayText = "Scan!";
  bool camStarted = false;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    autoStart: false,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startCamera() {
    if (camStarted) {
      return;
    }

    controller.start().then((_) {
      if (mounted) {
        setState(() {
          camStarted = true;
        });
      }
    }).catchError((Object error, StackTrace stackTrace) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong! $error'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });
  }

  void onBarcodeDetect(BarcodeCapture barcodeCapture) {
    // var locations = context.watch<LocationsModel>();
    final barcode = barcodeCapture.barcodes.last;

    setState(() {
      overlayText = barcodeCapture.barcodes.last.displayValue ??
          barcode.rawValue ??
          'Barcode has no displayable value';
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            Details(location:  Provider.of<LocationsModel>(context, listen: false).getFromID(barcode.rawValue!)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Scan QR code"),
        backgroundColor: Theme.of(context).colorScheme.background.withAlpha(0),
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: camStarted
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: MobileScanner(
                            fit: BoxFit.contain,
                            onDetect: onBarcodeDetect,
                            overlay: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Text(
                                    overlayText,
                                    style: const TextStyle(
                                      backgroundColor: Colors.black26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller,
                            scanWindow: scanWindow,
                          ),
                        ),
                        CustomPaint(
                          painter: ScannerOverlay(scanWindow),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ValueListenableBuilder<TorchState>(
                                  valueListenable: controller.torchState,
                                  builder: (context, value, child) {
                                    final Color iconColor;

                                    switch (value) {
                                      case TorchState.off:
                                        iconColor = Colors.black;
                                        break;
                                      case TorchState.on:
                                        iconColor = Colors.yellow;
                                        break;
                                    }

                                    return IconButton(
                                      onPressed: () => controller.toggleTorch(),
                                      icon: Icon(
                                        Icons.flashlight_on,
                                        color: iconColor,
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  onPressed: () => controller.switchCamera(),
                                  icon: const Icon(
                                    Icons.cameraswitch_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text("Tap on Camera to activate QR Scanner"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  ScannerOverlay(this.scanWindow);

  final Rect scanWindow;
  final double borderRadius = 12.0;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    // Create a Paint object for the white border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Adjust the border width as needed

    // Calculate the border rectangle with rounded corners
// Adjust the radius as needed
    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // Draw the white border
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
