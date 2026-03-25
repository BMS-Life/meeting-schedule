import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/room_booking/components/booking_hero_banner/booking_hero_banner_widget.dart';
import '/room_booking/components/room_card/room_card_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'booking_list_model.dart';
export 'booking_list_model.dart';

class BookingListWidget extends StatefulWidget {
  const BookingListWidget({super.key});

  static String routeName = 'booking-list';
  static String routePath = '/bookingList';

  @override
  State<BookingListWidget> createState() => _BookingListWidgetState();
}

class _BookingListWidgetState extends State<BookingListWidget> {
  late BookingListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingListModel());

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
      child: Material(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.sidebarModel,
              updateCallback: () => safeSetState(() {}),
              child: SidebarWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Banner
                    wrapWithModel(
                      model: _model.bookingHeroBannerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BookingHeroBannerWidget(
                        isAdmin: true,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Room Cards
                    _buildRoomListContent(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomListContent(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < kBreakpointSmall;

    if (isMobile) {
      return Column(
        children: [
          RoomCardWidget(
            roomName: 'ห้องประชุมที่ 1',
            location: 'อาคารเหล่าธงสิงห์ ห้อง 109',
            equipment: ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
            isMeetingInProgress: false,
            timeSlots: [0, 1, 1, 1, 1, 2, 2, 2, 2, 2],
          ),
          SizedBox(height: 16.0),
          RoomCardWidget(
            roomName: 'ห้องประชุมที่ 2',
            location: 'อาคารเหล่าธงสิงห์ ห้องอาหาร',
            equipment: ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
            isMeetingInProgress: true,
            currentMeetingName: 'แผนทบทวน Q2',
            timeSlots: [0, 2, 1, 1, 1, 2, 2, 2, 2, 2],
          ),
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = MediaQuery.sizeOf(context).width >= kBreakpointLarge
            ? (constraints.maxWidth - 16.0) / 2
            : constraints.maxWidth;
        return Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            SizedBox(
              width: cardWidth,
              child: RoomCardWidget(
                roomName: 'ห้องประชุมที่ 1',
                location: 'อาคารเหล่าธงสิงห์ ห้อง 109',
                equipment: ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
                isMeetingInProgress: false,
                timeSlots: [0, 1, 1, 1, 1, 2, 2, 2, 2, 2],
              ),
            ),
            SizedBox(
              width: cardWidth,
              child: RoomCardWidget(
                roomName: 'ห้องประชุมที่ 2',
                location: 'อาคารเหล่าธงสิงห์ ห้องอาหาร',
                equipment: ['โปรเจคเตอร์', 'ไมโครโฟน', 'Wi-Fi'],
                isMeetingInProgress: true,
                currentMeetingName: 'แผนทบทวน Q2',
                timeSlots: [0, 2, 1, 1, 1, 2, 2, 2, 2, 2],
              ),
            ),
          ],
        );
      },
    );
  }

}
