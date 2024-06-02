import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/database/app_session.dart';
import 'core/database/db_helper.dart';
import 'data/datasource/muslim_local_data_source.dart';
import 'data/datasource/muslim_remote_data_source.dart';
import 'data/repositories/muslim_repository_impl.dart';
import 'domain/repositories/muslim_repository.dart';
import 'domain/usecases/usecases.dart';
import 'presentation/bloc/bloc.dart';

final locator = GetIt.instance;

Future<void> injection() async {
  final appSession = await SharedPreferences.getInstance();

  // Bloc
  locator.registerFactory(
    () => SurahBloc(locator(), locator()),
  );
  locator.registerFactory(
    () => SholatBloc(locator(), locator(), locator()),
  );
  locator.registerFactory(
    () => LastReadBloc(locator(), locator()),
  );
  locator.registerFactory(
    () => HaditsBloc(locator()),
  );
  locator.registerFactory(
    () => DoaBloc(locator()),
  );
  locator.registerFactory(
    () => BookmarkBloc(locator(), locator(), locator()),
  );

  // UseCases
  locator.registerLazySingleton(
    () => GetAllBacaanSholatUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetAllBookmarkUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetAllDoaUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetAllHaditsUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetAllNiatSholatUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetAllSurahUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetDetailSurahUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetLastReadUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetSholatUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => RemoveBookmarkUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => SaveBookmarkUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => SaveLastReadUseCase(locator()),
  );

  // Repository
  locator.registerLazySingleton<MuslimRepository>(
    () => MuslimRepositoryImpl(locator(), locator()),
  );

  // DataSource
  locator.registerLazySingleton<MuslimRemoteDataSource>(
    () => MuslimRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<MuslimLocalDataSource>(
    () => MuslimLocalDataSourceImpl(locator(), locator()),
  );

  // Database
  locator.registerLazySingleton(
    () => AppSession(appSession),
  );
  locator.registerLazySingleton(
    () => DbHelper,
  );

  // External
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
