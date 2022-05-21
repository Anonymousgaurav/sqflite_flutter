import 'package:flutter/material.dart';
import 'package:ilaz/presentation/screens/UserDetailsScreen.dart';
import 'package:ilaz/utils/IlazRoutes.dart';
import 'package:ilaz/utils/TransparentPageRoute.dart';

abstract class IlazNavigator {
  static Future toCompanyDetails(
      BuildContext context,
      String name,
      String userName,
      String email,
      String image,
      String street,
      String suit,
      String city,
      String zipcode,
      String website) {
    return Navigator.of(context).push(TransparentPageRoute(
        settings: RouteSettings(name: IlazRoutes.companyDetails),
        builder: (BuildContext context) => UserDetailsScreen(
              name: name,
              userName: userName,
              email: email,
              profileImage: image,
              street: street,
              city: city,
              suite: suit,
              zipcode: zipcode,
              website: website,
            )));
  }
}
