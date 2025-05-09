// import 'package:flutter/material.dart';
//
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   List<String> cartItems = ['Item 1', 'Item 2', 'Item 3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('سلة التسوق'),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           return Dismissible(
//             key: Key(cartItems[index]),
//             direction: DismissDirection.endToStart, // السحب من اليمين لليسار
//             onDismissed: (direction) {
//               // عندما يتم السحب، نعرض مربع حوار لتأكيد الحذف
//               _showDeleteConfirmation(context, index);
//             },
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.only(right: 20),
//               child: Icon(Icons.delete, color: Colors.white),
//             ),
//             child: ListTile(
//               title: Text(cartItems[index]),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // دالة لعرض مربع التأكيد للحذف
//   void showDeleteConfirmation(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('تأكيد الحذف'),
//           content: Text('هل أنت متأكد أنك تريد حذف هذا العنصر؟'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 // إذا ضغط المستخدم على "لا"، نغلق المربع دون حذف
//                 Navigator.of(context).pop();
//               },
//               child: Text('لا'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // إذا ضغط المستخدم على "نعم"، نقوم بحذف العنصر
//                 setState(() {
//                   cartItems.removeAt(index);
//                 });
//                 Navigator.of(context).pop(); // نغلق المربع
//               },
//               child: Text('نعم'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: CartPage(),
//   ));
// }
