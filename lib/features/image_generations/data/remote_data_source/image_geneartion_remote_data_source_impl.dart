import 'dart:convert';
import 'dart:io';

import 'package:my_chatgpt/core/custom_exceptions.dart';
import 'package:my_chatgpt/core/open_ai_data.dart';
import 'package:my_chatgpt/features/global/provider/provider.dart';
import 'package:my_chatgpt/features/image_generations/data/model/image_geneartion_model.dart';
import 'package:my_chatgpt/features/image_generations/data/remote_data_source/image_generation_remote_data_source.dart';

import 'package:http/http.dart' as http;

class ImageGenerationRemoteDataSourceImpl
    extends ImageGenerationRemoteDataSource {
  final http.Client httpClient;

  ImageGenerationRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ImageGenerationModel> getGenerateImages(String query) async {
    final String _endPoint = 'images/generations';

    Map<String, dynamic> rawParams = {
      "n": 10,
      "size": "256x256",
      "prompt": query
    };

    final encodedParams = json.encode(rawParams);

    final response = await httpClient.post(Uri.parse(endPoint(_endPoint)),
        body: encodedParams, headers: headerBearerOption(OPEN_AI_API_KEY));

    if (response.statusCode == 200) {
      return ImageGenerationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: 'Image Generation Server Problem');
    }
  }
}
