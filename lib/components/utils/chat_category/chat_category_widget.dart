import '/components/utils/chat_item/chat_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_category_model.dart';
export 'chat_category_model.dart';

class ChatCategoryWidget extends StatefulWidget {
  const ChatCategoryWidget({
    super.key,
    required this.categoryLabel,
    this.onItemSelect,
  });

  final String? categoryLabel;
  final Future Function()? onItemSelect;

  @override
  State<ChatCategoryWidget> createState() => _ChatCategoryWidgetState();
}

class _ChatCategoryWidgetState extends State<ChatCategoryWidget> {
  late ChatCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatCategoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valueOrDefault<String>(
            widget.categoryLabel,
            'Label',
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.interTight(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryBackground,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
              ),
        ),
        wrapWithModel(
          model: _model.chatItemModel1,
          updateCallback: () => safeSetState(() {}),
          child: ChatItemWidget(
            itemLabel: 'Las Vegas weekend',
            onItemSelect: () async {
              await widget.onItemSelect?.call();
            },
          ),
        ),
        wrapWithModel(
          model: _model.chatItemModel2,
          updateCallback: () => safeSetState(() {}),
          child: ChatItemWidget(
            itemLabel: 'Business trip to Vancouver',
            onItemSelect: () async {
              await widget.onItemSelect?.call();
            },
          ),
        ),
        wrapWithModel(
          model: _model.chatItemModel3,
          updateCallback: () => safeSetState(() {}),
          child: ChatItemWidget(
            itemLabel: 'Cultural trip to Nairobi',
            onItemSelect: () async {
              await widget.onItemSelect?.call();
            },
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
