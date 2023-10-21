import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vca_chat/src/components/config/app_router.dart';
import 'package:vca_chat/src/components/data/bloc/internet_connection/internet_connection_bloc.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/core/base/injection.dart' as injection;
import 'package:vca_chat/src/modules/themes/themes.dart';

final _appRouter = AppRouter();

void main() async {
  await initLogs();
  await dotenv.load();
  await EasyLocalization.ensureInitialized();
  await injection.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injection.sl<InternetConnectionBloc>(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('es', ''),
          Locale('en', ''),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('es', ''),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'name'.tr(),
      theme: ChatAppTheme.lighTheme.copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(color: secondColor),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      debugShowCheckedModeBanner: dotenv.get('DEBUG') == 'true',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
