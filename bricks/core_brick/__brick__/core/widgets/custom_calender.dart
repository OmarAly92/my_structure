import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/space_widgets.dart';

class CustomCalender extends StatefulWidget {
  const CustomCalender({super.key});

  @override
  State<CustomCalender> createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  int selectedIndex = 0;
  List<Map<String, String>>? week;

  @override
  void initState() {
    selectedIndex = getTodayIndex();
    week = getWeekDays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          getMonth(),
          style: AppTextStyle.style16SemiBold.copyWith(color: AppColors.zn25),
        ),
        AppText(
          getYear(),
          style: AppTextStyle.style12Medium.copyWith(color: AppColors.zn300),
        ),
        const VerticalSpace(10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(week!.length, (index) {
              final bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          children: [
                            Text(
                              week![index]['day']!,
                              style: AppTextStyle.style14Regular.copyWith(
                                color: AppColors.zn500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              week![index]['date']!,
                              style: AppTextStyle.style14Medium.copyWith(
                                color: AppColors.zn800,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          Text(
                            week![index]['day']!,
                            style: AppTextStyle.style14Regular.copyWith(
                              color: AppColors.zn500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            week![index]['date']!,
                            style: AppTextStyle.style14Regular.copyWith(
                              color: AppColors.zn300,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  String getYear() {
    final DateTime now = DateTime.now();
    return now.year.toString();
  }

  String getMonth() {
    final DateTime now = DateTime.now();
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[now.month - 1];
  }

  int getTodayIndex() {
    return DateTime.now().weekday - 1;
  }

  List<Map<String, String>> getWeekDays() {
    final DateTime now = DateTime.now();
    final int currentWeekday = now.weekday;
    final DateTime monday = now.subtract(Duration(days: currentWeekday - 1));

    const dayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return List.generate(7, (index) {
      final DateTime day = monday.add(Duration(days: index));
      return {'day': dayLetters[index], 'date': day.day.toString()};
    });
  }
}
