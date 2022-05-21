import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ilaz/models/UserListModel.dart';
import 'package:ilaz/presentation/factories/IconButtonFactory.dart';
import 'package:ilaz/resources/ColorsRes.dart';
import 'package:ilaz/utils/IlazNavigator.dart';
import 'package:ilaz/utils/WidgetFactory.dart';

class UserProfileItemWidget extends StatefulWidget {
  final UserListModel userListModel;
  final int index;
  final companyDetails;
  const UserProfileItemWidget({
    required this.userListModel,
    required this.index,
    required this.companyDetails,
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfileItemWidget> createState() => _UserProfileItemWidgetState();
}

class _UserProfileItemWidgetState extends State<UserProfileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              SchedulerBinding.instance?.addPostFrameCallback((_) {
                IlazNavigator.toCompanyDetails(
                  context,
                  this.widget.userListModel.name!,
                  this.widget.userListModel.username!,
                  this.widget.userListModel.email!,
                  this.widget.userListModel.profileImage!,
                  this.widget.userListModel.street!,
                  this.widget.userListModel.suite!,
                  this.widget.userListModel.city!,
                  this.widget.userListModel.zipcode!,
                  this.widget.userListModel.website!,
                );
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: _buildImageOrPlaceholder(),
                ),
                WidgetFactory.buildEmptyHorizontalSeparator(width: 15.0),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(this.widget.userListModel.name ?? ""),
                      Text(this.widget.userListModel.email ?? ""),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImageOrPlaceholder() {
    return this.widget.userListModel.profileImage != null &&
            this.widget.userListModel.profileImage != ""
        ? this._buildProfileImage()
        : this._buildPlaceHolder();
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
        radius: _Dimens.USER_SIZE,
        backgroundImage: NetworkImage(this.widget.userListModel.profileImage!));
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
