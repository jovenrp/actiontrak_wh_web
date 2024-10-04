// ignore: unused_import
import 'dart:io';
import 'package:flutter/material.dart';


extension CharExtensions on String {
  int getFirstUpperCasePosition() {
    const String allCapitals = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    int index = 0;

    for (String letter in split('')) {
      if (allCapitals.contains(letter)) {
        return index;
      }
      index++;
    }

    return -1;
  }

  String capitalizeFirstofEach() {
    String str = this;
    return str.split(' ').map((String text) => text.capitalize()).join(' ');
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  bool equalsIgnoreCase(String compareString) {
    return (toLowerCase() == compareString.toLowerCase());
  }

  String capitalize() {
    String str = this;
    if (str.isEmpty) {
      return str;
    }

    return str[0].toUpperCase() + str.substring(1);
  }

  String camelCaseToSnakeCase() {
    int index = getFirstUpperCasePosition();
    String finalSnakeCase = this;
    while (index >= 0) {
      String preUpperCase = finalSnakeCase.substring(0, index);
      String upperCaseChar = finalSnakeCase.substring(index, index + 1);
      String postUpperCase =
          finalSnakeCase.substring(index + 1, finalSnakeCase.length);
      finalSnakeCase =
          '${preUpperCase}_${upperCaseChar.toLowerCase()}$postUpperCase';
      index = finalSnakeCase.getFirstUpperCasePosition();
    }

    return finalSnakeCase;
  }
}

extension ColorExtension on String {
  Color getColor() {
    return Color(int.parse(this, radix: 16));
  }
}

/*extension HiveUserToUserData on UserHive {
  UserData toUserData() {
    return UserData(
      id: id,
      firstname: firstname,
      lastname: lastname,
      nickname: nickname,
      password: password,
      email: email,
      mobile: mobile,
      role: role,
    );
  }
}

extension HiveProductToProductData on ProductHive {
  ProductData toProductData() {
    return ProductData(
      id: id,
      name: name,
      description: description,
      weight: weight,
      price: price,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension HiveSalesToSalesData on SalesHive {
  SalesData toSalesData() {
    return SalesData(
      id: id,
      transactionNo: transactionNo,
      total: total,
      products: sales?.map((productHive) => productHive.toProductData()).toList(),
      createdAt: createdAt,
      userId: userId,
    );
  }
}*/
