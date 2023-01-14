import 'package:my_chatgpt/features/image_generations/data/model/image_generation_data.dart';

class ImageGenerationModel {
  final num created;
  final List<ImageGenerationData> data;

  ImageGenerationModel(this.created, this.data);

  factory ImageGenerationModel.fromJson(Map<String, dynamic> json) {
    final imageGenerationList = json['data'] as List;
    List<ImageGenerationData> imagesData = imageGenerationList
        .map((imageSingleData) => ImageGenerationData.fromJson(imageSingleData))
        .toList();

    return ImageGenerationModel(json['created'], imagesData);
  }
}
