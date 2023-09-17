// import 'package:flutter/material.dart';
// import 'package:user_demo/view/main_screens/camera/my_face_detector.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("camera screen")),
//       body: MyFaceDetector(),
//     );
//   }
// }

// // class CameraScreen extends StatefulWidget {
// //   CameraScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     //we want the controller to be created every time the widget build itself
// //     //and delete it whenever it is poped from the stack
// //     //we didn't create the instance in the Globalbindings, because if so, the controller will depend on the initialRoot (onClose() will not be called until the initialRoot is poped from the stack)
// //     Get.put(scanController(), tag: "scan_controller");
// //     return Scaffold(
// //       appBar: AppBar(title: Text("camera screen")),
// //       body: CameraViewer(),
// //     );
// //   }
// // }
