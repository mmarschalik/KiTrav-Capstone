import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'checkbox_model.dart';
export 'checkbox_model.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late CheckboxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckboxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
        child: Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(
              color: Color(0xFFDBE2E7),
              width: 2.0,
            ),
          ),
          child: Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              unselectedWidgetColor: Color(0xFFDBE2E7),
            ),
            child: Checkbox(
              value: _model.checkboxValue ??= false,
              onChanged: (newValue) async {
                safeSetState(() => _model.checkboxValue = newValue!);
              },
              side: (Color(0xFFDBE2E7) != null)
                  ? BorderSide(
                      width: 2,
                      color: Color(0xFFDBE2E7),
                    )
                  : null,
              activeColor: Color(0xFF1877EF),
              checkColor: Color(0xFF1C4494),
            ),
          ),
        ),
      ),
    );
  }
}
