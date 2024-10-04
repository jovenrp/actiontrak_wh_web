import 'package:actiontrak_wh/application/utils/app_colors.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;
  final double borderRadius;
  final Color backgroundColor;
  final double padding;

  const ProfileContainer({
    super.key,
    required this.name,
    required this.imageUrl,
    this.bio = '',
    this.borderRadius = 12.0,
    this.backgroundColor = Colors.white,
    this.padding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes the shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent,
            child: CustomHeader(
              text: getInitials(name),
              fontSize: 44,
              color: AppColors.surface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (bio.isNotEmpty)
            CustomText(
              text: bio,
              fontSize: 14,
            ),
        ],
      ),
    );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    if (nameParts.length > 1) {
      initials = nameParts[0][0] + nameParts[1][0];
    } else {
      initials = nameParts[0][0];
    }
    return initials.toUpperCase();
  }
}
