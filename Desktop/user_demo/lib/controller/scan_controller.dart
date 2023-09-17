// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:image/image.dart' as img;

// class scanController extends GetxController {
//   RxBool _isControllerInitialized = RxBool(false);
//   RxBool _isStreaming = RxBool(false);
//   late CameraController _cameraController;
//   late List<CameraDescription> _cameras;
//   late FaceDetectorOptions _options;
//   late FaceDetector _faceDetector;
//   late List<Face> _faces;

//   bool get getIsControllerInitialized => _isControllerInitialized.value;
//   CameraController get getCameraController => _cameraController;

//   Future<void> _initCamera() async {
//     //initialize _cameras
//     _cameras = await availableCameras();
//     //initializing _cameraController
//     _cameraController =
//         CameraController(_cameras[1], ResolutionPreset.max, enableAudio: false);
//     _cameraController.initialize().then((value) {
//       _isControllerInitialized.value = true;
//       //start streaming
//       _cameraController.startImageStream((frame) {
//         _isStreaming.value = true;
//         //get frames
//         final CameraImage cameraImage = frame;
//         //convert frames (cameraImage) into suitable input image
//         final inputImage = toInputImage(cameraImage);
//         print("image converted");
//         //detect faces
//         detectFaces(inputImage);
//         //statrt paint

//         print("height: ${cameraImage.height}");
//       });

//       print("after stream");
//     }).catchError((Object e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case "CameraAccessDenied":
//             print("camera access denied exception...");
//             break;
//           default:
//             print("other exception...");
//             break;
//         }
//       }
//     });
//   }

//   //convert _cameraImage into readable format
//   InputImage toInputImage(CameraImage cameraImage) {
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

//     return InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
//   }

//   Future<void> detectFaces(InputImage inputImage) async {
//     _options = FaceDetectorOptions();
//     _faceDetector = FaceDetector(options: _options);
//     _faceDetector.processImage(inputImage).then((results) {
//       _faces = results;

//       print("number of faces: ${results.length}");

//       //start paint
//       // CustomPainter painter =
//       //     FaceDetectorPainter(inputImage.inputImageData!.size, _faces);

//       // CustomPaint(
//       //   painter: painter,
//       // );
//     });
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     print("onInit() method");
//     _initCamera();
//   }

//   //onClose() is called when the root (CameraScreen) is poped from the stack
//   @override
//   void onClose() {
//     print("onClose() method");
//     _cameraController.stopImageStream();
//     _faceDetector.close();
//     super.dispose();
//   }
// }
