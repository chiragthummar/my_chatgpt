import 'package:my_chatgpt/features/image_generations/data/model/image_geneartion_model.dart';
import 'package:my_chatgpt/features/image_generations/domain/repositories/image_generation_respository.dart';

import '../remote_data_source/image_generation_remote_data_source.dart';

class ImageGenerationRepositoryImpl extends ImageGenerationRepository {
  final ImageGenerationRemoteDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageGenerationModel> getImageGeneration(String query) {
    return remoteDataSource.getGenerateImages(query);
  }
}
