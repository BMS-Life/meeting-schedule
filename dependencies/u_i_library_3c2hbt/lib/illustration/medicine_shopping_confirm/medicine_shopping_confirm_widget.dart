import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medicine_shopping_confirm_model.dart';
export 'medicine_shopping_confirm_model.dart';

class MedicineShoppingConfirmWidget extends StatefulWidget {
  const MedicineShoppingConfirmWidget({super.key});

  @override
  State<MedicineShoppingConfirmWidget> createState() =>
      _MedicineShoppingConfirmWidgetState();
}

class _MedicineShoppingConfirmWidgetState
    extends State<MedicineShoppingConfirmWidget> {
  late MedicineShoppingConfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicineShoppingConfirmModel());

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
        'packages/u_i_library_3c2hbt/assets/images/medicine-shopping.png',
        width: 200.0,
        height: 200.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
