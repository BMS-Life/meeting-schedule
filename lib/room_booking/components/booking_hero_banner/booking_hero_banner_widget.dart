import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'booking_hero_banner_model.dart';
export 'booking_hero_banner_model.dart';

class BookingHeroBannerWidget extends StatefulWidget {
  const BookingHeroBannerWidget({
    super.key,
    bool? isAdmin,
  }) : this.isAdmin = isAdmin ?? false;

  final bool isAdmin;

  @override
  State<BookingHeroBannerWidget> createState() =>
      _BookingHeroBannerWidgetState();
}

class _BookingHeroBannerWidgetState extends State<BookingHeroBannerWidget> {
  late BookingHeroBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingHeroBannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          constraints: BoxConstraints(minHeight: 120.0),
          child: Stack(
            children: [
              // Left: Text content
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ระบบจองห้องประชุม',
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
                    SizedBox(height: 4.0),
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        'เลือกห้องประชุมที่ต้องการและระบุรายละเอียดเพื่อจองห้อง',
                        style: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodySmallIsCustom,
                            ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: 0.8,
                          child: Text(
                            'ห้องว่างตอนนี้มี',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodySmallIsCustom,
                                ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Color(0x80000000),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Center(
                              child: Text(
                                '1 จาก 2 ห้อง',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: Color(0xFFF5F8FB),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodySmallIsCustom,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Right: Gradient + Mascot
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
}
