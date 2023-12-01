import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:rainfalldata/constant/visualtype.dart';
import 'package:rainfalldata/model/alldatamodel.dart';

class GetxTapController extends GetxController {
  RainfallData? alldata;
  final List _allsubdivision = [];
  List _allsearchresult = [];
  List _yearlist = [];
  List<double> _datalist = [];
  List<double>? _monthdatalist;
  List<Record> _allsubdivisiondata = [];
  visualtype _graphtype = visualtype.YEARLY;
  final ScrollController _scrollController = ScrollController();

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
  List get yearlist => _yearlist;
  List get allsearchresult => _allsearchresult;
  List<double> get datalist => _datalist;
  List<double>? get monthdatalist => _monthdatalist;

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

  void getsearchresult(
    String enteredKeyword,
  ) {
    print(enteredKeyword);
    List results = [];
    _allsearchresult = [];

    if (enteredKeyword.isEmpty) {
      results = _allsubdivision;
      update();
    } else {
      results = _allsubdivision
          .where((user) => user
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      update();
      print(results.toString());
    }
    _allsearchresult = results;
    update();

    // Refresh the UI
  }

  Future getalldata() async {
    print('fafafa');
    try {
      _allsearchresult = _allsubdivision;
      print(_allsearchresult.length);
      isDataLoading(true);
      final queryParameters = {
        "api-key": "579b464db66ec23bdd000001977a7a5e5d38400f5410ed97d4ba41a7",
        "format": "json",
        "limit": "4188"
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
        print(_allsearchresult.length.toString());
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

  void scrollToSelectedItem(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    double offset = renderBox.localToGlobal(Offset.zero).dy;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void changevisualtypre(
    visualtype visual,
  ) {
    if (visual.index == 1) {
      _isselectedmonthly = true;
      update();
    } else {
      _dropdownvalueyear = '';
      _monthdatalist = null;
      _isselectedmonthly = false;
      update();
    }
    _graphtype = visual;
    update();
  }

  void getallsubdivisiondata(String subdivisionname) {
    _allsubdivisiondata = [];
    _datalist = [];
    _yearlist = [];
    for (var element in alldata!.records) {
      if (element.subdivision == subdivisionname) {
        _allsubdivisiondata.add(element);
      }
    }

    for (var element in _allsubdivisiondata) {
      if (_yearlist.contains(double.parse(element.year))) {
        print("already exist");
      } else if (element.annual == 'NA') {
        _yearlist.add(element.year);
        _datalist.add(0.0);
      } else {
        _yearlist.add(element.year);
        _datalist.add(double.parse(element.annual));
      }
    }

    print(_allsubdivisiondata.toString());
  }

  void getyearfromdropdown(
    String year,
  ) {
    _dropdownvalueyear = year;
    print(year);

    _monthdatalist = [];
    for (var element in _allsubdivisiondata) {
      if (element.year == year) {
        _monthdatalist!.addAll([
          double.parse(element.jan),
          double.parse(element.feb),
          double.parse(element.mar),
          double.parse(element.apr),
          double.parse(element.may),
          double.parse(element.jun),
          double.parse(element.jul),
          double.parse(element.aug),
          double.parse(element.sep),
          double.parse(element.oct),
          double.parse(element.nov),
          double.parse(element.dec),
        ]);
        print('Year  Found');
      } else {
        print('Year Not Found');
      }
    }
    print(_monthdatalist.toString());
    print("Month Datalist Length :$_monthdatalist.length");
    update();
  }
}
