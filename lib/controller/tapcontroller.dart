import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:rainfalldata/constant/visualtype.dart';
import 'package:rainfalldata/model/alldatamodel.dart';

class GetxTapController extends GetxController {
  RainfallData? alldata;
  final List _allsubdivision = [];
  final List _allsubdivisiondata = [];
  visualtype _graphtype = visualtype.YEARLY;

  String _dropdownValueJobType = '';
  var isDataLoading = false.obs;
  bool _isselectedmonthly = false;
  String _dropdownvalueyear = '';

  bool get isselectedmonthly => _isselectedmonthly;
  visualtype get graphtype => _graphtype;
  List get allsubdivision => _allsubdivision;
  List get allsubdivisiondata => _allsubdivisiondata;
  String get dropdownValueJobType => _dropdownValueJobType;
  String get dropdownvalueyear => _dropdownvalueyear;

  @override
  Future<void> onInit() async {
    super.onInit();
    getalldata();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  Future getalldata() async {
    print('fafafa');
    try {
      isDataLoading(true);
      final queryParameters = {
        "api-key": "579b464db66ec23bdd000001977a7a5e5d38400f5410ed97d4ba41a7",
        "format": "json",
        "limit": "1000"
      };

      final response = await http.get(
        Uri.https('api.data.gov.in',
            '/resource/8e0bd482-4aba-4d99-9cb9-ff124f6f1c2f', queryParameters),
      );

      if (response.statusCode == 200) {
        var users = rainfallDataFromJson(response.body);

        alldata = users;
        for (var element in users.records) {
          if (_allsubdivision.contains(element.subdivision)) {
            print('already exist');
          } else {
            _allsubdivision.add(element.subdivision);
          }
        }
        print(_allsubdivision.toString());
        _dropdownValueJobType = _allsubdivision.first;
        update();

        print('Successfully get Data');
      } else {
        print('Failed to Getdata.');
      }
      return null;
    } catch (e) {
      print(e.toString());
    } finally {
      isDataLoading(false);
    }
  }

  void changesubdivision(
    int i,
  ) {
    _dropdownValueJobType = _allsubdivision[i];
    update();
  }

  void changevisualtypre(
    visualtype visual,
  ) {
    if (visual.index == 1) {
      _isselectedmonthly = true;
      update();
    } else {
      _isselectedmonthly = false;
      update();
    }
    _graphtype = visual;
    update();
  }

  void getallsubdivisiondata(String subdivisionname) {
    for (var element in alldata!.records) {
      if (element.subdivision == subdivisionname) {
        _allsubdivisiondata.add(element);
      }
    }
    print(_allsubdivisiondata.toString());
  }

  void getyearfromdropdown(
    String year,
  ) {
    _dropdownvalueyear = year;
    update();
  }
}
