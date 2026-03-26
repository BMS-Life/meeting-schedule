import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/room_booking/components/booking_done/booking_done_widget.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'booking_detail_model.dart';
export 'booking_detail_model.dart';

class BookingDetailWidget extends StatefulWidget {
  const BookingDetailWidget({super.key});

  static String routeName = 'booking-detail';
  static String routePath = '/bookingDetail';

  @override
  State<BookingDetailWidget> createState() => _BookingDetailWidgetState();
}

class _BookingDetailWidgetState extends State<BookingDetailWidget> {
  late BookingDetailModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Time slots: 24 hours (00.00 - 23.00)
  // Room data
  static const List<Map<String, dynamic>> _rooms = [
    {
      'name': 'ห้องประชุมที่ 1',
      'location': 'อาคารเหล่าธงสิงห์ ห้อง 109',
      'equipment': ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
    },
    {
      'name': 'ห้องประชุมที่ 2',
      'location': 'อาคารเหล่าธงสิงห์ ห้องอาหาร',
      'equipment': ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
    },
  ];

  Map<String, dynamic> get _currentRoom => _rooms[_model.selectedRoomIndex];

  static const List<String> _timeLabels = [
    '00.00', '01.00', '02.00', '03.00', '04.00', '05.00',
    '06.00', '07.00', '08.00', '09.00', '10.00', '11.00',
    '12.00', '13.00', '14.00', '15.00', '16.00', '17.00',
    '18.00', '19.00', '20.00', '21.00', '22.00', '23.00',
  ];

  // Form validation errors (key = field name, value = error message)
  Map<String, String?> _formErrors = {};

  // Hover state for showing booking button
  int? _hoveredSlotIndex;
  DateTime? _hoveredSlotDate;

  // Range selection state: first click sets start, second click sets end
  int? _selectionStartSlot;
  DateTime? _selectionStartDate;

  // Computed selection range (min/max of start and hovered)
  int? get _rangeStart {
    if (_selectionStartSlot == null || _hoveredSlotIndex == null) return _selectionStartSlot;
    if (_selectionStartDate != _hoveredSlotDate) return _selectionStartSlot;
    return _selectionStartSlot! < _hoveredSlotIndex!
        ? _selectionStartSlot
        : _hoveredSlotIndex;
  }

  int? get _rangeEnd {
    if (_selectionStartSlot == null || _hoveredSlotIndex == null) return _selectionStartSlot;
    if (_selectionStartDate != _hoveredSlotDate) return _selectionStartSlot;
    return _selectionStartSlot! > _hoveredSlotIndex!
        ? _selectionStartSlot! + 1
        : _hoveredSlotIndex! + 1;
  }

  bool _isSlotInSelection(DateTime date, int slotIndex) {
    if (_selectionStartSlot == null || _selectionStartDate == null) return false;
    if (date.year != _selectionStartDate!.year ||
        date.month != _selectionStartDate!.month ||
        date.day != _selectionStartDate!.day) return false;
    final start = _rangeStart ?? _selectionStartSlot!;
    final end = _rangeEnd ?? (_selectionStartSlot! + 1);
    return slotIndex >= start && slotIndex < end;
  }

  bool _rangeOverlapsBooking(DateTime date, int startSlot, int endSlot) {
    final bookings = _getBookingsForDate(date);
    return bookings.any((b) {
      final bStart = b['startSlot'] as int;
      final bEnd = b['endSlot'] as int;
      return startSlot < bEnd && endSlot > bStart;
    });
  }

  void _clearSelection() {
    _selectionStartSlot = null;
    _selectionStartDate = null;
  }

  void _handleSlotTap(BuildContext context, DateTime date, int slotIndex) {
    if (_selectionStartSlot == null ||
        _selectionStartDate == null ||
        date.year != _selectionStartDate!.year ||
        date.month != _selectionStartDate!.month ||
        date.day != _selectionStartDate!.day) {
      // First click: set start
      safeSetState(() {
        _selectionStartSlot = slotIndex;
        _selectionStartDate = date;
      });
    } else {
      // Second click: compute range and open dialog
      final start = slotIndex < _selectionStartSlot!
          ? slotIndex
          : _selectionStartSlot!;
      final end = slotIndex > _selectionStartSlot!
          ? slotIndex + 1
          : _selectionStartSlot! + 1;

      // Check for overlap with existing bookings
      if (_rangeOverlapsBooking(date, start, end)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('ช่วงเวลาที่เลือกทับซ้อนกับการประชุมที่มีอยู่แล้ว'),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        safeSetState(() => _clearSelection());
        return;
      }

      final savedStart = start;
      final savedEnd = end;
      final savedDate = date;
      safeSetState(() => _clearSelection());
      _showBookingDialog(context, savedDate, savedStart, savedEnd);
    }
  }

  static const List<String> _thaiDayNames = [
    'จันทร์',
    'อังคาร',
    'พุธ',
    'พฤหัสบดี',
    'ศุกร์',
    'เสาร์',
    'อาทิตย์',
  ];

  static const List<String> _thaiMonthsShort = [
    '',
    'ม.ค.',
    'ก.พ.',
    'มี.ค.',
    'เม.ย.',
    'พ.ค.',
    'มิ.ย.',
    'ก.ค.',
    'ส.ค.',
    'ก.ย.',
    'ต.ค.',
    'พ.ย.',
    'ธ.ค.',
  ];

  static const List<String> _thaiMonthsFull = [
    '',
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingDetailModel());
    _model.subjectTextController ??= TextEditingController();
    _model.subjectFocusNode ??= FocusNode();
    // Pre-fill from user profile (simulated login data)
    _model.bookerNameTextController ??= TextEditingController(text: 'นายสมชาย ใจดี');
    _model.bookerNameFocusNode ??= FocusNode();
    _model.departmentTextController ??= TextEditingController(text: 'แผนกเทคโนโลยีสารสนเทศ');
    _model.departmentFocusNode ??= FocusNode();
    _model.phoneTextController ??= TextEditingController(text: '089-123-4567');
    _model.phoneFocusNode ??= FocusNode();
    _model.attendeeCountTextController ??= TextEditingController();
    _model.attendeeCountFocusNode ??= FocusNode();
    _model.noteTextController ??= TextEditingController();
    _model.noteFocusNode ??= FocusNode();
    _model.allergyTextController ??= TextEditingController();
    _model.allergyFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // ─── Sample booking data (slot index = hour, 0=00:00, 8=08:00, etc.) ───
  List<Map<String, dynamic>> _getBookingsForDate(DateTime date) {
    final roomIndex = _model.selectedRoomIndex;
    final room = _currentRoom;
    final roomName = room['name'] as String;
    final roomLocation = room['location'] as String;

    // Room 0: ห้องประชุมที่ 1
    if (roomIndex == 0) {
      if (date.weekday == DateTime.monday) {
        return [
          {
            'startSlot': 8, 'endSlot': 10,
            'title': roomName, 'location': roomLocation,
            'timeText': '08:00-10:00 น.',
            'status': 'ended', 'statusText': 'การประชุมสิ้นสุดแล้ว',
            'subject': 'ประชุมวางแผนรายไตรมาส',
            'booker': 'นายสมชาย ใจดี', 'department': 'แผนกทรัพยากร',
            'phone': '081-234-5678', 'attendeeCount': '15',
            'note': 'เตรียมเอกสารรายงานผลไตรมาสก่อนหน้า',
          },
          {
            'startSlot': 10, 'endSlot': 12,
            'title': roomName, 'location': roomLocation,
            'timeText': '10:00-12:00 น.',
            'status': 'active', 'statusText': 'กำลังประชุม : แผนทบทวน Q2',
            'subject': 'แผนทบทวน Q2',
            'booker': 'นางสาวมณี ศรีสุข', 'department': 'แผนกการเงิน',
            'phone': '089-876-5432', 'attendeeCount': '8', 'note': '',
          },
          {
            'startSlot': 13, 'endSlot': 16,
            'title': roomName, 'location': roomLocation,
            'timeText': '13:00-16:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'อบรมระบบจองห้องประชุม',
            'booker': 'นายวิชัย ธนกิจ', 'department': 'แผนก IT',
            'phone': '062-345-6789', 'attendeeCount': '20',
            'note': 'ต้องการโปรเจคเตอร์และไมโครโฟน',
          },
        ];
      } else if (date.weekday == DateTime.wednesday) {
        return [
          {
            'startSlot': 9, 'endSlot': 11,
            'title': roomName, 'location': roomLocation,
            'timeText': '09:00-11:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'ประชุมทีม Dev',
            'booker': 'นายสมชาย ใจดี', 'department': 'แผนก IT',
            'phone': '081-234-5678', 'attendeeCount': '12', 'note': '',
          },
        ];
      } else if (date.weekday == DateTime.friday) {
        return [
          {
            'startSlot': 14, 'endSlot': 17,
            'title': roomName, 'location': roomLocation,
            'timeText': '14:00-17:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'ประชุมสรุปงานประจำสัปดาห์',
            'booker': 'นายสมชาย ใจดี', 'department': 'แผนก IT',
            'phone': '081-234-5678', 'attendeeCount': '10', 'note': '',
          },
        ];
      }
    }

    // Room 1: ห้องประชุมที่ 2
    if (roomIndex == 1) {
      if (date.weekday == DateTime.tuesday) {
        return [
          {
            'startSlot': 9, 'endSlot': 12,
            'title': roomName, 'location': roomLocation,
            'timeText': '09:00-12:00 น.',
            'status': 'active', 'statusText': 'กำลังประชุม : Sprint Review',
            'subject': 'Sprint Review',
            'booker': 'นางสาวสุภาพร นิลเขต', 'department': 'แผนกพัฒนาธุรกิจ',
            'phone': '091-111-2222', 'attendeeCount': '10', 'note': '',
          },
          {
            'startSlot': 13, 'endSlot': 15,
            'title': roomName, 'location': roomLocation,
            'timeText': '13:00-15:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'ประชุมงบประมาณประจำเดือน',
            'booker': 'นายนิธิ กมลวิจิตร', 'department': 'แผนกบัญชี',
            'phone': '088-999-8888', 'attendeeCount': '6', 'note': '',
          },
        ];
      } else if (date.weekday == DateTime.thursday) {
        return [
          {
            'startSlot': 8, 'endSlot': 12,
            'title': roomName, 'location': roomLocation,
            'timeText': '08:00-12:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'อบรมพนักงานใหม่',
            'booker': 'นางสมหญิง ใจงาม', 'department': 'แผนก HR',
            'phone': '085-555-6666', 'attendeeCount': '25',
            'note': 'เตรียมอาหารกลางวัน',
          },
        ];
      } else if (date.weekday == DateTime.friday) {
        return [
          {
            'startSlot': 10, 'endSlot': 12,
            'title': roomName, 'location': roomLocation,
            'timeText': '10:00-12:00 น.',
            'status': 'upcoming', 'statusText': 'รอถึงเวลาประชุม',
            'subject': 'Workshop ทีม Design',
            'booker': 'นางสาวพิมพ์ลภัส จันทร์ดี', 'department': 'แผนก UX/UI',
            'phone': '063-777-8888', 'attendeeCount': '8', 'note': '',
          },
        ];
      }
    }

    return [];
  }

  // Get Monday of the week for a given date
  DateTime _getWeekStart(DateTime date) {
    final weekday = date.weekday;
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Material(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Column(
          children: [
            // AppBar for mobile/tablet (when sidebar is hidden)
            if (!responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              _buildMobileAppBar(context, 'จองห้องประชุม'),
            Expanded(
              child: Row(
                children: [
                  wrapWithModel(
                    model: _model.sidebarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SidebarWidget(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Room Header with room selector
                          _buildRoomHeader(context),
                          SizedBox(height: 16.0),

                          // Weekly Timetable
                          Expanded(
                            child: _buildWeeklyTimetable(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Breadcrumb ───
  Widget _buildMobileAppBar(BuildContext context, String title, {VoidCallback? onBack}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(4.0, MediaQuery.paddingOf(context).top + 12.0, 4.0, 16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Centered title
          Text(
            title,
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: Colors.white,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                ),
          ),
          // Back arrow on the left
          if (onBack != null)
            Positioned(
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24.0),
                onPressed: onBack,
              ),
            ),
        ],
      ),
    );
  }

  // ─── Breadcrumb ───
  Widget _buildBreadcrumb(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 24.0,
            color: Color(0x1E666666),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed(BookingListWidget.routeName);
              },
              text: 'จองห้องประชุม',
              options: FFButtonOptions(
                height: 36.0,
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                iconPadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).bodySmallFamily,
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      useGoogleFonts: !FlutterFlowTheme.of(context)
                          .bodySmallIsCustom,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            Container(
              height: 36.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'รายละเอียดห้องประชุม',
                      style: FlutterFlowTheme.of(context)
                          .bodySmall
                          .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodySmallFamily,
                            color: FlutterFlowTheme.of(context)
                                .primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
            ),
          ].divide(SizedBox(width: 4.0)),
        ),
      ),
    );
  }

  // ─── Room Header (Hero Banner style from Figma) ───
  Widget _buildRoomHeader(BuildContext context) {
    final room = _currentRoom;
    final equipment = (room['equipment'] as List).cast<String>();

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 106.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x0D0C0C0D),
            offset: Offset(0.0, 1.0),
          ),
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x1A0C0C0D),
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 106.0),
          child: Stack(
            children: [
              // Text content
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Room selector row
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _showRoomPicker(context),
                            borderRadius: BorderRadius.circular(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  room['name'] as String,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context).primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                      ),
                                ),
                                SizedBox(width: 4.0),
                                Icon(Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    size: 20.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      room['location'] as String,
                      style: FlutterFlowTheme.of(context)
                          .labelSmall
                          .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .labelSmallFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .labelSmallIsCustom,
                          ),
                    ),
                    SizedBox(height: 6.0),
                    // Equipment tags
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: equipment
                          .map((e) => _buildEquipmentTag(context, e))
                          .toList(),
                    ),
                  ],
                ),
              ),
              // Gradient + Mascot
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 240.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xFF8FC6FD),
                          Color(0xFF007DFA),
                        ],
                        stops: [0.3038, 0.649, 1.0],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: ClipRect(
                      child: Stack(
                        children: [
                          Positioned(
                            left: 33.0,
                            top: 7.0,
                            child: Image.asset(
                              'assets/images/mascot_booking.png',
                              width: 220.0,
                              height: 146.0,
                              fit: BoxFit.cover,
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
      ),
    );
  }

  void _showRoomPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent3,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'เลือกห้องประชุม',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).titleSmallIsCustom,
                    ),
              ),
              SizedBox(height: 12.0),
              ...List.generate(_rooms.length, (index) {
                final room = _rooms[index];
                final isSelected = _model.selectedRoomIndex == index;
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      safeSetState(() => _model.selectedRoomIndex = index);
                      Navigator.pop(sheetContext);
                    },
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary.withAlpha(20)
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: isSelected
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent3,
                          width: isSelected ? 1.5 : 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room['name'] as String,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                      ),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  room['location'] as String,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: !FlutterFlowTheme.of(context)
                                            .labelSmallIsCustom,
                                      ),
                                ),
                                SizedBox(height: 6.0),
                                Wrap(
                                  spacing: 6.0,
                                  runSpacing: 4.0,
                                  children: (room['equipment'] as List)
                                      .cast<String>()
                                      .map((e) => _buildEquipmentTag(context, e))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Icon(Icons.check_circle_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEquipmentTag(BuildContext context, String label) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        child: Text(
          label,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily:
                    FlutterFlowTheme.of(context).bodySmallFamily,
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                useGoogleFonts: !FlutterFlowTheme.of(context)
                    .bodySmallIsCustom,
              ),
        ),
      ),
    );
  }

  // ─── Weekly Timetable ───
  Widget _buildWeeklyTimetable(BuildContext context) {
    final weekStart = _getWeekStart(_model.selectedDate);
    final focused = _model.focusedMonth;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent3,
        ),
      ),
      child: Column(
        children: [
          // Toolbar: month + view toggle
          _buildToolbar(context, focused),
          // Timetable grid
          Expanded(
            child: _buildTimetableGrid(context, weekStart),
          ),
        ],
      ),
    );
  }

  void _scrollToNow() {
    final now = DateTime.now();
    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;
    final rh = isMobile ? 70.0 : 100.0;
    final targetScroll = (now.hour * rh) - rh;
    Future.delayed(Duration(milliseconds: 100), () {
      final bodyCtrl = _model.viewMode == 0
          ? _dayBodyScrollController
          : _bodyScrollController;
      final timeCtrl = _model.viewMode == 0
          ? _dayTimeScrollController
          : _timeScrollController;
      if (bodyCtrl.hasClients) {
        bodyCtrl.animateTo(
          targetScroll.clamp(0.0, bodyCtrl.position.maxScrollExtent),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
      if (timeCtrl.hasClients) {
        timeCtrl.animateTo(
          targetScroll.clamp(0.0, timeCtrl.position.maxScrollExtent),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget _buildToolbar(BuildContext context, DateTime focused) {
    final isCompact = MediaQuery.sizeOf(context).width < kBreakpointLarge;
    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;

    // Month display widget
    final monthDisplay = Container(
      height: 40.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent3,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Center(
          child: Text(
            _model.viewMode == 0
                ? 'วัน${_thaiDayNames[_model.selectedDate.weekday - 1]} ${_model.selectedDate.day} ${_thaiMonthsFull[_model.selectedDate.month]} ${_model.selectedDate.year + 543}'
                : '${_thaiMonthsFull[focused.month]} ${focused.year + 543}',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).bodySmallIsCustom,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );

    // View toggle (always visible)
    final viewToggle = Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).accent3,
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildViewTab(context, 'วัน', 0),
                  _buildViewTab(context, 'สัปดาห์', 1),
                ],
              ),
            ),
          );

    // Navigation controls
    final navControls = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => safeSetState(() {
            _model.selectedDate = DateTime.now();
            _model.focusedMonth = _model.selectedDate;
            _scrollToNow();
          }),
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: 36.0,
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                'วันนี้',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).bodySmallFamily,
                      color:
                          FlutterFlowTheme.of(context).primaryBackground,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: !FlutterFlowTheme.of(context)
                          .bodySmallIsCustom,
                    ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.0),
        FlutterFlowIconButton(
          borderRadius: 100.0,
          buttonSize: 36.0,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          icon: Icon(Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primary, size: 20.0),
          onPressed: () => safeSetState(() {
            final step = _model.viewMode == 0 ? 1 : 7;
            _model.selectedDate =
                _model.selectedDate.subtract(Duration(days: step));
            _model.focusedMonth = _model.selectedDate;
          }),
        ),
        SizedBox(width: 8.0),
        FlutterFlowIconButton(
          borderRadius: 100.0,
          buttonSize: 36.0,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          icon: Icon(Icons.chevron_right_rounded,
              color: FlutterFlowTheme.of(context).primary, size: 20.0),
          onPressed: () => safeSetState(() {
            final step = _model.viewMode == 0 ? 1 : 7;
            _model.selectedDate =
                _model.selectedDate.add(Duration(days: step));
            _model.focusedMonth = _model.selectedDate;
          }),
        ),
      ],
    );

    // Desktop: single row | Mobile/Tablet: 2 rows
    if (!isCompact) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            monthDisplay,
            SizedBox(width: 16.0),
            viewToggle,
            Spacer(),
            navControls,
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: monthDisplay),
              SizedBox(width: 8.0),
              viewToggle,
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [navControls],
          ),
        ],
      ),
    );
  }

  Widget _buildViewTab(BuildContext context, String label, int mode) {
    final isActive = _model.viewMode == mode;
    return GestureDetector(
      onTap: () => safeSetState(() => _model.viewMode = mode),
      child: Container(
        width: 64.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: isActive
              ? FlutterFlowTheme.of(context).primaryText
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            label,
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily:
                      FlutterFlowTheme.of(context).labelSmallFamily,
                  color: isActive
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  useGoogleFonts: !FlutterFlowTheme.of(context)
                      .labelSmallIsCustom,
                ),
          ),
        ),
      ),
    );
  }

  // ─── Timetable Grid ───
  Widget _buildTimetableGrid(BuildContext context, DateTime weekStart) {
    if (_model.viewMode == 0) {
      return _buildDayViewGrid(context);
    }
    return _buildWeekViewGrid(context, weekStart);
  }

  // Separate scroll controllers for day and week views
  final ScrollController _dayTimeScrollController = ScrollController();
  final ScrollController _dayBodyScrollController = ScrollController();
  final ScrollController _timeScrollController = ScrollController();
  final ScrollController _bodyScrollController = ScrollController();

  // ── Day View: same layout as week view but with single column for selected day ──
  Widget _buildDayViewGrid(BuildContext context) {
    final date = _model.selectedDate;
    final bookings = _getBookingsForDate(date);
    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;
    final timeColumnWidth = isMobile ? 60.0 : 100.0;
    final rowHeight = isMobile ? 70.0 : 100.0;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      ),
      child: Row(
        children: [
          // Left time column (fixed)
          SizedBox(
            width: timeColumnWidth,
            child: ListView.builder(
              controller: _dayTimeScrollController,
              itemCount: _timeLabels.length,
              itemExtent: rowHeight,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3),
                      right: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _timeLabels[index],
                      style: FlutterFlowTheme.of(context)
                          .bodySmall
                          .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodySmallFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodySmallIsCustom,
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content - full width single day column
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  if (_dayTimeScrollController.hasClients) {
                    _dayTimeScrollController.jumpTo(notification.metrics.pixels);
                  }
                }
                return false;
              },
              child: SingleChildScrollView(
                controller: _dayBodyScrollController,
                child: SizedBox(
                  height: _timeLabels.length * rowHeight,
                  child: Stack(
                    children: [
                      // Grid lines + hover cells
                      Column(
                        children: List.generate(_timeLabels.length, (slotIndex) {
                          final isBooked = bookings.any((b) =>
                              slotIndex >= (b['startSlot'] as int) &&
                              slotIndex < (b['endSlot'] as int));
                          final isInsideBooking = bookings.any((b) =>
                              slotIndex >= (b['startSlot'] as int) &&
                              slotIndex < (b['endSlot'] as int) - 1);
                          final isHovered = _hoveredSlotDate == date &&
                              _hoveredSlotIndex == slotIndex;
                          final isInSelection = _isSlotInSelection(date, slotIndex);
                          final hasSelection = _selectionStartSlot != null &&
                              _selectionStartDate != null &&
                              date.year == _selectionStartDate?.year &&
                              date.month == _selectionStartDate?.month &&
                              date.day == _selectionStartDate?.day;

                          return MouseRegion(
                            onEnter: isBooked
                                ? null
                                : (_) => safeSetState(() {
                                      _hoveredSlotIndex = slotIndex;
                                      _hoveredSlotDate = date;
                                    }),
                            onExit: (_) => safeSetState(() {
                              _hoveredSlotIndex = null;
                              _hoveredSlotDate = null;
                            }),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: isBooked
                                  ? null
                                  : () => _handleSlotTap(context, date, slotIndex),
                              child: Container(
                                height: rowHeight,
                                decoration: BoxDecoration(
                                  color: isInSelection
                                      ? FlutterFlowTheme.of(context)
                                          .primary
                                          .withAlpha(26)
                                      : null,
                                  border: Border(
                                    bottom: isInsideBooking
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent3),
                                  ),
                                ),
                                child: _buildSlotContent(context, date, slotIndex,
                                    isBooked, isHovered, isInSelection, hasSelection),
                              ),
                            ),
                          );
                        }),
                      ),
                      // Booking cards (overlaid vertically)
                      ...bookings.map((b) {
                        final startSlot = b['startSlot'] as int;
                        final endSlot = b['endSlot'] as int;
                        final cardHeight = (endSlot - startSlot) * rowHeight;
                        final top = startSlot * rowHeight;

                        return Positioned(
                          top: top + 8.0,
                          left: 12.0,
                          right: 12.0,
                          height: cardHeight - 16.0,
                          child: GestureDetector(
                            onTap: () => _showBookingDetailDialog(context, b),
                            child: _buildBookingCard(context, b),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Week View: days as columns, time as rows ──
  Widget _buildWeekViewGrid(BuildContext context, DateTime weekStart) {
    final today = DateTime.now();
    final days = List.generate(7, (i) => weekStart.add(Duration(days: i)));
    const timeColumnWidth = 100.0;
    const rowHeight = 100.0;
    const headerHeight = 60.0;
    // Responsive dayColumnWidth: fit available space or scroll
    final screenWidth = MediaQuery.sizeOf(context).width;
    final sidebarWidth = screenWidth >= kBreakpointLarge ? 320.0 : 0.0;
    final availableWidth = screenWidth - sidebarWidth - timeColumnWidth - 32.0 - 2.0;
    final calculatedDayWidth = availableWidth / 7;
    // Minimum 150px per day column to keep content readable; scroll if needed
    final dayColumnWidth = calculatedDayWidth < 150.0 ? 150.0 : calculatedDayWidth;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      ),
      child: Row(
        children: [
          // Left time column (fixed)
          SizedBox(
            width: timeColumnWidth,
            child: Column(
              children: [
                Container(
                  height: headerHeight,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3),
                      right: BorderSide(
                          color: FlutterFlowTheme.of(context).accent3),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _timeScrollController,
                    itemCount: _timeLabels.length,
                    itemExtent: rowHeight,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).accent3),
                            right: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).accent3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _timeLabels[index],
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts:
                                      !FlutterFlowTheme.of(context)
                                          .bodySmallIsCustom,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Day columns (scrollable horizontally)
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: days.length * dayColumnWidth,
                child: Column(
                  children: [
                    // Day headers
                    SizedBox(
                      height: headerHeight,
                      child: Row(
                        children: days.map((date) {
                          final isToday = date.year == today.year &&
                              date.month == today.month &&
                              date.day == today.day;
                          return Container(
                            width: dayColumnWidth,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              border: Border(
                                bottom: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .accent3),
                                left: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .accent3,
                                    width: 0.5),
                                right: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .accent3,
                                    width: 0.5),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    '${_thaiDayNames[date.weekday - 1]} ${date.day} ${_thaiMonthsShort[date.month]}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: isToday
                                              ? FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                if (isToday)
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: 2.0,
                                      color:
                                          FlutterFlowTheme.of(context)
                                              .primary,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Grid body
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification) {
                            if (_timeScrollController.hasClients) {
                              _timeScrollController
                                  .jumpTo(notification.metrics.pixels);
                            }
                          }
                          return false;
                        },
                        child: SingleChildScrollView(
                          controller: _bodyScrollController,
                          child: SizedBox(
                            height: _timeLabels.length * rowHeight,
                            child: Row(
                              children: days.map((date) {
                                return _buildWeekDayColumn(
                                    context, date, dayColumnWidth, rowHeight);
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a full day column with Stack for booking cards spanning rows
  Widget _buildWeekDayColumn(BuildContext context, DateTime date,
      double columnWidth, double rowHeight) {
    final bookings = _getBookingsForDate(date);

    return SizedBox(
      width: columnWidth,
      child: Stack(
        children: [
          // Grid lines + hover cells (remove bottom border for merged booking slots)
          Column(
            children: List.generate(_timeLabels.length, (slotIndex) {
              final isBooked = bookings.any((b) =>
                  slotIndex >= (b['startSlot'] as int) &&
                  slotIndex < (b['endSlot'] as int));
              final isInsideBooking = bookings.any((b) =>
                  slotIndex >= (b['startSlot'] as int) &&
                  slotIndex < (b['endSlot'] as int) - 1);
              final isHovered =
                  _hoveredSlotDate == date && _hoveredSlotIndex == slotIndex;
              final isInSelection = _isSlotInSelection(date, slotIndex);
              final hasSelection = _selectionStartSlot != null &&
                  _selectionStartDate != null &&
                  date.year == _selectionStartDate?.year &&
                  date.month == _selectionStartDate?.month &&
                  date.day == _selectionStartDate?.day;

              return MouseRegion(
                onEnter: isBooked
                    ? null
                    : (_) => safeSetState(() {
                          _hoveredSlotIndex = slotIndex;
                          _hoveredSlotDate = date;
                        }),
                onExit: (_) => safeSetState(() {
                  _hoveredSlotIndex = null;
                  _hoveredSlotDate = null;
                }),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: isBooked
                      ? null
                      : () => _handleSlotTap(context, date, slotIndex),
                  child: Container(
                    width: columnWidth,
                    height: rowHeight,
                    decoration: BoxDecoration(
                      color: isInSelection
                          ? FlutterFlowTheme.of(context)
                              .primary
                              .withAlpha(26)
                          : null,
                      border: Border(
                        bottom: isInsideBooking
                            ? BorderSide.none
                            : BorderSide(
                                color: FlutterFlowTheme.of(context).accent3),
                        left: BorderSide(
                            color: FlutterFlowTheme.of(context).accent3,
                            width: 0.5),
                        right: BorderSide(
                            color: FlutterFlowTheme.of(context).accent3,
                            width: 0.5),
                      ),
                    ),
                    child: _buildSlotContent(context, date, slotIndex,
                        isBooked, isHovered, isInSelection, hasSelection),
                  ),
                ),
              );
            }),
          ),
          // Booking cards overlaid spanning multiple rows
          ...bookings.map((b) {
            final startSlot = b['startSlot'] as int;
            final endSlot = b['endSlot'] as int;
            final cardHeight = (endSlot - startSlot) * rowHeight;
            final top = startSlot * rowHeight;

            return Positioned(
              top: top + 8.0,
              left: 8.0,
              right: 8.0,
              height: cardHeight - 16.0,
              child: GestureDetector(
                onTap: () => _showBookingDetailDialog(context, b),
                child: _buildBookingCard(context, b),
              ),
            );
          }),
        ],
      ),
    );
  }

  // ─── Slot content: handles selection state display ───
  Widget _buildSlotContent(BuildContext context, DateTime date, int slotIndex,
      bool isBooked, bool isHovered, bool isInSelection, bool hasSelection) {
    if (isBooked) return SizedBox.shrink();

    // If selection is active and this is the start slot, show "เลือกเวลาสิ้นสุด"
    if (hasSelection && _selectionStartSlot == slotIndex && !isInSelection) {
      return Center(
        child: Container(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary.withAlpha(20),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
          ),
          child: Text(
            '${_timeLabels[slotIndex]} - เลือกเวลาสิ้นสุด',
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelSmallIsCustom,
                ),
          ),
        ),
      );
    }

    // If in selection range, show highlighted time label
    if (isInSelection) {
      final start = _rangeStart ?? _selectionStartSlot!;
      final end = _rangeEnd ?? (_selectionStartSlot! + 1);
      // Show range label on the middle slot of selection
      final midSlot = start + ((end - start) ~/ 2);
      if (slotIndex == midSlot) {
        return Center(
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              '${_timeLabels[start]} - ${end < _timeLabels.length ? _timeLabels[end] : '${end}.00'}',
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).labelSmallIsCustom,
                  ),
            ),
          ),
        );
      }
      return SizedBox.shrink();
    }

    // Normal hover: show booking button
    if (isHovered && !hasSelection) {
      return Center(
          child: _buildHoverBookButton(context, date, slotIndex));
    }

    return SizedBox.shrink();
  }

  // ─── Hover Book Button (shown only on hover) ───
  Widget _buildHoverBookButton(
      BuildContext context, DateTime date, int slotIndex) {
    return InkWell(
      onTap: () => _handleSlotTap(context, date, slotIndex),
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF194987),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x0F000000),
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Text(
            'จองห้อง',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily:
                      FlutterFlowTheme.of(context).bodySmallFamily,
                  color:
                      FlutterFlowTheme.of(context).primaryBackground,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: !FlutterFlowTheme.of(context)
                      .bodySmallIsCustom,
                ),
          ),
        ),
      ),
    );
  }

  // ─── Booking Card (in timetable) ───
  Widget _buildBookingCard(
      BuildContext context, Map<String, dynamic> booking) {
    final status = booking['status'] as String;
    Color statusColor;
    Color gradientTo;

    switch (status) {
      case 'active':
        statusColor = FlutterFlowTheme.of(context).error;
        gradientTo = Color(0xFFFFF4ED); // error/50
        break;
      case 'ended':
        statusColor = Color(0xFF525252); // neutral/600
        gradientTo = Color(0xFFFAFAFA); // neutral/50
        break;
      case 'upcoming':
      default:
        statusColor = Color(0xFF0086C9); // info/600
        gradientTo = FlutterFlowTheme.of(context).secondaryBackground;
        break;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Show booker info only when card has enough height (> 150px)
        final showBooker = constraints.maxHeight > 150.0;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradientTo,
                FlutterFlowTheme.of(context).primaryBackground,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent3,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x0F000000),
                offset: Offset(0.0, 2.0),
              ),
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x0F000000),
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Room title + location
                Text(
                  booking['title'] ?? '',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: !FlutterFlowTheme.of(context)
                            .bodyMediumIsCustom,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0),
                Text(
                  booking['location'] ?? '',
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelSmallFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowTheme.of(context)
                            .labelSmallIsCustom,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                // Status indicator
                Row(
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
                        booking['statusText'] ?? '',
                        style: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodySmallFamily,
                              color: statusColor,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.0),
                // Time
                Text(
                  booking['timeText'] ?? '',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: !FlutterFlowTheme.of(context)
                            .bodySmallIsCustom,
                      ),
                ),
                if (showBooker) Spacer(),
                // Booker info (hidden when card is too small)
                if (showBooker)
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).accent3,
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          8.0, 6.0, 12.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 32.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: Color(0x260485F7),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person_outline_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'ผู้จอง',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                ),
                                Text(
                                  booking['booker'] ?? '',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily:
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelSmallIsCustom,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─── Booking Detail Dialog (matching booking form style + edit/cancel) ───
  void _showBookingDetailDialog(
      BuildContext context, Map<String, dynamic> booking) {
    final status = booking['status'] as String;

    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: isMobile
              ? EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0)
              : EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          child: Container(
            width: isMobile ? double.infinity : 500.0,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ─── Sticky Header ───
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      isMobile ? 16.0 : 24.0, isMobile ? 16.0 : 24.0,
                      isMobile ? 16.0 : 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รายละเอียดการประชุม',
                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 100.0,
                            buttonSize: 36.0,
                            icon: Icon(Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText, size: 20.0),
                            onPressed: () => Navigator.pop(dialogContext),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      // Time info bar
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(children: [
                          Icon(Icons.event_available_rounded,
                              color: FlutterFlowTheme.of(context).primary, size: 20.0),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              booking['timeText'] ?? '',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
                // ─── Scrollable Content ───
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        isMobile ? 16.0 : 24.0, 0.0,
                        isMobile ? 16.0 : 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // หัวข้อการประชุม
                          _label(context, 'หัวข้อการประชุม / วัตถุประสงค์'),
                          SizedBox(height: 4.0),
                          _readOnlyField(context, booking['subject'] ?? ''),
                          SizedBox(height: 16.0),
                          // ชื่อผู้จอง + แผนก
                          _responsiveDetailRow(context, isMobile, [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _label(context, 'ชื่อผู้จอง'),
                              SizedBox(height: 4.0),
                              _readOnlyField(context, booking['booker'] ?? ''),
                            ]),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _label(context, 'แผนก/หน่วยงาน'),
                              SizedBox(height: 4.0),
                              _readOnlyField(context, booking['department'] ?? ''),
                            ]),
                          ]),
                          SizedBox(height: 16.0),
                          // เบอร์ติดต่อ + จำนวนผู้เข้าร่วม
                          _responsiveDetailRow(context, isMobile, [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _label(context, 'เบอร์ติดต่อ'),
                              SizedBox(height: 4.0),
                              _readOnlyField(context, booking['phone'] ?? ''),
                            ]),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              _label(context, 'จำนวนผู้เข้าร่วม'),
                              SizedBox(height: 4.0),
                              _readOnlyField(context, '${booking['attendeeCount'] ?? ''} คน'),
                            ]),
                          ]),
                          SizedBox(height: 16.0),
                          // หมายเหตุ
                          _label(context, 'หมายเหตุเพิ่มเติม'),
                          SizedBox(height: 4.0),
                          _readOnlyField(
                            context,
                            (booking['note'] as String?)?.isNotEmpty == true
                                ? booking['note']
                                : '-',
                          ),
                  ],  // content Column children
                ),  // content Column
              ),  // SingleChildScrollView
            ),  // Flexible
            // ─── Sticky Footer: Action Buttons ───
            if (status != 'ended')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    isMobile ? 16.0 : 24.0, 12.0,
                    isMobile ? 16.0 : 24.0, isMobile ? 16.0 : 24.0),
                child: _responsiveDetailRow(context, isMobile, [
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      _showBookingDialog(context, _model.selectedDate,
                          booking['startSlot'] as int,
                          booking['endSlot'] as int);
                    },
                    text: 'แก้ไขการจอง',
                    icon: Icon(Icons.edit_rounded, size: 18.0),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).primaryBackground,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ยกเลิกการจองเรียบร้อยแล้ว'),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    },
                    text: 'ยกเลิกการจอง',
                    icon: Icon(Icons.cancel_rounded, size: 18.0),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).error,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(color: FlutterFlowTheme.of(context).error),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ]),
              ),
          ],  // outer Column children
        ),  // outer Column
      ),  // Container
        );  // Dialog
      },  // builder
    );  // showDialog
  }

  Widget _readOnlyField(BuildContext context, String value) {
    return Container(
      width: double.infinity,
      height: 44.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent3,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Text(
          value,
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
      ),
    );
  }

  // Helper: responsive 2-column row or stacked column
  Widget _responsiveDetailRow(
      BuildContext context, bool isMobile, List<Widget> children) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
            .expand((w) => [w, SizedBox(height: 12.0)])
            .toList()
          ..removeLast(),
      );
    }
    return Row(
      children: children
          .expand((w) => [Expanded(child: w), SizedBox(width: 12.0)])
          .toList()
        ..removeLast(),
    );
  }

  // ─── Booking Dialog (supports time range) ───
  void _showBookingDialog(
      BuildContext context, DateTime date, int startSlot, [int? endSlot]) {
    final effectiveEnd = endSlot ?? (startSlot + 1);
    final startTime = startSlot < _timeLabels.length
        ? _timeLabels[startSlot]
        : '${startSlot.toString().padLeft(2, '0')}.00';
    final endTime = effectiveEnd < _timeLabels.length
        ? _timeLabels[effectiveEnd]
        : '${effectiveEnd.toString().padLeft(2, '0')}.00';
    final timeDisplay = effectiveEnd - startSlot == 1
        ? startTime
        : '$startTime - $endTime';

    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: isMobile
              ? EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0)
              : EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          child: Container(
            width: isMobile ? double.infinity : 500.0,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.85,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ─── Sticky Header ───
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      isMobile ? 16.0 : 24.0, isMobile ? 16.0 : 24.0,
                      isMobile ? 16.0 : 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'จองห้องประชุม',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 100.0,
                            buttonSize: 36.0,
                            icon: Icon(Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0),
                            onPressed: () => Navigator.pop(dialogContext),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      // Date & time range info
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .primary
                              .withAlpha(20),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(children: [
                          Icon(Icons.event_available_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              '${_thaiDayNames[date.weekday - 1]} ${date.day} ${_thaiMonthsShort[date.month]} ${date.year + 543}  •  $timeDisplay',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: !FlutterFlowTheme.of(context)
                                        .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
                // ─── Scrollable Form Content ───
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        isMobile ? 16.0 : 24.0, 0.0,
                        isMobile ? 16.0 : 24.0, 0.0),
                    child: _buildBookingFormContent(context, dialogContext, includeSubmit: false),
                  ),
                ),
                // ─── Sticky Footer: Submit Button ───
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      isMobile ? 16.0 : 24.0, 12.0,
                      isMobile ? 16.0 : 24.0, isMobile ? 16.0 : 24.0),
                  child: _buildSubmitButton(context, dialogContext),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookingFormContent(
      BuildContext context, BuildContext dialogContext, {bool includeSubmit = true}) {
    // Equipment options available for this room
    const equipmentOptions = [
      'โปรเจคเตอร์',
      'ไมโครโฟน',
      'กระดานไวท์บอร์ด',
      'จอ LED',
      'ระบบประชุมออนไลน์',
    ];

    return StatefulBuilder(
      builder: (context, setDialogState) {
        final isMobileDialog = MediaQuery.sizeOf(context).width < kBreakpointSmall;

        // Helper: 2-column row on desktop, stacked on mobile
        Widget twoColumnRow(Widget left, Widget right) {
          if (isMobileDialog) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [left, SizedBox(height: 12.0), right],
            );
          }
          return Row(children: [
            Expanded(child: left),
            SizedBox(width: 12.0),
            Expanded(child: right),
          ]);
        }

        Widget fieldColumn(String label, Widget field) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_label(context, label), SizedBox(height: 4.0), field],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ─── Subject (required) ───
            _requiredLabel(context, 'หัวข้อการประชุม / วัตถุประสงค์'),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _model.subjectTextController,
              focusNode: _model.subjectFocusNode,
              decoration: _inputDeco(context, 'ระบุหัวข้อการประชุม'),
              style: _bodyMediumStyle(context),
              onChanged: (_) => setDialogState(() => _formErrors.remove('subject')),
            ),
            if (_formErrors['subject'] != null)
              _errorText(context, _formErrors['subject']!),
            SizedBox(height: 16.0),

            // ─── Booker & Department ───
            twoColumnRow(
              fieldColumn('ชื่อผู้จอง', TextFormField(
                controller: _model.bookerNameTextController,
                focusNode: _model.bookerNameFocusNode,
                decoration: _inputDeco(context, 'ชื่อ-นามสกุล'),
                style: _bodyMediumStyle(context),
              )),
              fieldColumn('แผนก/หน่วยงาน', TextFormField(
                controller: _model.departmentTextController,
                focusNode: _model.departmentFocusNode,
                decoration: _inputDeco(context, 'แผนก/หน่วยงาน'),
                style: _bodyMediumStyle(context),
              )),
            ),
            SizedBox(height: 16.0),

            // ─── Phone & Attendee ───
            twoColumnRow(
              fieldColumn('เบอร์ติดต่อ', TextFormField(
                controller: _model.phoneTextController,
                focusNode: _model.phoneFocusNode,
                keyboardType: TextInputType.phone,
                decoration: _inputDeco(context, 'เบอร์โทรศัพท์'),
                style: _bodyMediumStyle(context),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _requiredLabel(context, 'จำนวนผู้เข้าร่วม'),
                  SizedBox(height: 4.0),
                  TextFormField(
                    controller: _model.attendeeCountTextController,
                    focusNode: _model.attendeeCountFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: _inputDeco(context, 'จำนวนคน'),
                    style: _bodyMediumStyle(context),
                    onChanged: (_) => setDialogState(() => _formErrors.remove('attendeeCount')),
                  ),
                  if (_formErrors['attendeeCount'] != null)
                    _errorText(context, _formErrors['attendeeCount']!),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // ─── Break (เบรค) — required ───
            _requiredLabel(context, 'เบรค'),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildOptionChip(
                  context: context,
                  label: 'เบรคเช้า',
                  icon: Icons.free_breakfast_rounded,
                  isSelected: _model.selectedBreak == 'morning',
                  onTap: () => setDialogState(() {
                    _model.selectedBreak =
                        _model.selectedBreak == 'morning' ? null : 'morning';
                    if (_model.selectedBreak != 'morning' && _model.selectedBreak != 'afternoon') _model.wantsDrink = null;
                    _formErrors.remove('break');
                  }),
                ),
                _buildOptionChip(
                  context: context,
                  label: 'เบรคบ่าย',
                  icon: Icons.coffee_rounded,
                  isSelected: _model.selectedBreak == 'afternoon',
                  onTap: () => setDialogState(() {
                    _model.selectedBreak =
                        _model.selectedBreak == 'afternoon' ? null : 'afternoon';
                    if (_model.selectedBreak != 'morning' && _model.selectedBreak != 'afternoon') _model.wantsDrink = null;
                    _formErrors.remove('break');
                  }),
                ),
                _buildOptionChip(
                  context: context,
                  label: 'ไม่รับเบรค',
                  icon: Icons.block_rounded,
                  isSelected: _model.selectedBreak == 'none',
                  onTap: () => setDialogState(() {
                    _model.selectedBreak =
                        _model.selectedBreak == 'none' ? null : 'none';
                    _model.wantsDrink = null;
                    _formErrors.remove('break');
                  }),
                ),
              ],
            ),
            if (_formErrors['break'] != null)
              _errorText(context, _formErrors['break']!),
            // Show drink choice only when a break is selected (not 'none')
            if (_model.selectedBreak != null && _model.selectedBreak != 'none') ...[
              SizedBox(height: 8.0),
              _label(context, 'น้ำดื่ม'),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildOptionChip(
                    context: context,
                    label: 'รับน้ำดื่ม',
                    icon: Icons.local_drink_rounded,
                    isSelected: _model.wantsDrink == true,
                    onTap: () => setDialogState(() {
                      _model.wantsDrink =
                          _model.wantsDrink == true ? null : true;
                    }),
                  ),
                  _buildOptionChip(
                    context: context,
                    label: 'ไม่รับน้ำดื่ม',
                    icon: Icons.no_drinks_rounded,
                    isSelected: _model.wantsDrink == false,
                    onTap: () => setDialogState(() {
                      _model.wantsDrink =
                          _model.wantsDrink == false ? null : false;
                    }),
                  ),
                ],
              ),
            ],
            SizedBox(height: 16.0),

            // ─── Lunch (อาหารกลางวัน) — required ───
            _requiredLabel(context, 'อาหารกลางวัน'),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildOptionChip(
                  context: context,
                  label: 'รับ',
                  icon: Icons.restaurant_rounded,
                  isSelected: _model.wantsLunch == true,
                  onTap: () => setDialogState(() {
                    _model.wantsLunch =
                        _model.wantsLunch == true ? null : true;
                    _formErrors.remove('lunch');
                  }),
                ),
                _buildOptionChip(
                  context: context,
                  label: 'ไม่รับ',
                  icon: Icons.no_meals_rounded,
                  isSelected: _model.wantsLunch == false,
                  onTap: () => setDialogState(() {
                    _model.wantsLunch =
                        _model.wantsLunch == false ? null : false;
                    _formErrors.remove('lunch');
                  }),
                ),
              ],
            ),
            if (_formErrors['lunch'] != null)
              _errorText(context, _formErrors['lunch']!),
            // Show allergy note only when lunch = รับ
            if (_model.wantsLunch == true) ...[
              SizedBox(height: 8.0),
              _label(context, 'แพ้อาหาร / หมายเหตุอาหาร'),
              SizedBox(height: 4.0),
              TextFormField(
                controller: _model.allergyTextController,
                focusNode: _model.allergyFocusNode,
                decoration:
                    _inputDeco(context, 'ระบุอาหารที่แพ้ หรือข้อจำกัด (ถ้ามี)'),
                style: _bodyMediumStyle(context),
              ),
            ],
            SizedBox(height: 16.0),

            // ─── Equipment (ขอใช้อุปกรณ์) ───
            _label(context, 'ขอใช้อุปกรณ์'),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: equipmentOptions.map((eq) {
                final isSelected = _model.selectedEquipment.contains(eq);
                return _buildOptionChip(
                  context: context,
                  label: eq,
                  icon: _equipmentIcon(eq),
                  isSelected: isSelected,
                  onTap: () => setDialogState(() {
                    if (isSelected) {
                      _model.selectedEquipment.remove(eq);
                    } else {
                      _model.selectedEquipment.add(eq);
                    }
                  }),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),

            // ─── Note ───
            _label(context, 'หมายเหตุเพิ่มเติม'),
            SizedBox(height: 4.0),
            TextFormField(
              controller: _model.noteTextController,
              focusNode: _model.noteFocusNode,
              maxLines: 3,
              decoration: _inputDeco(context, 'ระบุหมายเหตุ (ถ้ามี)'),
              style: _bodyMediumStyle(context),
            ),
            if (includeSubmit) ...[
            SizedBox(height: 16.0),

            // ─── Submit ───
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(dialogContext);
                await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: BookingDoneWidget());
                    });
              },
              text: 'ยืนยันการจอง',
              icon: Icon(Icons.check_rounded, size: 20.0),
              options: FFButtonOptions(
                width: double.infinity,
                height: 52.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconColor: FlutterFlowTheme.of(context).primaryBackground,
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            ],  // end if (includeSubmit)
          ],
        );
      },
    );
  }

  // ─── Validate booking form ───
  bool _validateBookingForm(void Function(void Function()) setDialogState) {
    _formErrors.clear();

    if (_model.subjectTextController?.text.trim().isEmpty ?? true) {
      _formErrors['subject'] = 'กรุณาระบุหัวข้อการประชุม';
    }
    if (_model.attendeeCountTextController?.text.trim().isEmpty ?? true) {
      _formErrors['attendeeCount'] = 'กรุณาระบุจำนวนผู้เข้าร่วม';
    }
    if (_model.selectedBreak == null) {
      _formErrors['break'] = 'กรุณาเลือกเบรค';
    }
    if (_model.wantsLunch == null) {
      _formErrors['lunch'] = 'กรุณาเลือกอาหารกลางวัน';
    }

    setDialogState(() {});

    if (_formErrors.isNotEmpty) {
      // Focus on first error field
      if (_formErrors.containsKey('subject')) {
        _model.subjectFocusNode?.requestFocus();
      } else if (_formErrors.containsKey('attendeeCount')) {
        _model.attendeeCountFocusNode?.requestFocus();
      }
      return false;
    }
    return true;
  }

  // ─── Sticky Submit Button (extracted) ───
  Widget _buildSubmitButton(BuildContext context, BuildContext dialogContext) {
    return StatefulBuilder(
      builder: (context, setButtonState) {
        return FFButtonWidget(
          onPressed: () async {
            if (!_validateBookingForm(setButtonState)) return;
            Navigator.pop(dialogContext);
            await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: BookingDoneWidget());
                });
          },
      text: 'ยืนยันการจอง',
      icon: Icon(Icons.check_rounded, size: 20.0),
      options: FFButtonOptions(
        width: double.infinity,
        height: 52.0,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconColor: FlutterFlowTheme.of(context).primaryBackground,
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              color: FlutterFlowTheme.of(context).primaryBackground,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              useGoogleFonts:
                  !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
      },
    );
  }

  // ─── Reusable option chip ───
  Widget _buildOptionChip({
    required BuildContext context,
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? FlutterFlowTheme.of(context).primary.withAlpha(20)
              : FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: isSelected
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).accent3,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16.0,
              color: isSelected
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            SizedBox(width: 6.0),
            Text(
              label,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                    color: isSelected
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodySmallIsCustom,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _equipmentIcon(String name) {
    switch (name) {
      case 'โปรเจคเตอร์':
        return Icons.videocam_rounded;
      case 'ไมโครโฟน':
        return Icons.mic_rounded;
      case 'กระดานไวท์บอร์ด':
        return Icons.dashboard_rounded;
      case 'จอ LED':
        return Icons.tv_rounded;
      case 'ระบบประชุมออนไลน์':
        return Icons.video_call_rounded;
      default:
        return Icons.devices_other_rounded;
    }
  }

  TextStyle _bodyMediumStyle(BuildContext context) {
    return FlutterFlowTheme.of(context).bodyMedium.override(
        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
        letterSpacing: 0.0,
        useGoogleFonts:
            !FlutterFlowTheme.of(context).bodyMediumIsCustom);
  }

  // ─── Helpers ───
  InputDecoration _inputDeco(BuildContext context, String hint) {
    return InputDecoration(
      isDense: false,
      hintText: hint,
      hintStyle: FlutterFlowTheme.of(context).labelSmall.override(
            fontFamily:
                FlutterFlowTheme.of(context).labelSmallFamily,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            useGoogleFonts: !FlutterFlowTheme.of(context)
                .labelSmallIsCustom,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).accent3, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      filled: true,
      fillColor: FlutterFlowTheme.of(context).primaryBackground,
      contentPadding:
          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
    );
  }

  Widget _label(BuildContext context, String text) {
    return Text(
        text,
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily:
                  FlutterFlowTheme.of(context).bodySmallFamily,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context)
                  .bodySmallIsCustom,
            ));
  }

  Widget _requiredLabel(BuildContext context, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodySmallIsCustom,
              ),
        ),
        Text(' *',
            style: TextStyle(
                color: FlutterFlowTheme.of(context).error,
                fontSize: 12.0,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _errorText(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(top: 4.0),
      child: Text(
        text,
        style: TextStyle(
          color: FlutterFlowTheme.of(context).error,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
