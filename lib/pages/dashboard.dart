import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rainfalldata/controller/tapcontroller.dart';
import 'package:rainfalldata/pages/subdivsionpage.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SafeArea(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'SUB-DIVISIONALLY RAINFALL DATA',
                            style: TextStyle(
                                letterSpacing: 0.7,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'FROM',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '1901 - 2017',
                            style: TextStyle(
                                letterSpacing: 0.7,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'ALL SUB-DIVISIONS :',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          letterSpacing: 0.6),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.allsubdivision.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: ListTile(
                              onTap: () {
                                controller.getallsubdivisiondata(
                                    controller.allsubdivision[i]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubDivisionPage(
                                            subdivisionname:
                                                controller.allsubdivision[i])));
                              },
                              dense: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                              tileColor: Colors.green[50],
                              title: Text(
                                controller.allsubdivision[i],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 7, 79, 138),
                                    fontSize: 16),
                              ),
                            ),
                          );
                        })
                  ],
                )),
              ),
      ),
    );
  }
}
