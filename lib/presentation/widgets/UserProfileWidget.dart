import 'package:flutter/material.dart';
import 'package:ilaz/models/UserListModel.dart';
import 'package:ilaz/presentation/widgets/UserProfileItemWidget.dart';

class UserProfileWidget extends StatefulWidget {
  final List<UserListModel> userListModel;
  const UserProfileWidget({required this.userListModel, Key? key})
      : super(key: key);

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return UserProfileItemWidget(
              userListModel: this.widget.userListModel[index],
              index: index,
              companyDetails: this.widget.userListModel[index],
            );
          },
          childCount: this.widget.userListModel.length,
        ),
      ),
    ]);
  }
}
