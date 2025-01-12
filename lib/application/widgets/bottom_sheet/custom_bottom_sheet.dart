import 'package:actiontrak_wh/application/widgets/buttons/custom_button.dart';
import 'package:actiontrak_wh/application/widgets/textfields/custom_textfield.dart';
import 'package:actiontrak_wh/application/widgets/texts/custom_header.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {

  static void show(
    BuildContext context, {
    required TextEditingController nameController,
    required TextEditingController codeController,
    required TextEditingController serialController,
    String? title,
        GlobalKey? key,
    VoidCallback? submit,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Handle keyboard padding
          ),
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.house_outlined, size: 30,),
                      const SizedBox(width: 10,),
                      CustomHeader(text: title, fontWeight: FontWeight.w900,),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(hintText: 'Name', icon: Icons.abc, controller: nameController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },),
                  const SizedBox(height: 15),
                  CustomTextField(hintText: 'Code', icon: Icons.code, controller: codeController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Code is required';
                    }
                    return null;
                  },),
                  const SizedBox(height: 15),
                  CustomTextField(hintText: 'Serial No', icon: Icons.numbers_outlined, controller: serialController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Serial No is required';
                    }
                    return null;
                  },),
                  const SizedBox(height: 15),
                  CustomButton(
                      text: 'Submit',
                      onPressed: submit ?? (){
                        print('asdasd');
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isSecondaryButton: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
