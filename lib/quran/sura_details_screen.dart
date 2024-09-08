import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/quran/quran_tab.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura details';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;
    var provider = Provider.of<SettingsProvider>(context);
    if (content.isEmpty) loadData(args.suraNumber);

    return Stack(children: [
      Image.asset(
        provider.getHomeBackGround(),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text(
              'اسلامي',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 80),
            padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 20),
            decoration: BoxDecoration(
                color: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffF8F8F8).withOpacity(.85),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      args.suraName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.isDark()
                              ? AppColorsdark.primarydarkcolor
                              : AppColors.blackcolor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.play_circle,
                        color: provider.isDark()
                            ? AppColorsdark.primarydarkcolor
                            : AppColors.blackcolor),
                  ],
                ),
                Divider(color: Theme.of(context).dividerTheme.color),
                versesList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                        color: provider.isDark()
                            ? AppColorsdark.primarydarkcolor
                            : AppColors.primarylightcolor,
                      ))
                    : Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                            child: Divider(
                              height: 2,
                              thickness: 3,
                              color: Theme.of(context).dividerTheme.color,
                            ),
                          ),
                          itemBuilder: (context, index) => Text(
                            '{${index + 1}} ${versesList[index]}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: provider.isDark()
                                        ? AppColorsdark.primarydarkcolor
                                        : AppColors.blackcolor),
                          ),
                          itemCount: versesList.length,
                        ),
                      )
              ],
            ),
          )),
    ]);
  }

  String content = '';
  List<String> versesList = [];

  Future<void> loadData(String suranumber) async {
    content = await rootBundle.loadString('assets/files/$suranumber.txt');
    versesList = content.split('\n');
    setState(() {});
    print(content);
  }
}
