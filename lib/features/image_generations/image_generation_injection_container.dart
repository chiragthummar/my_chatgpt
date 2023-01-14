import '../../injection_container.dart';
import 'data/remote_data_source/image_geneartion_remote_data_source_impl.dart';
import 'data/remote_data_source/image_generation_remote_data_source.dart';
import 'data/repositories/image_generation_repository_impl.dart';
import 'domain/repositories/image_generation_respository.dart';
import 'domain/usecases/image_generation_usecase.dart';
import 'presentation/cubit/image_generation_cubit.dart';

Future<void> imageGenerationInjectionContainer() async {
  //Futures bloc
  sl.registerFactory<ImageGenerationCubit>(
    () => ImageGenerationCubit(
      imageGenerationUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<ImageGenerationUseCase>(() => ImageGenerationUseCase(
        repository: sl.call(),
      ));
  //repository
  sl.registerLazySingleton<ImageGenerationRepository>(
      () => ImageGenerationRepositoryImpl(
            remoteDataSource: sl.call(),
          ));
  //remote data
  sl.registerLazySingleton<ImageGenerationRemoteDataSource>(
      () => ImageGenerationRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
