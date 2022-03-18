import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:seven_food/data/cubit/qr_cubit/qr_cubit.dart';
import 'package:seven_food/presentation/screens/main/bottom_nav_bar_pages/qr_item/qr_by_code_page.dart';
import 'package:seven_food/presentation/screens/main/fridge_pages/fridge_page.dart';
import 'package:seven_food/utils/utils.dart';

class QrCameraPage extends StatefulWidget {
  static String id = "/qr_camera_page";

  const QrCameraPage({Key? key}) : super(key: key);

  @override
  _QrCameraPageState createState() => _QrCameraPageState();
}

class _QrCameraPageState extends State<QrCameraPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool validation = false;
  late int fridgeId;

  @override
  Widget build(BuildContext context) {

    return LoaderOverlay(
      child: BlocConsumer<QrCubit,QrState>(
        listener: (BuildContext context, state) {
          if(state is QrStateLoading){
            setState(() {
              context.loaderOverlay.show();
            });
          }else if(state is QrStateLoaded){
            setState(() {
              context.loaderOverlay.hide();
            });
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              controller?.dispose();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FridgePage(fridgeId: fridgeId,)));
            });
          }else if(state is QrStateError){
            setState(() {
              context.loaderOverlay.hide();
            });
            buildShowError(context, state.message);
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                QRView(
                  overlay: QrScannerOverlayShape(
                    borderRadius: 15,
                    borderColor: Colors.white,
                    borderWidth: 10,
                    borderLength: 145,
                  ),
                  key: qrKey,
                  onPermissionSet: _onPermissionSet,
                  onQRViewCreated: _onQRViewCreated,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 + 125,
                  child: Container(
                    color: Colors.transparent,
                    child: const Text(
                      "Наведите камеру на QR-код",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      const Text(
                        "Если нет возможность сканировать QR, то введите вручную код аппарата",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller?.pauseCamera();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QrByCodePage(),),);
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        height: 56,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        child: const Text(
                          "Ввести код",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                    title: const Text("Скан QR-кода"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ],
            ),
          );

        },

      ),


    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        if (result?.code?.length == 5) {
          validation = true;
          // context.loaderOverlay.show();
        }
      });
      controller.pauseCamera();
      if(validation ==true){
        fridgeId = int.parse(result!.code!);
        BlocProvider.of<QrCubit>(context).openFridge(int.parse(result!.code!));
      }
    });
  }

  void _onPermissionSet(QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller?.pauseCamera();
    super.dispose();
  }
}
