// /// Flutter code sample for Stepper
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//
//   const MyApp({
//     Key key,
//   }) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key key}) : super(key: key);
//
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//       currentStep: _index,
//       onStepCancel: () {
//         if (_index > 0) {
//           setState(() {
//             _index -= 1;
//           });
//         }
//       },
//       onStepContinue: () {
//         if (_index <= 0) {
//           setState(() {
//             _index += 1;
//           });
//         }
//       },
//       onStepTapped: (int index) {
//         setState(() {
//           _index = index;
//         });
//       },
//       steps: <Step>[
//         Step(
//           title: const Text('Step 1 title'),
//           content: Container(
//               alignment: Alignment.centerLeft,
//               child: const Text('Content for Step 1')),
//         ),
//         const Step(
//           title: Text('Step 2 title'),
//           content: Text('Content for Step 2'),
//         ),
//       ],
//     );
//   }
// }