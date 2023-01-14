import 'dart:convert';

import '../../../../core/custom_exceptions.dart';
import '../../../../core/open_ai_data.dart';
import '../model/text_completion_model.dart';
import '../remote_data_source/text_completion_remote_data_source.dart';

import 'package:http/http.dart' as http;

class TextCompletionRemoteDataSourceImpl
    implements TextCompletionRemoteDataSource {
  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  String _endPoint(String endPoint) => "$BASE_URL/$endPoint";

  Map<String, String> _headerBearerOption(String token) =>
      {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String endPoint = 'completions';

    Map<String, String> rawParams = {
      'model': 'text-davinci-003',
      'prompt': query
    };

    final encodedParams = json.encode(rawParams);

    final response = await httpClient.post(Uri.parse(_endPoint(endPoint)),
        body: encodedParams, headers: _headerBearerOption(OPEN_AI_API_KEY));

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Text Completion Server Error");
    }
  }
}
