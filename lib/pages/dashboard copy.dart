// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rainfalldata/constant/constantfile.dart';
// import 'package:rainfalldata/controller/tapcontroller.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     GetxTapController controller = Get.put(GetxTapController());
//     controller.getalldata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     GetxTapController controller = Get.put(GetxTapController());
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 243, 233, 220),
//       body: GetBuilder<GetxTapController>(builder: (_) {
//         return controller.alldata == null
//             ? const Center(child: CircularProgressIndicator())
//             : Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: SafeArea(
//                     child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     const Column(
//                       children: [
//                         Text(
//                           'SUB-DIVISIONALLY RAINFALL DATA',
//                           style: TextStyle(
//                               letterSpacing: 0.7,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'FROM',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           '1901 - 2017',
//                           style: TextStyle(
//                               letterSpacing: 0.7,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const Text(
//                                 'Select Sub-Division:',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 50,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 20,
//                                   ),
//                                   child: GetBuilder<GetxTapController>(
//                                       builder: (_) {
//                                     return Card(
//                                       shape: customshape,
//                                       elevation: 3,
//                                       child: Container(
//                                         height: 35,
//                                         decoration: containerdecoration,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 10, right: 10),
//                                           child: Center(
//                                             child: DropdownSearch<String>(
//                                               dropdownButtonProps:
//                                                   const DropdownButtonProps(
//                                                       padding: EdgeInsets.zero,
//                                                       color: Colors.green),
//                                               selectedItem: controller
//                                                   .dropdownValueJobType,
//                                               popupProps: PopupProps.menu(
//                                                 containerBuilder:
//                                                     (context, popupWidget) {
//                                                   return ListView.builder(
//                                                       shrinkWrap: true,
//                                                       padding: EdgeInsets.zero,
//                                                       itemCount: controller
//                                                           .allsubdivision
//                                                           .length,
//                                                       itemBuilder:
//                                                           (context, i) {
//                                                         return SizedBox(
//                                                           height: 43,
//                                                           child: ListTile(
//                                                             onTap: () {
//                                                               controller
//                                                                   .changesubdivision(
//                                                                       i);

//                                                               Navigator.pop(
//                                                                   context);
//                                                             },
//                                                             minVerticalPadding:
//                                                                 0,
//                                                             dense: true,
//                                                             title: Text(controller
//                                                                 .allsubdivision[i]),
//                                                           ),
//                                                         );
//                                                       });
//                                                 },
//                                                 menuProps: const MenuProps(
//                                                     animationDuration: Duration(
//                                                         microseconds: 0),
//                                                     elevation: 10),
//                                                 constraints:
//                                                     BoxConstraints.tight(Size(
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                         130)),
//                                                 showSelectedItems: true,
//                                               ),
//                                               dropdownDecoratorProps:
//                                                   const DropDownDecoratorProps(
//                                                 textAlignVertical:
//                                                     TextAlignVertical.center,
//                                                 dropdownSearchDecoration:
//                                                     InputDecoration.collapsed(
//                                                   hintText: null,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             children: [
//                               const Text(
//                                 'Select Year:',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 50,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 20,
//                                   ),
//                                   child: GetBuilder<GetxTapController>(
//                                       builder: (_) {
//                                     return Card(
//                                       shape: customshape,
//                                       elevation: 3,
//                                       child: Container(
//                                         height: 35,
//                                         decoration: containerdecoration,
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               left: 10, right: 10),
//                                           child: Center(
//                                             child: DropdownSearch<String>(
//                                               dropdownButtonProps:
//                                                   const DropdownButtonProps(
//                                                       padding: EdgeInsets.zero,
//                                                       color: Colors.green),
//                                               selectedItem: controller
//                                                   .dropdownValueJobType,
//                                               popupProps: PopupProps.menu(
//                                                 containerBuilder:
//                                                     (context, popupWidget) {
//                                                   return ListView.builder(
//                                                       shrinkWrap: true,
//                                                       padding: EdgeInsets.zero,
//                                                       itemCount: controller
//                                                           .allsubdivision
//                                                           .length,
//                                                       itemBuilder:
//                                                           (context, i) {
//                                                         return SizedBox(
//                                                           height: 43,
//                                                           child: ListTile(
//                                                             onTap: () {
//                                                               controller
//                                                                   .changesubdivision(
//                                                                       i);

//                                                               Navigator.pop(
//                                                                   context);
//                                                             },
//                                                             minVerticalPadding:
//                                                                 0,
//                                                             dense: true,
//                                                             title: Text(controller
//                                                                 .allsubdivision[i]),
//                                                           ),
//                                                         );
//                                                       });
//                                                 },
//                                                 menuProps: const MenuProps(
//                                                     animationDuration: Duration(
//                                                         microseconds: 0),
//                                                     elevation: 10),
//                                                 constraints:
//                                                     BoxConstraints.tight(Size(
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                         130)),
//                                                 showSelectedItems: true,
//                                               ),
//                                               dropdownDecoratorProps:
//                                                   const DropDownDecoratorProps(
//                                                 textAlignVertical:
//                                                     TextAlignVertical.center,
//                                                 dropdownSearchDecoration:
//                                                     InputDecoration.collapsed(
//                                                   hintText: null,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )),
//               );
//       }),
//     );
//   }
// }
