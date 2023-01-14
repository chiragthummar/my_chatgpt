import 'package:my_chatgpt/features/image_generations/data/model/image_geneartion_model.dart';

abstract class ImageGenerationRepository {
  Future<ImageGenerationModel> getImageGeneration(String query);
}
