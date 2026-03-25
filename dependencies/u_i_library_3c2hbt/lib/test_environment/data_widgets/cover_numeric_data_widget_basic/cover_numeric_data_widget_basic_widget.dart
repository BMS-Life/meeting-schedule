import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cover_numeric_data_widget_basic_model.dart';
export 'cover_numeric_data_widget_basic_model.dart';

class CoverNumericDataWidgetBasicWidget extends StatefulWidget {
  const CoverNumericDataWidgetBasicWidget({super.key});

  @override
  State<CoverNumericDataWidgetBasicWidget> createState() =>
      _CoverNumericDataWidgetBasicWidgetState();
}

class _CoverNumericDataWidgetBasicWidgetState
    extends State<CoverNumericDataWidgetBasicWidget> {
  late CoverNumericDataWidgetBasicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoverNumericDataWidgetBasicModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'packages/u_i_library_3c2hbt/assets/images/data-widgets.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
