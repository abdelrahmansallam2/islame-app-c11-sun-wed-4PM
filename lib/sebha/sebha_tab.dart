import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> Azkar = [
    'سبحان الله',
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];
  int index = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(provider.isDark()
                ? 'assets/images/head_sebha_dark.png'
                : 'assets/images/head_sebha_logo.png'),
            Padding(
                padding: EdgeInsets.only(top: 70),
                child: Transform.rotate(
                  angle: angle,
                  child: GestureDetector(
                    onTap: () {
                      ontap();
                    },
                    child: Image.asset(provider.isDark()
                        ? 'assets/images/body_sebha_dark.png'
                        : 'assets/images/body_sebha_logo.png'),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 43,
        ),
        Text(
          'التسبيحات',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: provider.isDark()
                  ? AppColorsdark.primarydarkcolor
                  : AppColors.blackcolor),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 26,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDark()
                    ? Color(0xff141A2E).withOpacity(.85)
                    : Color(0xffB7935F).withOpacity(.85)),
            child: Text(
              '$counter',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor),
            ),
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDark()
                    ? AppColorsdark.primarydarkcolor
                    : AppColors.primarylightcolor),
            child: Text(
              '${Azkar[index]}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: provider.isDark()
                      ? AppColorsdark.blackcolor
                      : AppColors.blackcolor),
            ),
          ),
        ),
      ],
    );
  }

  void ontap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
