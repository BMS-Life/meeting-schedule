import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'booking_detail_widget.dart' show BookingDetailWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BookingDetailModel extends FlutterFlowModel<BookingDetailWidget> {
  // Model for Sidebar component.
  late SidebarModel sidebarModel;

  // Calendar
  DateTime selectedDate = DateTime.now();
  DateTime focusedMonth = DateTime.now();

  // View mode: 0 = day, 1 = week
  int viewMode = 1;

  // Form fields
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;

  FocusNode? bookerNameFocusNode;
  TextEditingController? bookerNameTextController;

  FocusNode? departmentFocusNode;
  TextEditingController? departmentTextController;

  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;

  FocusNode? attendeeCountFocusNode;
  TextEditingController? attendeeCountTextController;

  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;

  // Break & Meal options
  // Break: null = not selected, 'morning' = เบรคเช้า, 'afternoon' = เบรคบ่าย
  String? selectedBreak;
  bool? wantsDrink;

  // Lunch: null = not selected, true = รับ, false = ไม่รับ
  bool? wantsLunch;
  FocusNode? allergyFocusNode;
  TextEditingController? allergyTextController;

  // Equipment
  Set<String> selectedEquipment = {};

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    subjectFocusNode?.dispose();
    subjectTextController?.dispose();
    bookerNameFocusNode?.dispose();
    bookerNameTextController?.dispose();
    departmentFocusNode?.dispose();
    departmentTextController?.dispose();
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
    attendeeCountFocusNode?.dispose();
    attendeeCountTextController?.dispose();
    noteFocusNode?.dispose();
    noteTextController?.dispose();
    allergyFocusNode?.dispose();
    allergyTextController?.dispose();
  }
}
