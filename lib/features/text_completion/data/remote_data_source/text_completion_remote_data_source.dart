import '../../../text_completion/data/model/text_completion_model.dart';

abstract class TextCompletionRemoteDataSource {
  Future<TextCompletionModel> getTextCompletion(String query);
}
