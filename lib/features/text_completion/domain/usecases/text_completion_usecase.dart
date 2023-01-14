import '../repositories/text_completion_repository.dart';
import '../../data/model/text_completion_model.dart';

class TextCompletionUseCase {
  final TextCompletionRepository repository;

  TextCompletionUseCase({required this.repository});

  Future<TextCompletionModel> call(String query) {
    return repository.getTextCompletion(query);
  }
}
