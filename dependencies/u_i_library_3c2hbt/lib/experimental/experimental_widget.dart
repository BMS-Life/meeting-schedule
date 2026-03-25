import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/otp_widget.dart';
import '/display/dialog/dialog_image/dialog_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/illustration/medicine_shopping_confirm/medicine_shopping_confirm_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'experimental_model.dart';
export 'experimental_model.dart';

class ExperimentalWidget extends StatefulWidget {
  const ExperimentalWidget({super.key});

  static String routeName = 'experimental';
  static String routePath = '/experimental';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<ExperimentalWidget> createState() => _ExperimentalWidgetState();
}

class _ExperimentalWidgetState extends State<ExperimentalWidget> {
  late ExperimentalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExperimentalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToChartData(BarChartDataStruct(
        label: 'group a',
        yValues1: 20000.0,
        yValues2: 10000.0,
        yValues3: 3000.0,
      ));
      safeSetState(() {});
      _model.addToChartData(BarChartDataStruct(
        label: 'group b',
        yValues1: 30000.0,
        yValues2: 6000.0,
      ));
      safeSetState(() {});
      _model.addToDonutChartData(DonutChartDataStruct(
        xTitle: 'A',
        yValue: 40.0,
      ));
      safeSetState(() {});
      _model.addToDonutChartData(DonutChartDataStruct(
        xTitle: 'B',
        yValue: 60.0,
      ));
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.ibmPlexSansThaiLooped(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 500.0,
                  child: custom_widgets.DonutChart(
                    width: double.infinity,
                    height: 500.0,
                    radius: '100',
                    innerRadius: '50',
                    showLabels: true,
                    labelFormat: 'floating',
                    showPercentage: false,
                    showLegend: false,
                    enableExplode: false,
                    enableSemi: false,
                    chartData: _model.donutChartData,
                    chartColors: _model.chartColor,
                    tooltipPosition: TooltipPosition.pointer,
                    labelPosition: ChartDataLabelPosition.outside,
                  ),
                ),
                Container(
                  width: 393.0,
                  height: 852.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  child: wrapWithModel(
                    model: _model.otpModel,
                    updateCallback: () => safeSetState(() {}),
                    child: OtpWidget(
                      pinLenght: 4,
                      onCompleted: () async {},
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: DialogImageWidget(
                                description:
                                    'เภสัชกรได้ตรวจสอบและจัดเตรียมยาตามรายการของคุณเรียบร้อยแล้ว',
                                leftBtnColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                rightBtnBorderColor:
                                    FlutterFlowTheme.of(context).error,
                                title: 'รายการยาของคุณพร้อมแล้ว',
                                dialogBorderRadius: 24.0,
                                margin: 24.0,
                                titleSize: 20.0,
                                titleColor: Color(0xFF10AD37),
                                descriptionSize: 14.0,
                                descriptionColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                leftBtnText: 'กลับสู่หน้าแรก',
                                leftBtnTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                leftBtnTextSize: 14.0,
                                leftBtnBorder: 1.0,
                                leftBtnBorderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                rightBtnColor: Color(0xFF10AD37),
                                rightBtnText: 'ดูรายการยา',
                                rightBtnTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                rightBtnTextSize: 14.0,
                                rightBtnBorder: 0.0,
                                buttonRounded: 16.0,
                                dialogWidth: 400.0,
                                showDescription: true,
                                leftBtnAction: () async {
                                  Navigator.pop(context);
                                },
                                rightBtnAction: () async {
                                  Navigator.pop(context);
                                },
                                illustraion: () =>
                                    MedicineShoppingConfirmWidget(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    text: 'Open Dialog',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.ibmPlexSansThaiLooped(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 60.0))
                  .addToEnd(SizedBox(height: 120.0)),
            ),
          ),
        ),
      ),
    );
  }
}
