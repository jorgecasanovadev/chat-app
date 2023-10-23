import 'package:get_it/get_it.dart';
import 'package:vca_chat/src/components/data/bloc/auth/auth_bloc.dart';
import 'package:vca_chat/src/components/data/bloc/internet_connection/internet_connection_bloc.dart';
import 'package:vca_chat/src/components/data/bloc/session/session_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerLazySingleton(InternetConnectionBloc.new)
    ..registerFactory(() => SessionBloc(internetConnectionBloc: sl()))
    ..registerFactory(
      () => AuthBloc(sessionBloc: sl(), internetConnectionBloc: sl()),
    );
}
