import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rainfalldata/constant/chart.dart';
import 'package:rainfalldata/constant/constantfile.dart';
import 'package:rainfalldata/constant/visualtype.dart';
import 'package:rainfalldata/controller/tapcontroller.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

@RoutePage()
class SubDivisionPage extends StatelessWidget {
  final String subdivisionname;
  const SubDivisionPage({super.key, required this.subdivisionname});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    List<String> years =
        List.generate(2016 - 1900 + 1, (index) => (1901 + index).toString());
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 171, 239, 250),
              Color.fromARGB(255, 251, 251, 211),

              Colors.white,
              // Color.fromARGB(255, 250, 167, 161),
              // Colors.white
            ])),
        child: SafeArea(
          child: GetBuilder<GetxTapController>(builder: (_) {
            return CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: width > 715 ? false : true,
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[50]!.withOpacity(0.6),
                        ),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'RAINFALL DATA VISUALIZATION',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sub-Division or State :',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              subdivisionname,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  activeColor: Colors.green,
                                  value: visualtype.YEARLY,
                                  groupValue: controller.graphtype,
                                  onChanged: (value) {
                                    controller.changevisualtypre(value!);
                                  }),
                              const Text('YEARLY'),
                            ],
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Row(
                            children: [
                              Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  activeColor: Colors.green,
                                  toggleable: true,
                                  value: visualtype.MONTHLY,
                                  groupValue: controller.graphtype,
                                  onChanged: (value) {
                                    controller.changevisualtypre(value!);
                                    if (controller.monthdatalist == null) {
                                      EasyLoading.showInfo(
                                          dismissOnTap: true,
                                          duration: const Duration(seconds: 3),
                                          'Select Year First !!!');
                                    }
                                  }),
                              const Text('MONTHLY'),
                            ],
                          )
                        ],
                      ),
                    ),
                    controller.isselectedmonthly
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 236, 250, 250),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 249, 167, 167))),
                              child: DropdownSearch<String>(
                                selectedItem:
                                    controller.dropdownvalueyear.isEmpty
                                        ? null
                                        : controller.dropdownvalueyear,
                                popupProps: PopupProps.menu(
                                  searchFieldProps: const TextFieldProps(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          constraints: BoxConstraints(
                                            maxHeight: 40,
                                          ))),
                                  constraints: BoxConstraints.tight(Size(
                                      MediaQuery.of(context).size.width,
                                      MediaQuery.of(context).size.height / 2)),
                                  showSearchBox: true,
                                  showSelectedItems: true,
                                ),
                                items: years,
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  baseStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  textAlignVertical: TextAlignVertical.center,
                                  dropdownSearchDecoration:
                                      InputDecoration.collapsed(
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.center,
                                    // labelStyle:
                                    //     TextStyle(fontWeight: FontWeight.bold),
                                    // labelText: "YEAR :",
                                    hintText: "Select Year",
                                  ),
                                ),
                                onChanged: (String? newValue) {
                                  controller.getyearfromdropdown(newValue!);

                                  if (controller.monthdatalist!.isEmpty) {
                                    Future.delayed(
                                            const Duration(milliseconds: 400))
                                        .whenComplete(() {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.white,
                                            title: Container(
                                              child: const Row(
                                                children: [
                                                  Center(
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.red,
                                                      size: 25,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Error',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            content: const Text(
                                                'Unfortunately, No Data Found For this Selected Year'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  // Close the alert dialog
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      // return EasyLoading.showError(
                                      //   dismissOnTap: true,
                                      //   duration:
                                      //       const Duration(seconds: 3),
                                      //   'No Data Found For this Year !!!');
                                    });
                                  }
                                },
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    width > 715
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Card(
                                elevation: 15,
                                child: SfCartesianChart(
                                  backgroundColor: Colors.white,
                                  title: ChartTitle(
                                      textStyle: const TextStyle(
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold),
                                      borderColor: Colors.black,
                                      text: controller.isselectedmonthly
                                          ? 'MONTHLY DATA VISUALIZATION'
                                          : 'ANUALLY DATA VISUALIZATION'),
                                  legend: const Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  enableAxisAnimation: true,
                                  plotAreaBackgroundColor:
                                      const Color.fromARGB(66, 199, 246, 240),
                                  series: <ChartSeries<ChartData, String>>[
                                    controller.isselectedmonthly
                                        ? ColumnSeries<ChartData, String>(
                                            onCreateRenderer: (ChartSeries<
                                                        ChartData, String>
                                                    series) =>
                                                _CustomColumnSeriesRenderer(),
                                            dataSource: List.generate(
                                              controller.isselectedmonthly
                                                  ? controller.monthdatalist ==
                                                              null ||
                                                          controller
                                                              .monthdatalist!
                                                              .isEmpty
                                                      ? 0
                                                      : months.length
                                                  : controller.yearlist.length,
                                              (index) => ChartData(
                                                  controller.isselectedmonthly
                                                      ? months[index]
                                                      : controller
                                                          .yearlist[index]
                                                          .toString(),
                                                  controller.isselectedmonthly
                                                      ? controller
                                                          .monthdatalist![index]
                                                      : controller
                                                          .datalist[index]),
                                            ),
                                            xValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.year,
                                            yValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.datas,
                                            name: 'Rainfall Data',
                                          )
                                        : LineSeries<ChartData, String>(
                                            dataSource: List.generate(
                                              controller.isselectedmonthly
                                                  ? controller.monthdatalist ==
                                                              null ||
                                                          controller
                                                              .monthdatalist!
                                                              .isEmpty
                                                      ? 0
                                                      : months.length
                                                  : controller.yearlist.length,
                                              (index) => ChartData(
                                                  controller.isselectedmonthly
                                                      ? months[index]
                                                      : controller
                                                          .yearlist[index]
                                                          .toString(),
                                                  controller.isselectedmonthly
                                                      ? controller
                                                          .monthdatalist![index]
                                                      : controller
                                                          .datalist[index]),
                                            ),
                                            xValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.year,
                                            yValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.datas,
                                            name: 'Rainfall Data',
                                          ),
                                  ],
                                  primaryXAxis: CategoryAxis(
                                      title: AxisTitle(
                                          text: controller.isselectedmonthly
                                              ? 'Month'
                                              : 'Year')),
                                  primaryYAxis: NumericAxis(
                                      title: AxisTitle(text: 'Rainfall Data')),
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 15,
                                child: SfCartesianChart(
                                  backgroundColor: Colors.white,
                                  title: ChartTitle(
                                      textStyle: const TextStyle(
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold),
                                      borderColor: Colors.black,
                                      text: controller.isselectedmonthly
                                          ? 'MONTHLY DATA VISUALIZATION'
                                          : 'ANUALLY DATA VISUALIZATION'),
                                  legend: const Legend(isVisible: true),
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  enableAxisAnimation: true,
                                  plotAreaBackgroundColor:
                                      const Color.fromARGB(66, 199, 246, 240),
                                  series: <ChartSeries<ChartData, String>>[
                                    controller.isselectedmonthly
                                        ? ColumnSeries<ChartData, String>(
                                            onCreateRenderer: (ChartSeries<
                                                        ChartData, String>
                                                    series) =>
                                                _CustomColumnSeriesRenderer(),
                                            dataSource: List.generate(
                                              controller.isselectedmonthly
                                                  ? controller.monthdatalist ==
                                                              null ||
                                                          controller
                                                              .monthdatalist!
                                                              .isEmpty
                                                      ? 0
                                                      : months.length
                                                  : controller.yearlist.length,
                                              (index) => ChartData(
                                                  controller.isselectedmonthly
                                                      ? months[index]
                                                      : controller
                                                          .yearlist[index]
                                                          .toString(),
                                                  controller.isselectedmonthly
                                                      ? controller
                                                          .monthdatalist![index]
                                                      : controller
                                                          .datalist[index]),
                                            ),
                                            xValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.year,
                                            yValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.datas,
                                            name: 'Rainfall Data',
                                          )
                                        : LineSeries<ChartData, String>(
                                            dataSource: List.generate(
                                              controller.isselectedmonthly
                                                  ? controller.monthdatalist ==
                                                              null ||
                                                          controller
                                                              .monthdatalist!
                                                              .isEmpty
                                                      ? 0
                                                      : months.length
                                                  : controller.yearlist.length,
                                              (index) => ChartData(
                                                  controller.isselectedmonthly
                                                      ? months[index]
                                                      : controller
                                                          .yearlist[index]
                                                          .toString(),
                                                  controller.isselectedmonthly
                                                      ? controller
                                                          .monthdatalist![index]
                                                      : controller
                                                          .datalist[index]),
                                            ),
                                            xValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.year,
                                            yValueMapper:
                                                (ChartData sales, _) =>
                                                    sales.datas,
                                            name: 'Rainfall Data',
                                          ),
                                  ],
                                  primaryXAxis: CategoryAxis(
                                      title: AxisTitle(
                                          text: controller.isselectedmonthly
                                              ? 'Month'
                                              : 'Year')),
                                  primaryYAxis: NumericAxis(
                                      title: AxisTitle(
                                          text: 'Rainfall Data in (mm)')),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}

class _CustomColumnSeriesRenderer extends ColumnSeriesRenderer {
  _CustomColumnSeriesRenderer();

  @override
  ColumnSegment createSegment() {
    return _ColumnCustomPainter();
  }
}

class _ColumnCustomPainter extends ColumnSegment {
  final List<Color> colorList = [
    const Color.fromRGBO(135, 211, 124, 1),
    const Color.fromRGBO(192, 108, 132, 1),
    Colors.red,
    const Color.fromRGBO(248, 177, 149, 1),
    Colors.blue,
    const Color.fromRGBO(234, 128, 252, 1),
    const Color.fromRGBO(220, 203, 174, 1),
    const Color.fromRGBO(234, 175, 200, 1),
    const Color.fromRGBO(46, 68, 94, 1),
    const Color.fromRGBO(253, 253, 150, 1),
    const Color.fromRGBO(165, 80, 109, 1),
    const Color.fromRGBO(56, 173, 169, 1),
  ];

  // final List<Color> colorList = [
  //   const Color.fromRGBO(53, 92, 125, 1),
  //   const Color.fromRGBO(192, 108, 132, 1),
  //   const Color.fromRGBO(246, 114, 128, 1),
  //   const Color.fromRGBO(248, 177, 149, 1),
  //   const Color.fromRGBO(116, 180, 155, 1),
  //   const Color.fromRGBO(88, 140, 126, 1),
  //   const Color.fromRGBO(220, 203, 174, 1),
  //   const Color.fromRGBO(234, 175, 200, 1),
  //   const Color.fromRGBO(46, 68, 94, 1),
  //   const Color.fromRGBO(253, 253, 150, 1),
  //   const Color.fromRGBO(165, 80, 109, 1),
  //   const Color.fromRGBO(56, 173, 169, 1),
  //   const Color.fromRGBO(82, 45, 128, 1),
  //   const Color.fromRGBO(234, 128, 252, 1),
  //   const Color.fromRGBO(135, 211, 124, 1),
  //   const Color.fromRGBO(184, 110, 118, 1),
  // ];

  @override
  int get currentSegmentIndex => super.currentSegmentIndex!;

  @override
  Paint getFillPaint() {
    final Paint customerFillPaint = Paint();
    customerFillPaint.isAntiAlias = false;
    customerFillPaint.color = colorList[currentSegmentIndex];
    customerFillPaint.style = PaintingStyle.fill;
    return customerFillPaint;
  }
}
