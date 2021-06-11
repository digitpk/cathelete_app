import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'
import 'package:cathelete/blocs/article_notification_bloc.dart';
import 'package:cathelete/blocs/custom_notification_bloc.dart';
import 'package:cathelete/blocs/internet_bloc.dart';
import 'package:cathelete/blocs/notification_bloc.dart';
import 'package:cathelete/blocs/share_bloc.dart';
import 'package:cathelete/blocs/search_bloc.dart';
import 'package:cathelete/blocs/sign_in_bloc.dart';
import 'package:cathelete/blocs/theme_bloc.dart';
import 'package:cathelete/blocs/videos_bloc.dart';
import 'package:cathelete/pages/splash.dart';
import 'package:provider/provider.dart';
import 'models/theme_model.dart';

import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark));
  runApp(EasyLocalization(
    supportedLocales: [Locale('en')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    // startLocale: Locale('en'),
    useOnlyLangCode: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(
        builder: (_, mode, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<InternetBloc>(
                create: (context) => InternetBloc(),
              ),
              ChangeNotifierProvider<SignInBloc>(
                create: (context) => SignInBloc(),
              ),
              ChangeNotifierProvider<SearchBloc>(
                  create: (context) => SearchBloc()),
              ChangeNotifierProvider<NotificationBloc>(
                  create: (context) => NotificationBloc()),
              ChangeNotifierProvider<CustomNotificationBloc>(
                  create: (context) => CustomNotificationBloc()),
            ],
            child: MaterialApp(
                // supportedLocales: context.supportedLocales,
                // localizationsDelegates: context.localizationDelegates,
                // locale: context.locale,
                // navigatorObservers: [firebaseObserver],
                theme: ThemeModel().lightMode,
                darkTheme: ThemeModel().darkMode,
                themeMode:
                    mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: SplashPage()),
          );
        },
      ),
    );
  }
}
