// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

// class CameraViewer extends StatefulWidget {
//   CameraViewer({
//     super.key,
//     required this.onImage,
//     required this.customPaint,
//     // required this.facesInfo
//   });

//   Function(InputImage inputImage) onImage;
//   CustomPaint? customPaint;
//   // String? facesInfo;

//   @override
//   State<CameraViewer> createState() => _CameraViewerState();
// }

// class _CameraViewerState extends State<CameraViewer> {
//   bool _isControllerInitialized = false;
//   bool _isBusy = false;
//   late CameraController _cameraController;
//   late List<CameraDescription> _cameras;
//   late List<Face> _faces;

//   @override
//   void initState() {
//     super.initState();
//     print("onInit() method");
//     _initCamera();
//   }

//   //convert _cameraImage into readable format
//   Future<void> toInputImage(CameraImage cameraImage) async {
//     print("toInputImage() method");
//     final WriteBuffer allBytes = WriteBuffer();

//     for (final plane in cameraImage.planes) {
//       allBytes.putUint8List(plane.bytes);
//     }

//     final bytes = allBytes.done().buffer.asUint8List();
//     final Size imageSize =
//         Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());
//     final InputImageRotation imageRotation =
//         InputImageRotationValue.fromRawValue(_cameras[0].sensorOrientation)!;
//     final InputImageFormat imageFormat =
//         InputImageFormatValue.fromRawValue(cameraImage.format.raw)!;

//     final planeData = cameraImage.planes
//         .map((plane) => InputImagePlaneMetadata(
//             bytesPerRow: plane.bytesPerRow,
//             width: plane.width,
//             height: plane.height))
//         .toList();

//     final inputImageData = InputImageData(
//         size: imageSize,
//         imageRotation: imageRotation,
//         inputImageFormat: imageFormat,
//         planeData: planeData);

//     final InputImage inputImage =
//         InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

//     widget.onImage(inputImage);
//   }

//   Future<void> _initCamera() async {
//     //initialize _cameras
//     _cameras = await availableCameras();
//     //initializing _cameraController
//     _cameraController =
//         CameraController(_cameras[1], ResolutionPreset.max, enableAudio: false);
//     _cameraController.initialize().then((value) {
//       if (!mounted) {
//         return;
//       }
//       _isControllerInitialized = true;
//       //start stream
//       _cameraController.startImageStream(toInputImage);

//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     print("dispose() method");
//     _cameraController.stopImageStream();
//     // _cameraController.dispose();
//     // _faceDetector.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isControllerInitialized) {
//       return Container();
//     } else {
//       return Stack(
//         // fit: StackFit.expand,
//         children: [
//           SizedBox(
//               width: Get.width,
//               height: Get.height,
//               child: CameraPreview(_cameraController)),
//           // if (widget.facesInfo != null)
//           //   Center(
//           //     child: Container(
//           //       color: Colors.white,
//           //       padding: EdgeInsets.all(10),
//           //       child: Text(widget.facesInfo!),
//           //     ),
//           //   ),
//           // if (widget.customPaint != null) widget.customPaint!,
//         ],
//       );
//     }
//   }
// }

// // class CameraViewer extends StatelessWidget {
// //   const CameraViewer({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Obx(() {
// //       if (Get.find<scanController>(tag: 'scan_controller')
// //           .getIsControllerInitialized) {
// //         return SizedBox(
// //           height: Get.height,
// //           width: Get.width,
// //           child: CameraPreview(Get.find<scanController>(tag: 'scan_controller')
// //               .getCameraController),
// //         );
// //       } else {
// //         return Container();
// //       }
// //     });
// //   }
// // }
