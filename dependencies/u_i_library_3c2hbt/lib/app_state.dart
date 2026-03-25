import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<ColumnChartDataStruct> _columnChartData = [];
  List<ColumnChartDataStruct> get columnChartData => _columnChartData;
  set columnChartData(List<ColumnChartDataStruct> value) {
    _columnChartData = value;
  }

  void addToColumnChartData(ColumnChartDataStruct value) {
    columnChartData.add(value);
  }

  void removeFromColumnChartData(ColumnChartDataStruct value) {
    columnChartData.remove(value);
  }

  void removeAtIndexFromColumnChartData(int index) {
    columnChartData.removeAt(index);
  }

  void updateColumnChartDataAtIndex(
    int index,
    ColumnChartDataStruct Function(ColumnChartDataStruct) updateFn,
  ) {
    columnChartData[index] = updateFn(_columnChartData[index]);
  }

  void insertAtIndexInColumnChartData(int index, ColumnChartDataStruct value) {
    columnChartData.insert(index, value);
  }

  List<DonutChartDataStruct> _donutChartData = [];
  List<DonutChartDataStruct> get donutChartData => _donutChartData;
  set donutChartData(List<DonutChartDataStruct> value) {
    _donutChartData = value;
  }

  void addToDonutChartData(DonutChartDataStruct value) {
    donutChartData.add(value);
  }

  void removeFromDonutChartData(DonutChartDataStruct value) {
    donutChartData.remove(value);
  }

  void removeAtIndexFromDonutChartData(int index) {
    donutChartData.removeAt(index);
  }

  void updateDonutChartDataAtIndex(
    int index,
    DonutChartDataStruct Function(DonutChartDataStruct) updateFn,
  ) {
    donutChartData[index] = updateFn(_donutChartData[index]);
  }

  void insertAtIndexInDonutChartData(int index, DonutChartDataStruct value) {
    donutChartData.insert(index, value);
  }

  List<MultipleSelectionListStruct> _multipleSelectionList = [];
  List<MultipleSelectionListStruct> get multipleSelectionList =>
      _multipleSelectionList;
  set multipleSelectionList(List<MultipleSelectionListStruct> value) {
    _multipleSelectionList = value;
  }

  void addToMultipleSelectionList(MultipleSelectionListStruct value) {
    multipleSelectionList.add(value);
  }

  void removeFromMultipleSelectionList(MultipleSelectionListStruct value) {
    multipleSelectionList.remove(value);
  }

  void removeAtIndexFromMultipleSelectionList(int index) {
    multipleSelectionList.removeAt(index);
  }

  void updateMultipleSelectionListAtIndex(
    int index,
    MultipleSelectionListStruct Function(MultipleSelectionListStruct) updateFn,
  ) {
    multipleSelectionList[index] = updateFn(_multipleSelectionList[index]);
  }

  void insertAtIndexInMultipleSelectionList(
      int index, MultipleSelectionListStruct value) {
    multipleSelectionList.insert(index, value);
  }

  List<LineChartStruct> _splineChartData = [
    LineChartStruct.fromSerializableMap(jsonDecode(
        '{\"xTitle\":\"Hello World\",\"yValue1\":\"0.0\",\"yValue2\":\"0.0\",\"yValue3\":\"0.0\",\"yValue4\":\"0.0\",\"yValue5\":\"0.0\"}'))
  ];
  List<LineChartStruct> get splineChartData => _splineChartData;
  set splineChartData(List<LineChartStruct> value) {
    _splineChartData = value;
  }

  void addToSplineChartData(LineChartStruct value) {
    splineChartData.add(value);
  }

  void removeFromSplineChartData(LineChartStruct value) {
    splineChartData.remove(value);
  }

  void removeAtIndexFromSplineChartData(int index) {
    splineChartData.removeAt(index);
  }

  void updateSplineChartDataAtIndex(
    int index,
    LineChartStruct Function(LineChartStruct) updateFn,
  ) {
    splineChartData[index] = updateFn(_splineChartData[index]);
  }

  void insertAtIndexInSplineChartData(int index, LineChartStruct value) {
    splineChartData.insert(index, value);
  }

  bool _isScrolling = false;
  bool get isScrolling => _isScrolling;
  set isScrolling(bool value) {
    _isScrolling = value;
  }

  List<FilterMenuStruct> _multipleFilter = [];
  List<FilterMenuStruct> get multipleFilter => _multipleFilter;
  set multipleFilter(List<FilterMenuStruct> value) {
    _multipleFilter = value;
  }

  void addToMultipleFilter(FilterMenuStruct value) {
    multipleFilter.add(value);
  }

  void removeFromMultipleFilter(FilterMenuStruct value) {
    multipleFilter.remove(value);
  }

  void removeAtIndexFromMultipleFilter(int index) {
    multipleFilter.removeAt(index);
  }

  void updateMultipleFilterAtIndex(
    int index,
    FilterMenuStruct Function(FilterMenuStruct) updateFn,
  ) {
    multipleFilter[index] = updateFn(_multipleFilter[index]);
  }

  void insertAtIndexInMultipleFilter(int index, FilterMenuStruct value) {
    multipleFilter.insert(index, value);
  }

  AvatarSizeStruct _avatar =
      AvatarSizeStruct.fromSerializableMap(jsonDecode('{\"size\":\"sm\"}'));
  AvatarSizeStruct get avatar => _avatar;
  set avatar(AvatarSizeStruct value) {
    _avatar = value;
  }

  void updateAvatarStruct(Function(AvatarSizeStruct) updateFn) {
    updateFn(_avatar);
  }

  List<BarChartDataStruct> _barChartData = [];
  List<BarChartDataStruct> get barChartData => _barChartData;
  set barChartData(List<BarChartDataStruct> value) {
    _barChartData = value;
  }

  void addToBarChartData(BarChartDataStruct value) {
    barChartData.add(value);
  }

  void removeFromBarChartData(BarChartDataStruct value) {
    barChartData.remove(value);
  }

  void removeAtIndexFromBarChartData(int index) {
    barChartData.removeAt(index);
  }

  void updateBarChartDataAtIndex(
    int index,
    BarChartDataStruct Function(BarChartDataStruct) updateFn,
  ) {
    barChartData[index] = updateFn(_barChartData[index]);
  }

  void insertAtIndexInBarChartData(int index, BarChartDataStruct value) {
    barChartData.insert(index, value);
  }
}
