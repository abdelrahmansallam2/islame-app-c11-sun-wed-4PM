import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/quran/item_sura_name.dart';
import 'package:islame_app/quran/sura_details_screen.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class Qurantab extends StatelessWidget {
  Qurantab({super.key});

  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/quran logo.png',
          scale: 1.1,
        ),
        Divider(
          height: 10,
          thickness: 3,
          color: Theme.of(context).dividerTheme.color,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              AppLocalizations.of(context)!.sura_number,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor),
            )),
            SizedBox(
              height: 40,
              child: VerticalDivider(
                color: Theme.of(context).dividerTheme.color,
                thickness: 2,
              ),
            ),
            Expanded(
                child: Text(
              AppLocalizations.of(context)!.sura_name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.isDark()
                      ? AppColorsdark.whitecolor
                      : AppColors.blackcolor),
            )),
          ],
        ),
        Divider(
          height: 10,
          thickness: 3,
          color: Theme.of(context).dividerTheme.color,
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 10,
                    thickness: 2,
                    color: Theme.of(context).dividerTheme.color,
                  );
                },
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: SuraData(
                                suraName: names[index],
                                suraNumber: (index + 1).toString()));
                      },
                      child: ItemSuraName(
                        data: SuraData(
                            suraName: names[index],
                            suraNumber: (index + 1).toString()),
                      ));
                }))
      ],
    );
  }
}

class SuraData {
  final String suraName;
  final String suraNumber;

  SuraData({required this.suraName, required this.suraNumber});
}
