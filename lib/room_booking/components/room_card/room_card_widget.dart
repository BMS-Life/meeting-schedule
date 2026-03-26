import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'room_card_model.dart';
export 'room_card_model.dart';

class RoomCardWidget extends StatefulWidget {
  const RoomCardWidget({
    super.key,
    required this.roomName,
    required this.location,
    required this.equipment,
    this.isMeetingInProgress = false,
    this.currentMeetingName,
    this.timeSlots,
  });

  final String roomName;
  final String location;
  final List<String> equipment;

  /// true = กำลังประชุม (red dot), false = ไม่มีการประชุม (green dot)
  final bool isMeetingInProgress;

  /// ชื่อการประชุมที่กำลังดำเนินอยู่ (แสดงเมื่อ isMeetingInProgress = true)
  final String? currentMeetingName;

  /// สถานะช่วงเวลา: 0 = past/inactive, 1 = available, 2 = booked/occupied
  /// ถ้าไม่ส่งมาจะใช้ค่า default
  final List<int>? timeSlots;

  @override
  State<RoomCardWidget> createState() => _RoomCardWidgetState();
}

class _RoomCardWidgetState extends State<RoomCardWidget> {
  late RoomCardModel _model;

  static const List<String> _timeLabels = [
    '08:00',
    '09:00',
    '10:00',
    '11.00',
    '12.00',
    '13.00',
    '14.00',
    '15.00',
    '16.00',
    '17.00',
  ];

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateStr =
        'วันที่ ${now.day} ${_thaiMonth(now.month)} ${now.year + 543}';
    final timeStr = DateFormat('HH:mm').format(now) + ' น.';

    final slots = widget.timeSlots ?? List.generate(10, (_) => 1);

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      onEnter: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        safeSetState(() => _model.mouseRegionHovered = false);
      }),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          context.pushNamed(BookingDetailWidget.routeName);
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: FlutterFlowTheme.of(context).primaryBackground,
          elevation: valueOrDefault<double>(
            _model.mouseRegionHovered == true ? 8.0 : 0.0,
            0.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Color(0xFFE5E5E5),
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Room name & location
                  Text(
                    widget.roomName,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: Color(0xFF101828),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .bodyMediumIsCustom,
                        ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    widget.location,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          color: Color(0xFFA3A3A3),
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: !FlutterFlowTheme.of(context)
                              .labelSmallIsCustom,
                        ),
                  ),
                  SizedBox(height: 8.0),
                  // Time slots section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Date + status row (always side by side)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDateInfo(context, dateStr, timeStr),
                              Flexible(child: _buildStatusIndicator(context)),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          // Time slots grid
                          _buildTimeGrid(context, slots),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  // Equipment tags + action button
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      // Mobile: stack vertically
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: widget.equipment
                                .map((e) => _buildEquipmentTag(context, e))
                                .toList(),
                          ),
                          SizedBox(height: 12.0),
                          SizedBox(
                            width: double.infinity,
                            child: _buildActionButton(context),
                          ),
                        ],
                      ) as Widget;
                    } else {
                      // Desktop/Tablet: side by side
                      return Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: widget.equipment
                                  .map((e) => _buildEquipmentTag(context, e))
                                  .toList(),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          _buildActionButton(context),
                        ],
                      ) as Widget;
                    }
                  }(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateInfo(
      BuildContext context, String dateStr, String timeStr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateStr,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                color: Color(0xFF101828),
                fontSize: 12.0,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodySmallIsCustom,
              ),
        ),
        SizedBox(height: 4.0),
        Text(
          timeStr,
          style: FlutterFlowTheme.of(context).labelSmall.override(
                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                color: Color(0xFFA3A3A3),
                fontSize: 10.0,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).labelSmallIsCustom,
              ),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(BuildContext context) {
    final statusColor = widget.isMeetingInProgress
        ? Color(0xFFFF4405)
        : Color(0xFF16833E);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8.0),
        Flexible(
          child: Text(
            widget.isMeetingInProgress
                ? 'กำลังประชุม'
                : 'ไม่มีการประชุม',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  color: statusColor,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodySmallIsCustom,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(BookingDetailWidget.routeName);
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF194987),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Text(
            'ดูตารางห้อง & จองห้อง',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  color: Color(0xFFF5F8FB),
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodySmallIsCustom,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeGrid(BuildContext context, List<int> slots) {
    // Split into rows of 5
    final rows = <List<int>>[];
    for (var i = 0; i < _timeLabels.length; i += 5) {
      final end = (i + 5) > _timeLabels.length ? _timeLabels.length : i + 5;
      rows.add(List.generate(end - i, (j) => i + j));
    }

    return Column(
      children: rows.map((rowIndices) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: rowIndices == rows.last ? 0.0 : 8.0),
          child: Row(
            children: rowIndices.map((index) {
              final slotStatus =
                  index < slots.length ? slots[index] : 0;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: index == rowIndices.last ? 0.0 : 8.0),
                  child: _buildTimeSlot(
                      context, _timeLabels[index], slotStatus),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSlot(BuildContext context, String label, int status) {
    Color borderColor;
    Color textColor;

    switch (status) {
      case 1: // available - green
        borderColor = Color(0xFF21C45D);
        textColor = Color(0xFF16833E);
        break;
      case 2: // booked - red
        borderColor = Color(0xFFFF4405);
        textColor = Color(0xFFE62E05);
        break;
      default: // past/inactive - grey
        borderColor = Color(0xFFE5E5E5);
        textColor = Color(0xFFA3A3A3);
        break;
    }

    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 6.0, 4.0, 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            maxLines: 1,
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: textColor,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelSmallIsCustom,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildEquipmentTag(BuildContext context, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F8FB),
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: Color(0xFFF5F5F5),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Text(
          label,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                color: Color(0xFF101828),
                fontSize: 12.0,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodySmallIsCustom,
              ),
        ),
      ),
    );
  }

  String _thaiMonth(int month) {
    const months = [
      'มกราคม',
      'กุมภาพันธ์',
      'มีนาคม',
      'เมษายน',
      'พฤษภาคม',
      'มิถุนายน',
      'กรกฎาคม',
      'สิงหาคม',
      'กันยายน',
      'ตุลาคม',
      'พฤศจิกายน',
      'ธันวาคม',
    ];
    return months[month - 1];
  }
}
