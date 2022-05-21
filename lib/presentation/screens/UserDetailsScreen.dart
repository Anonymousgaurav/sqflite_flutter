import 'package:flutter/material.dart';
import 'package:ilaz/models/UserListModel.dart';
import 'package:ilaz/presentation/factories/IconButtonFactory.dart';
import 'package:ilaz/resources/ColorsRes.dart';

class UserDetailsScreen extends StatefulWidget {
  final String name;
  final String userName;
  final String email;
  final String profileImage;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String website;
  const UserDetailsScreen({
    required this.name,
    required this.userName,
    required this.email,
    required this.profileImage,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.website,
    Key? key,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageOrPlaceholder(),
              Text(this.widget.name),
              Text(this.widget.userName),
              Text(this.widget.email),
              Text(this.widget.street +
                  "  " +
                  this.widget.city +
                  ", " +
                  this.widget.zipcode),
              Text(this.widget.website),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageOrPlaceholder() {
    return this.widget.profileImage != null && this.widget.profileImage != ""
        ? this._buildProfileImage()
        : this._buildPlaceHolder();
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
        radius: _Dimens.USER_SIZE,
        backgroundImage: NetworkImage(this.widget.profileImage));
  }

  Widget _buildPlaceHolder() => Container(
          child: Container(
        padding: EdgeInsets.all(_Dimens.MID_SPACING),
        decoration: new BoxDecoration(
          color: ColorsRes.iconFillColor,
          shape: BoxShape.circle,
          border: new Border.all(
            color: ColorsRes.primaryColor,
            width: 1.0,
          ),
        ),
        child: new Center(
          child: IconButtonFactory.buildIcon(
              true, 0.8, Icons.person_outline_sharp),
        ),
      ));
}

abstract class _Dimens {
  static final double USER_SIZE = 35.0;
  static final double MID_SPACING = 16.0;
}
