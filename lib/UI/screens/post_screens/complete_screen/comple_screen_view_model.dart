import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:cleanapp/core/models/reports_user.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';

import '../../../../locator.dart';

class CompleteScreenViewMode extends BaseViewModel {
  CompleteScreenViewMode() {
    getAllPosts();
  }

  // List<Post> _post = [];
  final databseService = locator<DatabaseService>();
  // List get post => _post;
  List<Report> reportsList = [];

  getAllPosts() async {
    setState(ViewState.busy);
    reportsList = await databseService.getCompleteReports();

    setState(ViewState.idle);
  }

  //  setState(List<Post> post){

  //       _post = post;
  //       notifyListeners();

  //  }

}
