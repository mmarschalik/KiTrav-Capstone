import '../database.dart';

class AiMessagesTable extends SupabaseTable<AiMessagesRow> {
  @override
  String get tableName => 'ai_messages';

  @override
  AiMessagesRow createRow(Map<String, dynamic> data) => AiMessagesRow(data);
}

class AiMessagesRow extends SupabaseDataRow {
  AiMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiMessagesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get conversationId => getField<String>('conversation_id')!;
  set conversationId(String value) =>
      setField<String>('conversation_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
