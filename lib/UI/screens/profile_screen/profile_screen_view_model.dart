import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreenViewModel extends ChangeNotifier {
  ProfileScreenViewModel() {
    getAllPosts();
  }

  bool _activityPost = false;
  bool get activityPost => _activityPost;
  List<Post> _post = [];

  List get post => _post;

  setState(bool activityPost) {
    _activityPost = activityPost;
    notifyListeners();
  }

  //  setState(List<Post> post){

  //       _post = post;
  //       notifyListeners();

  //  }

  getAllPosts() async {
    _post.add(Post(
      image: "$dynamicImage/home1.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/completed1.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/home2.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/completed2.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
      _post.add(Post(
      image: "$dynamicImage/home1.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/completed1.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/home2.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    _post.add(Post(
      image: "$dynamicImage/completed2.png",
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    // notifyListeners();
  }
}
