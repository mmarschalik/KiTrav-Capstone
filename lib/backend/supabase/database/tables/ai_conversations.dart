import '../database.dart';

class AiConversationsTable extends SupabaseTable<AiConversationsRow> {
  @override
  String get tableName => 'ai_conversations';

  @override
  AiConversationsRow createRow(Map<String, dynamic> data) =>
      AiConversationsRow(data);
}

class AiConversationsRow extends SupabaseDataRow {
  AiConversationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiConversationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
