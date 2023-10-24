import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:vca_chat/firebase_options.dart';
import 'package:vca_chat/src/components/config/app_router.dart';
import 'package:vca_chat/src/components/helpers/helpers.dart';
import 'package:vca_chat/src/components/services/firebase/firebase_auth_service.dart';
import 'package:vca_chat/src/core/base/injection.dart' as injection;
import 'package:vca_chat/src/modules/themes/themes.dart';

final _appRouter = AppRouter();

void main() async {
  await initLogs();
  await dotenv.load();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injection.init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => FirebaseAuthService(),
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
        appBarTheme: Theme.of(context).appBarTheme.copyWith(color: firstColor),
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
