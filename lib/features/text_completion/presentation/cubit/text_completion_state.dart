import 'package:equatable/equatable.dart';
import 'package:my_chatgpt/features/text_completion/data/model/text_completion_model.dart';

abstract class TextCompletionState extends Equatable {
  const TextCompletionState();
}

class TextCompletionInitial extends TextCompletionState {
  @override
  List<Object?> get props => [];
}

class TextCompletionLoading extends TextCompletionState {
  @override
  List<Object?> get props => [];
}

class TextCompletionLoaded extends TextCompletionState {
  final TextCompletionModel textCompletionModel;

  TextCompletionLoaded({required this.textCompletionModel});

  @override
  List<Object?> get props => [];
}

class TextCompletionFailure extends TextCompletionState {
  final String? errorMsg;

  TextCompletionFailure({required this.errorMsg});

  @override
  List<Object?> get props => [];
}
