import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/room_booking/components/booking_hero_banner/booking_hero_banner_widget.dart';
import 'booking_list_widget.dart' show BookingListWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BookingListModel extends FlutterFlowModel<BookingListWidget> {
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // Model for booking-hero-banner component.
  late BookingHeroBannerModel bookingHeroBannerModel;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
    bookingHeroBannerModel =
        createModel(context, () => BookingHeroBannerModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    bookingHeroBannerModel.dispose();
  }
}
