import '../database.dart';

class SavedTripsTable extends SupabaseTable<SavedTripsRow> {
  @override
  String get tableName => 'saved_trips';

  @override
  SavedTripsRow createRow(Map<String, dynamic> data) => SavedTripsRow(data);
}

class SavedTripsRow extends SupabaseDataRow {
  SavedTripsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SavedTripsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get destination => getField<String>('destination');
  set destination(String? value) => setField<String>('destination', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
