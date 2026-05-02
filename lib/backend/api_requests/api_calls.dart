import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OldSearchFlightsCall {
  static Future<ApiCallResponse> call({
    String? origin = 'PHX',
    String? destination = 'LAS',
    String? date = '2026-04-20',
    String? adults = '1',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OldSearchFlights',
      apiUrl: 'https://federal-varsity-pound.ngrok-free.dev/api/flights/search',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
      },
      params: {
        'origin': origin,
        'destination': destination,
        'date': date,
        'adults': adults,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static dynamic flights(dynamic response) => getJsonField(
        response,
        r'''$.flights''',
      );
  static String? flightsId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.flights[0].id''',
      ));
  static String? firstAirline(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.flights[0].airline''',
      ));
  static int? firstPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.flights[0].price''',
      ));
  static String? firstOrigin(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.flights[0].origin''',
      ));
  static String? firstDestination(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.flights[0].destination''',
      ));
  static String? firstDestinationTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.flights[0].departureTime''',
      ));
  static String? firstArrivalTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.flights[0].arrivalTime''',
      ));
  static int? adults(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.flights[0].adults''',
      ));
}

class SearchFlightsSerpCall {
  static Future<ApiCallResponse> call({
    String? departureId = 'LAX',
    String? arrivalId = 'JFK',
    String? outboundDate = '2026-06-20',
    int? adults = 1,
    String? currency = 'USD',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchFlightsSerp',
      apiUrl: 'https://d284isbgwqxlc3.cloudfront.net/api/flights/search',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
      },
      params: {
        'departure_id': departureId,
        'arrival_id': arrivalId,
        'outbound_date': outboundDate,
        'adults': adults,
        'currency': currency,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingOptionsCall {
  static Future<ApiCallResponse> call({
    String? bookingToken =
        'WyJDalJJYjFGU1NUYzFMVEJ1VVdOQlMzQm9VVUZDUnkwdExTMHRMUzB0TFhaMGNXVXhORUZCUVVGQlIyNXNVV1JSUlVReVFWVkJFZ1ZCUVRFeE9Cb0xDSWkvQWhBQ0dnTlZVMFE0SEhDSXZ3ST0iLFtbIkxBWCIsIjIwMjYtMDQtMjAiLCJKRksiLG51bGwsIkFBIiwiMTE4Il1dXQ==',
    String? origin = 'JFK',
    String? destination = 'LAX',
    String? departureDate = '2026-06-20',
    String? triptype = 'one_way',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetBookingOptions',
      apiUrl:
          'https://d284isbgwqxlc3.cloudfront.net/api/flights/booking-options',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
      },
      params: {
        'booking_token': bookingToken,
        'departure_id': origin,
        'arrival_id': destination,
        'outbound_date': departureDate,
        'trip_type': triptype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? options(dynamic response) => getJsonField(
        response,
        r'''$.options''',
        true,
      ) as List?;
  static List<String>? seller(dynamic response) => (getJsonField(
        response,
        r'''$.options[:].seller''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.options[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? bookingurl(dynamic response) => (getJsonField(
        response,
        r'''$.options[:].booking_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class HotelSearchSerpCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'HotelSearchSerp',
      apiUrl: 'https://d284isbgwqxlc3.cloudfront.net/api/hotels',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': '1',
      },
      params: {
        'destination': "Kuala Lumpur",
        'checkIn': "2026-04-25",
        'checkOut': "2026-04-27",
        'adults': "2",
        'currency': "USD",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? hotels(dynamic response) => getJsonField(
        response,
        r'''$.hotels''',
        true,
      ) as List?;
}

class SendChatMessageCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? historyText = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "${escapeStringForJson(message)}",
  "history_text": "${escapeStringForJson(historyText)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendChatMessage',
      apiUrl:
          'http://Kitravia-env.eba-rmn3zkmc.us-east-1.elasticbeanstalk.com/chat_new',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? reply(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reply''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
