import 'dart:convert';

import '../../../../core/custom_exceptions.dart';
import '../../../../core/open_ai_data.dart';
import '../../../global/provider/provider.dart';
import '../model/text_completion_model.dart';
import '../remote_data_source/text_completion_remote_data_source.dart';

import 'package:http/http.dart' as http;

class TextCompletionRemoteDataSourceImpl
    implements TextCompletionRemoteDataSource {
  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String _endPoint = 'completions';

    Map<String, String> rawParams = {
      'model': 'text-davinci-003',
      'prompt': query
    };

    final encodedParams = json.encode(rawParams);

    final response = await httpClient.post(Uri.parse(endPoint(_endPoint)),
        body: encodedParams, headers: headerBearerOption(OPEN_AI_API_KEY));

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Text Completion Server Error");
    }
  }
}
