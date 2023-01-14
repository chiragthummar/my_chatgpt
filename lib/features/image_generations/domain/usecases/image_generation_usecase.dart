import 'package:my_chatgpt/features/image_generations/data/model/image_geneartion_model.dart';
import 'package:my_chatgpt/features/image_generations/domain/repositories/image_generation_respository.dart';

class ImageGenerationUseCase {
  final ImageGenerationRepository repository;

  ImageGenerationUseCase({required this.repository});

  Future<ImageGenerationModel> call(String query) async {
    return repository.getImageGeneration(query);
  }
}
