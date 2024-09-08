import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame_app/hadeth/hadeth_details_screen.dart';
import 'package:islame_app/home/home.dart';
import 'package:islame_app/my_them_data.dart';
import 'package:islame_app/quran/sura_details_screen.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      theme: MyThemData.lightmode,
      darkTheme: MyThemData.darkmode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentlanguge),
      themeMode: provider.currentthemmode,
    );
  }
}
