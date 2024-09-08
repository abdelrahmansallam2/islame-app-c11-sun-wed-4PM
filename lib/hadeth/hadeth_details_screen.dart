import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/hadeth/hadeth_tab.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth details';

  HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var provider = Provider.of<SettingsProvider>(context);

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
              style: Theme.of(context).textTheme.bodyMedium,
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
                Text(
                  args.tittle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: provider.isDark()
                          ? AppColorsdark.primarydarkcolor
                          : AppColors.blackcolor),
                ),
                const SizedBox(
                  width: 10,
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Expanded(
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
                            args.body,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: provider.isDark()
                                        ? AppColorsdark.primarydarkcolor
                                        : AppColors.blackcolor),
                          ),
                      itemCount: 1),
                )
              ],
            ),
          )),
    ]);
  }
}
