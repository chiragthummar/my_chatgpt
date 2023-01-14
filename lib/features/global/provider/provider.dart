

import '../../../core/open_ai_data.dart';

String endPoint(String endPoint) => "$BASE_URL/$endPoint";

  Map<String, String> headerBearerOption(String token) =>
      {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};