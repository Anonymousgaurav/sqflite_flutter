import 'package:flutter/material.dart';
import 'package:ilaz/database/database_utils.dart';
import 'package:ilaz/models/UserListModel.dart';
import 'package:ilaz/network/NetConfig.dart';
import 'package:ilaz/presentation/widgets/UserProfileWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:ilaz/utils/WidgetFactory.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = new DatabaseHelper();
  List<UserListModel> userDetails = [];
  var loading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: WidgetFactory.buildLoading())
          : UserProfileWidget(userListModel: userDetails),
    );
  }

  Future<List<UserListModel>?> _fetchData() async {
    List<UserListModel> userModels = await db.getAllEmployees();
    if (userModels.length == 0) {
      final responseData = await http.get(Uri.parse(NetConfig.getUserLists()));
      if (responseData.statusCode == 200) {
        final data = jsonDecode(responseData.body);
        setState(() {
          for (Map userLists in data) {
            userDetails
                .add(UserListModel.fromJson(userLists as Map<String, dynamic>));
          }
          loading = false;
        });

        userDetails.forEach((userLists) {
          return _handleSubmitItem(userLists);
        });

        setState(() {
          loading = false;
        });
      }
    } else {
      setState(() {
        loading = false;
      });
      return _readItems(userModels);
    }
  }

  void _handleSubmitItem(UserListModel userListModel) async {
    await db.saveItem(userListModel);
  }

  List<UserListModel> _readItems(List<UserListModel> userModels) {
    userDetails.addAll(userModels);
    return userModels;
  }
}
