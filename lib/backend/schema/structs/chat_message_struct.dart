// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends BaseStruct {
  ChatMessageStruct({
    String? role,
    String? text,
  })  : _role = role,
        _text = text;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        role: data['role'] as String?,
        text: data['text'] as String?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'role': _role,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        role == other.role &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([role, text]);
}

ChatMessageStruct createChatMessageStruct({
  String? role,
  String? text,
}) =>
    ChatMessageStruct(
      role: role,
      text: text,
    );
