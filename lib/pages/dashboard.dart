import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainfalldata/constant/visualtype.dart';

import 'package:rainfalldata/controller/tapcontroller.dart';
import 'package:rainfalldata/pages/subdivsionpage.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    return Scaffold(
      body: GetBuilder<GetxTapController>(builder: (_) {
        return Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: const AssetImage('assets/images/bg.jpg'),
              //   fit: BoxFit.cover,
              //   colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(0.5), BlendMode.colorDodge),
              // ),

              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color.fromARGB(255, 171, 239, 250).withOpacity(0.5),

                const Color.fromARGB(255, 251, 251, 211),

                // Color.fromARGB(255, 250, 167, 161),
                // Colors.white
              ])),
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //       Color.fromARGB(255, 147, 236, 250),
          //       Color.fromARGB(255, 251, 251, 176),
          //       Color.fromARGB(255, 251, 251, 212),
          //       Color.fromARGB(255, 247, 225, 225),
          //       Color.fromARGB(255, 204, 244, 250),
          //       // Color.fromARGB(255, 250, 167, 161),
          //       // Colors.white
          //     ])),
          child: Obx(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            height: 43,
                            child: TextFormField(
                              controller: searchcontroller,
                              onChanged: (value) {
                                controller
                                    .getsearchresult(searchcontroller.text);
                              },
                              focusNode: FocusNode(),
                              autofocus: false,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 7),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                hintText: 'Search Sub-Divisions',
                              ),
                            ),
                          ),
                        ),
                        searchcontroller.text.isNotEmpty
                            ? const Text(
                                'SEARCH RESULTS :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    letterSpacing: 0.6),
                              )
                            : const Text(
                                'ALL SUB-DIVISIONS :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    letterSpacing: 0.6),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: controller.allsearchresult.isEmpty
                              ? Image.asset(
                                  'assets/images/no_result.gif',
                                  fit: BoxFit.cover,
                                )
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.allsearchresult.length,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 7),
                                      child: Card(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            onTap: () {
                                              controller.getallsubdivisiondata(
                                                  controller
                                                      .allsearchresult[i]);
                                              controller.changevisualtypre(
                                                  visualtype.YEARLY);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SubDivisionPage(
                                                              subdivisionname:
                                                                  controller
                                                                          .allsubdivision[
                                                                      i])));
                                            },
                                            dense: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              side: BorderSide(
                                                  color: Colors.black
                                                      .withOpacity(0.2)),
                                            ),
                                            title: Text(
                                              controller.allsearchresult[i],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 7, 79, 138),
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        )
                      ],
                    )),
                  ),
          ),
        );
      }),
    );
  }
}
