// import 'package:flutter/material.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:user_demo/view/main_screens/camera/camera_viewer.dart';

// class MyFaceDetector extends StatefulWidget {
//   const MyFaceDetector({super.key});

//   @override
//   State<MyFaceDetector> createState() => _MyFaceDetectorState();
// }

// class _MyFaceDetectorState extends State<MyFaceDetector> {
//   final FaceDetector _faceDetector = FaceDetector(
//       options: FaceDetectorOptions(
//     enableContours: true,
//     enableClassification: true,
//   ));
//   bool _canProcess = true;
//   bool _isBusy = false;
//   CustomPaint? _customPaint;
//   // String? faceInfo;

//   Future<void> processImage(InputImage inputImage) async {
//     print("detectFaces() method");
//     if (!_canProcess) return;
//     if (_isBusy) return;
//     _isBusy = true;
//     setState(() {});
//     final faces = await _faceDetector.processImage(inputImage);
//     // if (faces.isNotEmpty) {
//     //   setState(() {
//     //     faceInfo = "${faces[0].trackingId}";
//     //   });
//     // }
//     print("number of faces: ${faces.length}");
//     print("start paint");
//     //start paint
//     CustomPainter painter =
//         FaceDetectorPainter(inputImage.inputImageData!.size, faces);

//     _customPaint = CustomPaint(
//       painter: painter,
//     );

//     _isBusy = false;
//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _canProcess = false;
//     _faceDetector.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CameraViewer(
//       onImage: (inputImage) {
//         processImage(inputImage).then((value) {});
//       },
//       customPaint: _customPaint,
//       // facesInfo: faceInfo,
//     );
//   }
// }

// class FaceDetectorPainter extends CustomPainter {
//   final Size absoluteImageSize;
//   final List<Face> faces;

//   FaceDetectorPainter(this.absoluteImageSize, this.faces);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double scalex = size.width / absoluteImageSize.width;
//     final double scaley = size.height / absoluteImageSize.height;

//     final Paint paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0.2
//       ..color = Colors.red;

//     for (Face face in faces) {
//       canvas.drawRect(
//           Rect.fromLTRB(
//               absoluteImageSize.width - face.boundingBox.right * scalex,
//               face.boundingBox.top * scaley,
//               absoluteImageSize.width - face.boundingBox.left * scalex,
//               face.boundingBox.bottom * scaley),
//           paint);
//     }
//   }

//   @override
//   bool shouldRepaint(FaceDetectorPainter oldDelegate) {
//     throw oldDelegate.absoluteImageSize != absoluteImageSize ||
//         oldDelegate.faces != faces;
//   }
// }
