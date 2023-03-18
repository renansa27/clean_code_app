import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_project/app/app_prefs.dart';
import 'package:tut_project/app/constant.dart';
import 'package:tut_project/data/data_source/remote_data_source.dart';
import 'package:tut_project/data/network/app_api.dart';
import 'package:tut_project/data/network/dio_factory.dart';
import 'package:tut_project/data/network/network_info.dart';
import 'package:tut_project/data/repository/repository_impl.dart';
import 'package:tut_project/domain/repository/repository.dart';
import 'package:tut_project/domain/usecase/login_usecase.dart';
import 'package:tut_project/views/login/login_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //Shared Preferences instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //AppPreferences instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  //Network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio factory instance
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreferences>()));

  //App Service client
  Dio dioInstance = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(dioInstance, baseUrl: Constant.baseUrl));

  // Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(instance<AppServiceClient>()));

  // Repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

// It will be added on Routes Manager, so every time that I call login page it will create an instance
initLoginModule() {
  // Check whether an instance of LoginUseCase is already created before create a new LoginUseCase instance.
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
    instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance<LoginUseCase>()));
  }
}
