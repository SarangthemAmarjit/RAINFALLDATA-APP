import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainfalldata/constant/visualtype.dart';
import 'package:rainfalldata/controller/tapcontroller.dart';

class SubDivisionPage extends StatelessWidget {
  final String subdivisionname;
  const SubDivisionPage({super.key, required this.subdivisionname});

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());
    List<String> years =
        List.generate(2017 - 1900 + 1, (index) => (1900 + index).toString());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<GetxTapController>(builder: (_) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                subdivisionname,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.orange[50],
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'RAINFALL DATA VISUALIZATION',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: RadioListTile(
                          activeColor: Colors.green,
                          title: const Text(
                            "YEARLY",
                          ),
                          value: visualtype.YEARLY,
                          groupValue: controller.graphtype,
                          onChanged: (value) {
                            controller.changevisualtypre(value!);
                          }),
                    ),
                    Flexible(
                      child: RadioListTile(
                          activeColor: Colors.green,
                          toggleable: true,
                          title: const Text(
                            "MONTHLY",
                          ),
                          value: visualtype.MONTHLY,
                          groupValue: controller.graphtype,
                          onChanged: (value) {
                            controller.changevisualtypre(value!);
                          }),
                    ),
                  ],
                ),
              ),
              controller.isselectedmonthly
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 250, 250),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 249, 167, 167))),
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            searchFieldProps: const TextFieldProps(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    constraints: BoxConstraints(
                                      maxHeight: 40,
                                    ))),
                            constraints:
                                BoxConstraints.tight(const Size(400, 250)),
                            showSearchBox: true,
                            showSelectedItems: true,
                          ),
                          items: years,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "YEAR :",
                              hintText: "Select Year",
                            ),
                          ),
                          onChanged: (String? newValue) {
                            controller.getyearfromdropdown(newValue!);
                          },
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          );
        }),
      ),
    );
  }
}
