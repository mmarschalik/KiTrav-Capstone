import '../database.dart';

class TripPreferencesTable extends SupabaseTable<TripPreferencesRow> {
  @override
  String get tableName => 'trip_preferences';

  @override
  TripPreferencesRow createRow(Map<String, dynamic> data) =>
      TripPreferencesRow(data);
}

class TripPreferencesRow extends SupabaseDataRow {
  TripPreferencesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripPreferencesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double? get budgetMin => getField<double>('budget_min');
  set budgetMin(double? value) => setField<double>('budget_min', value);

  double? get budgetMax => getField<double>('budget_max');
  set budgetMax(double? value) => setField<double>('budget_max', value);

  String? get preferredCurrency => getField<String>('preferred_currency');
  set preferredCurrency(String? value) =>
      setField<String>('preferred_currency', value);

  String? get preferredAirline => getField<String>('preferred_airline');
  set preferredAirline(String? value) =>
      setField<String>('preferred_airline', value);

  int? get preferredHotelClass => getField<int>('preferred_hotel_class');
  set preferredHotelClass(int? value) =>
      setField<int>('preferred_hotel_class', value);

  String? get seatPreference => getField<String>('seat_preference');
  set seatPreference(String? value) =>
      setField<String>('seat_preference', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
