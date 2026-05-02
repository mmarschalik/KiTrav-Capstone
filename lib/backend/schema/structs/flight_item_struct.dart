// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlightItemStruct extends BaseStruct {
  FlightItemStruct({
    /// flight id
    String? id,

    /// flight airline
    String? airline,

    /// flight price
    int? price,

    /// first origin
    List<String>? origin,

    /// first destination
    ///
    String? destination,

    /// first departuretime
    String? departureTime,

    /// first arrival time
    String? arrivalTime,

    /// # of adult passengers
    String? adults,
  })  : _id = id,
        _airline = airline,
        _price = price,
        _origin = origin,
        _destination = destination,
        _departureTime = departureTime,
        _arrivalTime = arrivalTime,
        _adults = adults;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "airline" field.
  String? _airline;
  String get airline => _airline ?? '';
  set airline(String? val) => _airline = val;

  bool hasAirline() => _airline != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "origin" field.
  List<String>? _origin;
  List<String> get origin => _origin ?? const [];
  set origin(List<String>? val) => _origin = val;

  void updateOrigin(Function(List<String>) updateFn) {
    updateFn(_origin ??= []);
  }

  bool hasOrigin() => _origin != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  set destination(String? val) => _destination = val;

  bool hasDestination() => _destination != null;

  // "departureTime" field.
  String? _departureTime;
  String get departureTime => _departureTime ?? '';
  set departureTime(String? val) => _departureTime = val;

  bool hasDepartureTime() => _departureTime != null;

  // "arrivalTime" field.
  String? _arrivalTime;
  String get arrivalTime => _arrivalTime ?? '';
  set arrivalTime(String? val) => _arrivalTime = val;

  bool hasArrivalTime() => _arrivalTime != null;

  // "adults" field.
  String? _adults;
  String get adults => _adults ?? '';
  set adults(String? val) => _adults = val;

  bool hasAdults() => _adults != null;

  static FlightItemStruct fromMap(Map<String, dynamic> data) =>
      FlightItemStruct(
        id: data['id'] as String?,
        airline: data['airline'] as String?,
        price: castToType<int>(data['price']),
        origin: getDataList(data['origin']),
        destination: data['destination'] as String?,
        departureTime: data['departureTime'] as String?,
        arrivalTime: data['arrivalTime'] as String?,
        adults: data['adults'] as String?,
      );

  static FlightItemStruct? maybeFromMap(dynamic data) => data is Map
      ? FlightItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'airline': _airline,
        'price': _price,
        'origin': _origin,
        'destination': _destination,
        'departureTime': _departureTime,
        'arrivalTime': _arrivalTime,
        'adults': _adults,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'airline': serializeParam(
          _airline,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'origin': serializeParam(
          _origin,
          ParamType.String,
          isList: true,
        ),
        'destination': serializeParam(
          _destination,
          ParamType.String,
        ),
        'departureTime': serializeParam(
          _departureTime,
          ParamType.String,
        ),
        'arrivalTime': serializeParam(
          _arrivalTime,
          ParamType.String,
        ),
        'adults': serializeParam(
          _adults,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlightItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlightItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        airline: deserializeParam(
          data['airline'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        origin: deserializeParam<String>(
          data['origin'],
          ParamType.String,
          true,
        ),
        destination: deserializeParam(
          data['destination'],
          ParamType.String,
          false,
        ),
        departureTime: deserializeParam(
          data['departureTime'],
          ParamType.String,
          false,
        ),
        arrivalTime: deserializeParam(
          data['arrivalTime'],
          ParamType.String,
          false,
        ),
        adults: deserializeParam(
          data['adults'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FlightItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FlightItemStruct &&
        id == other.id &&
        airline == other.airline &&
        price == other.price &&
        listEquality.equals(origin, other.origin) &&
        destination == other.destination &&
        departureTime == other.departureTime &&
        arrivalTime == other.arrivalTime &&
        adults == other.adults;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        airline,
        price,
        origin,
        destination,
        departureTime,
        arrivalTime,
        adults
      ]);
}

FlightItemStruct createFlightItemStruct({
  String? id,
  String? airline,
  int? price,
  String? destination,
  String? departureTime,
  String? arrivalTime,
  String? adults,
}) =>
    FlightItemStruct(
      id: id,
      airline: airline,
      price: price,
      destination: destination,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      adults: adults,
    );
