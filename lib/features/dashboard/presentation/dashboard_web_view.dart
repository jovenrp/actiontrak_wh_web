import 'package:actiontrak_wh/application/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../application/utils/app_colors.dart';
import '../../../application/widgets/texts/custom_greetings.dart';

class DashboardWebView extends StatelessWidget {
  const DashboardWebView({super.key, this.items, this.user, this.width = 1, this.height = 1, required this.screens, required this.screenIndex});

  final List<Map<String, dynamic>>? items;
  final String? user;
  final double width, height;
  final List<Widget> screens;
  final int screenIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: width * .1, right: width * .1),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomGreetings(
                    nickname: '$user!',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: width * .15,
                  height: height * .75,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                        color: AppColors.background
                    ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two items per row
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.0, // Aspect ratio of the grid items
                      ),
                      itemCount: items?.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: CustomIconButton(
                            icon: items?[index]['icon'],
                            label: items?[index]['label'],
                            onTap: items?[index]['onTap'],
                            textSize: 14,
                            iconSize: 30,
                            isActive: items?[index]['isActive'],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: screens[screenIndex],
              ),
            ),
          ],
        )
      ),
    );
  }

}