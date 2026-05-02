import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String get orderId => getField<String>('order_id')!;
  set orderId(String value) => setField<String>('order_id', value);

  String get bookingType => getField<String>('booking_type')!;
  set bookingType(String value) => setField<String>('booking_type', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  String? get departureCity => getField<String>('departure_city');
  set departureCity(String? value) => setField<String>('departure_city', value);

  String? get destination => getField<String>('destination');
  set destination(String? value) => setField<String>('destination', value);

  DateTime? get departureDate => getField<DateTime>('departure_date');
  set departureDate(DateTime? value) =>
      setField<DateTime>('departure_date', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  DateTime? get checkinDate => getField<DateTime>('checkin_date');
  set checkinDate(DateTime? value) => setField<DateTime>('checkin_date', value);

  DateTime? get checkoutDate => getField<DateTime>('checkout_date');
  set checkoutDate(DateTime? value) =>
      setField<DateTime>('checkout_date', value);

  String? get route => getField<String>('route');
  set route(String? value) => setField<String>('route', value);

  DateTime? get travelDate => getField<DateTime>('travel_date');
  set travelDate(DateTime? value) => setField<DateTime>('travel_date', value);

  int? get nights => getField<int>('nights');
  set nights(int? value) => setField<int>('nights', value);

  String? get pnrCode => getField<String>('pnr_code');
  set pnrCode(String? value) => setField<String>('pnr_code', value);

  String? get confirmationCode => getField<String>('confirmation_code');
  set confirmationCode(String? value) =>
      setField<String>('confirmation_code', value);

  String? get ticketNumber => getField<String>('ticket_number');
  set ticketNumber(String? value) => setField<String>('ticket_number', value);

  String? get pdfUrl => getField<String>('pdf_url');
  set pdfUrl(String? value) => setField<String>('pdf_url', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
