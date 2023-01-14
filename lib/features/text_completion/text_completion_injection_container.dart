import 'package:my_chatgpt/features/text_completion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:my_chatgpt/features/text_completion/data/remote_data_source/text_completion_remote_data_source_impl.dart';
import 'package:my_chatgpt/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:my_chatgpt/injection_container.dart';

import 'data/repositories/text_completion_repositor_impl.dart';
import 'domain/repositories/text_completion_repository.dart';
import 'domain/usecases/text_completion_usecase.dart';

Future<void> textCompletionInjectionContainer() async{

  //Futures bloc
  sl.registerFactory<TextCompletionCubit>(
        () => TextCompletionCubit(
      textCompletionUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<TextCompletionUseCase>(() => TextCompletionUseCase(
    repository: sl.call(),
  ));
  //repository
  sl.registerLazySingleton<TextCompletionRepository>(
          () => TextCompletionRepositoryImpl(
        remoteDataSource: sl.call(),
      ));
  //remote data
  sl.registerLazySingleton<TextCompletionRemoteDataSource>(
          () => TextCompletionRemoteDataSourceImpl(
        httpClient: sl.call(),
      ));
}