import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_sidebar_model.dart';
export 'dashboard_sidebar_model.dart';

class DashboardSidebarWidget extends StatefulWidget {
  const DashboardSidebarWidget({
    super.key,
    this.brandLogo,
    required this.menu,
    this.appName,
    this.logoWidth,
    this.logoHeight,
    this.layoutMargin,
  });

  final Widget Function()? brandLogo;
  final Widget Function()? menu;
  final String? appName;
  final double? logoWidth;
  final double? logoHeight;
  final double? layoutMargin;

  @override
  State<DashboardSidebarWidget> createState() => _DashboardSidebarWidgetState();
}

class _DashboardSidebarWidgetState extends State<DashboardSidebarWidget> {
  late DashboardSidebarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardSidebarModel());

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
      width: 256.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(24.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(valueOrDefault<double>(
          widget!.layoutMargin,
          16.0,
        )),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: widget!.logoWidth,
              height: widget!.logoHeight,
              decoration: BoxDecoration(),
              child: Builder(builder: (_) {
                return widget.brandLogo != null
                    ? widget.brandLogo!()
                    : SizedBox.shrink();
              }),
            ),
            Text(
              valueOrDefault<String>(
                widget!.appName,
                '{appName}',
              ),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.ibmPlexSansThaiLooped(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
            Builder(builder: (_) {
              return widget.menu != null ? widget.menu!() : SizedBox.shrink();
            }),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
