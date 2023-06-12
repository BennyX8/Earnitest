import 'dart:convert';
import 'package:earnitest/features/gallery/app/bloc/gallery_bloc.dart';
import 'package:earnitest/features/gallery/data/repository/gallery_repository_impl.dart';
import 'package:earnitest/features/gallery/data/sources/gallery_service.dart';
import 'package:earnitest/features/gallery/domain/repository/gallery_repository.dart';
import 'package:earnitest/features/gallery/domain/usecases/get_photos.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/dependencies/network_info.dart';

/// Dependency Injection file from GetIt
/// For managing internal and external dependencies

final sl = GetIt.instance;

Future<void> init() async {
  //* BLOCS
  sl.registerFactory(() => GalleryBloc(sl()));

  //* USECASES
  sl.registerLazySingleton(() => GetPhotos(sl()));

  //* REPOSITORIES
  sl.registerLazySingleton<GalleryRepository>(
      () => GalleryRepositoryImpl(sl(), sl()));

  //* DATA SERVICES
  sl.registerLazySingleton<GalleryService>(() => GalleryServiceImpl(sl()));

  //* CORE
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //* EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => json);
}
