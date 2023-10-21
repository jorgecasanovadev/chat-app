import 'package:get_it/get_it.dart';
import 'package:vca_chat/src/components/data/bloc/internet_connection/internet_connection_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(InternetConnectionBloc.new);
}
