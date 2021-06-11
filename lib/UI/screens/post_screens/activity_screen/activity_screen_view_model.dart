import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:cleanapp/core/models/reports_user.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../../locator.dart';

class ActivityScreenViewMode extends BaseViewModel {
  ActivityScreenViewMode() {
    getAllPosts();
  }
  final databseService = locator<DatabaseService>();
  List<Report> activityList = [];
  // List<Post> _post = [];
  // List get post => _post;

  //  setState(List<Post> post){

  //       _post = post;
  //       notifyListeners();

  //  }

  getAllPosts() async {
    setState(ViewState.busy);
    activityList = await databseService.getOpenActivity();
    setState(ViewState.idle);
  }
}
