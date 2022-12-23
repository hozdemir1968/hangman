import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes/dark_theme.dart';
import 'views/home_page.dart';
import 'views/score_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        fallbackLocale: const Locale('en'),
        path: 'assets/lang',
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme().theme,
      initialRoute: 'homePage',
      routes: {
        'homePage': (context) => HomePage(),
        'scorePage': (context) => const ScorePage(),
      },
    );
  }
}
