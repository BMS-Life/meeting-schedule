import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_booking_widget.dart' show CreateBookingWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class CreateBookingModel extends FlutterFlowModel<CreateBookingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for subject TextField widget.
  FocusNode? subjectFocusNode;
  TextEditingController? subjectTextController;
  String? Function(BuildContext, String?)? subjectTextControllerValidator;

  // State field(s) for bookerName TextField widget.
  FocusNode? bookerNameFocusNode;
  TextEditingController? bookerNameTextController;
  String? Function(BuildContext, String?)? bookerNameTextControllerValidator;

  // State field(s) for department TextField widget.
  FocusNode? departmentFocusNode;
  TextEditingController? departmentTextController;
  String? Function(BuildContext, String?)? departmentTextControllerValidator;

  // State field(s) for phone TextField widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;

  // State field(s) for attendeeCount TextField widget.
  FocusNode? attendeeCountFocusNode;
  TextEditingController? attendeeCountTextController;
  String? Function(BuildContext, String?)? attendeeCountTextControllerValidator;

  // State field(s) for note TextField widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;

  // State field(s) for room DropDown widget.
  String? roomDropDownValue;
  FormFieldController<String>? roomDropDownValueController;

  // State field(s) for date picker.
  DateTime? datePicked;

  // State field(s) for start time picker.
  DateTime? startTimePicked;

  // State field(s) for end time picker.
  DateTime? endTimePicked;

  // Equipment checkboxes
  bool projectorChecked = false;
  bool micChecked = false;
  bool whiteboardChecked = false;
  bool breakChecked = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
  }
}
