// import 'package:flutter/material.dart';

// class DataClass {
//   String label;
//   double price;
//   DataClass(this.label, this.price);
// }

// class Test extends StatelessWidget {
//   List widgets = [];
//   List<DataClass> data = [];
//   Test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     for (int i = 0; i <= 100; i++) {
//       widgets.add(Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.red,
//           ),
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.greenAccent,
//           ),
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.amber,
//           ),
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.blue,
//           ),
//           Container(
//             width: double.infinity,
//             height: 100,
//             color: Colors.pink,
//           ),
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.purple,
//           ),
//           Container(
//             width: double.infinity,
//             height: 140,
//             color: Colors.cyan,
//           ),
//         ],
//       ));
//       data.add(DataClass("title$i", i.toDouble()));
//     }
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: Text(
//             ("Person"),
//           ),
//         ),
//         body: ListView.separated(
//           itemCount: widgets.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Text(
//                   data[index].label,
//                 ),
//               ],
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return Divider();
//           },
//         ));
//   }
// }
