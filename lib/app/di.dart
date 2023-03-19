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
import 'package:tut_project/views/login/cubit/auth_cubit.dart';
//import 'package:tut_project/views/login/login_viewmodel.dart';

final getItInstance = GetIt.instance;

Future<void> initAppModule() async {
  //Shared Preferences instance
  final sharedPrefs = await SharedPreferences.getInstance();
  getItInstance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //AppPreferences instance
  getItInstance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(getItInstance<SharedPreferences>()));

  //Network info
  getItInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio factory instance
  getItInstance.registerLazySingleton<DioFactory>(
      () => DioFactory(getItInstance<AppPreferences>()));

  //App Service client
  Dio dioInstance = await getItInstance<DioFactory>().getDio();
  getItInstance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(dioInstance, baseUrl: Constant.baseUrl));

  // Remote Data Source
  getItInstance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(getItInstance<AppServiceClient>()));

  // Repository
  getItInstance.registerLazySingleton<Repository>(() => RepositoryImpl(
      getItInstance<RemoteDataSource>(), getItInstance<NetworkInfo>()));
}

// It will be added on Routes Manager, so every time that I call login page it will create an instance
initLoginModule() {
  // Check whether an instance of LoginUseCase is already created before create a new LoginUseCase instance.
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    getItInstance.registerFactory<LoginUseCase>(
        () => LoginUseCase(getItInstance<Repository>()));
    /* instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance<LoginUseCase>())); */
    //Bloc AuthCubit
    getItInstance.registerFactory<AuthCubit>(
        () => AuthCubit(getItInstance<LoginUseCase>()));
  }

  /* if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
    instance
        .registerFactory<AuthCubit>(() => AuthCubit(instance<LoginUseCase>()));
  } */
}
