import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';
import 'package:islame_app/settings_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 177,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(
          height: 57,
        ),
        Text('إذاعه القرأن الكريم'),
        SizedBox(
          height: 35,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              size: 30,
              color: provider.isDark()
                  ? AppColorsdark.primarydarkcolor
                  : AppColors.primarylightcolor,
            ),
            SizedBox(
              width: 75.5,
            ),
            Icon(
              Icons.play_arrow_sharp,
              size: 30,
              color: provider.isDark()
                  ? AppColorsdark.primarydarkcolor
                  : AppColors.primarylightcolor,
            ),
            SizedBox(
              width: 75.5,
            ),
            Icon(
              Icons.skip_next,
              size: 30,
              color: provider.isDark()
                  ? AppColorsdark.primarydarkcolor
                  : AppColors.primarylightcolor,
            ),
          ],
        ),
      ],
    );
  }
}
