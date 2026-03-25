import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/form_field_controller.dart';
import '/room_booking/components/booking_done/booking_done_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_booking_model.dart';
export 'create_booking_model.dart';

class CreateBookingWidget extends StatefulWidget {
  const CreateBookingWidget({super.key});

  @override
  State<CreateBookingWidget> createState() => _CreateBookingWidgetState();
}

class _CreateBookingWidgetState extends State<CreateBookingWidget> {
  late CreateBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateBookingModel());

    _model.subjectTextController ??= TextEditingController();
    _model.subjectFocusNode ??= FocusNode();

    _model.bookerNameTextController ??= TextEditingController();
    _model.bookerNameFocusNode ??= FocusNode();

    _model.departmentTextController ??= TextEditingController();
    _model.departmentFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();

    _model.attendeeCountTextController ??= TextEditingController();
    _model.attendeeCountFocusNode ??= FocusNode();

    _model.noteTextController ??= TextEditingController();
    _model.noteFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  InputDecoration _buildInputDecoration(
      BuildContext context, String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts:
                !FlutterFlowTheme.of(context).labelMediumIsCustom,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).accent3,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).error,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: FlutterFlowTheme.of(context).error,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      contentPadding:
          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return MediaQuery.sizeOf(context).width;
          } else {
            return 640.0;
          }
        }(),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 24.0,
              color: Color(0x1E666666),
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'จองห้องประชุม',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: !FlutterFlowTheme.of(
                                            context)
                                        .titleSmallIsCustom,
                                  ),
                            ),
                            Text(
                              'กรอกรายละเอียดเพื่อจองห้องประชุม',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: !FlutterFlowTheme.of(
                                            context)
                                        .bodySmallIsCustom,
                                  ),
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 100.0,
                          buttonSize: 40.0,
                          fillColor: Color(0x1AE21C3D),
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).error,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent3,
                    ),

                    // Section: ข้อมูลการประชุม
                    Text(
                      'ข้อมูลการประชุม',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    SizedBox(height: 8.0),

                    // หัวข้อการประชุม
                    Text(
                      'หัวข้อการประชุม / วัตถุประสงค์',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: _model.subjectTextController,
                      focusNode: _model.subjectFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration:
                          _buildInputDecoration(context, 'ระบุหัวข้อการประชุม'),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      validator: _model.subjectTextControllerValidator
                          .asValidator(context),
                    ),
                    SizedBox(height: 16.0),

                    // ห้องประชุม dropdown
                    Text(
                      'ห้องประชุม',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 4.0),
                    FlutterFlowDropDown<String>(
                      controller: _model.roomDropDownValueController ??=
                          FormFieldController<String>(null),
                      options: [
                        'ห้องประชุม A (จุ 10 คน)',
                        'ห้องประชุม B (จุ 20 คน)',
                        'ห้องประชุม C (จุ 30 คน)',
                        'ห้องประชุม D (จุ 50 คน)',
                        'ห้องประชุม E (จุ 100 คน)',
                      ],
                      onChanged: (val) =>
                          safeSetState(() => _model.roomDropDownValue = val),
                      width: double.infinity,
                      height: 52.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                      hintText: 'เลือกห้องประชุม',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      borderColor: FlutterFlowTheme.of(context).accent3,
                      borderWidth: 1.0,
                      borderRadius: 16.0,
                      margin: EdgeInsetsDirectional.fromSTEB(
                          16.0, 0.0, 16.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    SizedBox(height: 16.0),

                    // วันที่ & เวลา
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'วันที่',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              InkWell(
                                onTap: () async {
                                  final datePickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                  );
                                  if (datePickedDate != null) {
                                    safeSetState(() {
                                      _model.datePicked = datePickedDate;
                                    });
                                  }
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          _model.datePicked != null
                                              ? dateTimeFormat(
                                                  "d MMM y",
                                                  _model.datePicked!,
                                                  )
                                              : 'เลือกวันที่',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: _model.datePicked != null
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'เวลาเริ่ม',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              InkWell(
                                onTap: () async {
                                  final timePicked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (timePicked != null) {
                                    safeSetState(() {
                                      _model.startTimePicked = DateTime(
                                        2024, 1, 1,
                                        timePicked.hour, timePicked.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          _model.startTimePicked != null
                                              ? dateTimeFormat(
                                                  "Hm",
                                                  _model.startTimePicked!,
                                                  )
                                              : 'เวลาเริ่ม',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: _model.startTimePicked !=
                                                        null
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'เวลาสิ้นสุด',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              InkWell(
                                onTap: () async {
                                  final timePicked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (timePicked != null) {
                                    safeSetState(() {
                                      _model.endTimePicked = DateTime(
                                        2024, 1, 1,
                                        timePicked.hour, timePicked.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 52.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          _model.endTimePicked != null
                                              ? dateTimeFormat(
                                                  "Hm",
                                                  _model.endTimePicked!,
                                                  )
                                              : 'เวลาสิ้นสุด',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: _model.endTimePicked !=
                                                        null
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    // จำนวนผู้เข้าร่วม
                    Text(
                      'จำนวนผู้เข้าร่วม',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: _model.attendeeCountTextController,
                      focusNode: _model.attendeeCountFocusNode,
                      autofocus: false,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      decoration: _buildInputDecoration(
                          context, 'ระบุจำนวนผู้เข้าร่วม'),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      validator: _model.attendeeCountTextControllerValidator
                          .asValidator(context),
                    ),
                    SizedBox(height: 24.0),

                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent3,
                    ),
                    SizedBox(height: 16.0),

                    // Section: ข้อมูลผู้จอง
                    Text(
                      'ข้อมูลผู้จอง',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    SizedBox(height: 8.0),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ชื่อผู้จอง',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              TextFormField(
                                controller: _model.bookerNameTextController,
                                focusNode: _model.bookerNameFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: _buildInputDecoration(
                                    context, 'ชื่อ-นามสกุล'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'แผนก/หน่วยงาน',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              TextFormField(
                                controller: _model.departmentTextController,
                                focusNode: _model.departmentFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: _buildInputDecoration(
                                    context, 'แผนก/หน่วยงาน'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    // เบอร์ติดต่อ
                    Text(
                      'เบอร์ติดต่อ',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: _model.phoneTextController,
                      focusNode: _model.phoneFocusNode,
                      autofocus: false,
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      decoration:
                          _buildInputDecoration(context, 'เบอร์โทรศัพท์'),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    SizedBox(height: 24.0),

                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent3,
                    ),
                    SizedBox(height: 16.0),

                    // Section: อุปกรณ์เพิ่มเติม
                    Text(
                      'อุปกรณ์ที่ต้องการ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    SizedBox(height: 8.0),

                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _buildEquipmentCheckbox(
                          context,
                          Icons.tv_rounded,
                          'โปรเจคเตอร์',
                          _model.projectorChecked,
                          (val) => safeSetState(
                              () => _model.projectorChecked = val ?? false),
                        ),
                        _buildEquipmentCheckbox(
                          context,
                          Icons.mic_rounded,
                          'ไมโครโฟน',
                          _model.micChecked,
                          (val) => safeSetState(
                              () => _model.micChecked = val ?? false),
                        ),
                        _buildEquipmentCheckbox(
                          context,
                          Icons.edit_note_rounded,
                          'ไวท์บอร์ด',
                          _model.whiteboardChecked,
                          (val) => safeSetState(
                              () => _model.whiteboardChecked = val ?? false),
                        ),
                        _buildEquipmentCheckbox(
                          context,
                          Icons.coffee_rounded,
                          'จัดเบรก',
                          _model.breakChecked,
                          (val) => safeSetState(
                              () => _model.breakChecked = val ?? false),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    // หมายเหตุ
                    Text(
                      'หมายเหตุเพิ่มเติม',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 4.0),
                    TextFormField(
                      controller: _model.noteTextController,
                      focusNode: _model.noteFocusNode,
                      autofocus: false,
                      obscureText: false,
                      maxLines: 3,
                      decoration: _buildInputDecoration(
                          context, 'ระบุหมายเหตุเพิ่มเติม (ถ้ามี)'),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                    SizedBox(height: 24.0),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'ยกเลิก',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: BookingDoneWidget(),
                                );
                              },
                            );
                          },
                          text: 'ยืนยันการจอง',
                          icon: Icon(
                            Icons.check_rounded,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipmentCheckbox(
    BuildContext context,
    IconData icon,
    String label,
    bool value,
    Function(bool?) onChanged,
  ) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: value
              ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
              : FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: value
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).accent3,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: value
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).secondaryText,
                size: 18.0,
              ),
              SizedBox(width: 6.0),
              Text(
                label,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).bodySmallFamily,
                      color: value
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: value ? FontWeight.w600 : FontWeight.normal,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodySmallIsCustom,
                    ),
              ),
              if (value) ...[
                SizedBox(width: 4.0),
                Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 16.0,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
