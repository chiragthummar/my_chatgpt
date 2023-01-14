import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custom_exceptions.dart';
import '../../domain/usecases/image_generation_usecase.dart';
import 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase}) : super(ImageGenerationInitial());


  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    try {
      final imageGenerationModelData = await imageGenerationUseCase.call(query);
      emit(ImageGenerationLoaded(imageGenerationModelData: imageGenerationModelData));
    } on SocketException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    }
  }


}