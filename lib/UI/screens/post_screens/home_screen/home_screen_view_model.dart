import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:cleanapp/core/models/reports_user.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:cleanapp/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';

class HomeScreenViewMode extends BaseViewModel {
  HomeScreenViewMode() {
    getAllPosts();
  }
  final databseService = locator<DatabaseService>();
  // List<Post> _post = [];

  // List get post => _post;

  List<String>? postAddress;

  List<Report> reportsList = [];

  //  setState(List<Post> post){

  //       _post = post;
  //       notifyListeners();

  //  }

    getAllPosts() async {
      setState(ViewState.busy);
      reportsList = await databseService.getOpenReports();
      _getAddressFromLatLng(reportsList);
      setState(ViewState.idle);
    }

  _getAddressFromLatLng(List<Report> checkedIn) async {
    setState(ViewState.busy);

    for (int i = 0; i < checkedIn.length; i++) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            checkedIn[i].location!.latitude, checkedIn[i].location!.longitude);

        Placemark place = placemarks[0];

        postAddress!.add(
            " ${place.locality.toString()} , ${place.country.toString()}");

        print("the post address is  $postAddress ");
      } catch (e) {
        print("the exception is $e");
      }
    }
    setState(ViewState.idle);
  }
}

class GlobalViewModel extends ChangeNotifier {
  int _imageCount = 0;
  int get imageCount => _imageCount;

  setImageCount(int imageCount) {
    _imageCount = imageCount;
    notifyListeners();
  }
}
