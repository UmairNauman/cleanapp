import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:flutter/cupertino.dart';

class LocationScreenViewModel extends ChangeNotifier {
  LocationScreenViewModel() {
    getAllPosts();
  }

  List<Post> _post = [];

  List get post => _post;

  getAllPosts() async {
    _post.add(Post(
      
        checkedIn: "peshawar,pakistan",
        description:
            "This place needs your attention. Please respond those who are in the area.",
        image: "$dynamicImage/completed1.png",
        profile: "$dynamicImage/profile.png",
        name: "John Deo",
        timeStamp: "May 15 2021 at 5:00PM",
        like: '400',
        dislike: '20',
        countimage: '1/4'));

    // notifyListeners();
  }
}
