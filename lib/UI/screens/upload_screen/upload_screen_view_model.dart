import 'dart:io';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:cleanapp/core/enums/view_state.dart';
import 'package:cleanapp/core/enums/view_state_model.dart';
import 'package:cleanapp/core/models/post.dart';
import 'package:cleanapp/core/models/reports_user.dart';
import 'package:cleanapp/core/others/location_service.dart';
import 'package:cleanapp/core/services/database_service.dart';
import 'package:cleanapp/core/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:path_provider/path_provider.dart';

class UploadScreenViewModel extends BaseViewModel {
  UploadScreenViewModel() {
    getAllPosts();
  }

  final report = Report();
  final dbService = DatabaseService();
  final _locationService = LocationService();
  final storageService = StorageService();
  bool _activityPost = false;
  bool get activityPost => _activityPost;
  List<Post> _post = [];
  String _selectItem = '';
  String get selectItem => _selectItem;
  List<File> images = [];
  bool isPost = true;
  String dropDownValue = '      Select Type1';

  setItem(String selectItem) {
    _selectItem = selectItem;
    notifyListeners();
  }

  List get post => _post;

  // setState(bool activityPost) {
  //   _activityPost = activityPost;
  //   notifyListeners();
  // }

  getAllPosts() async {
    _post.add(Post(
      profile: "$dynamicImage/profile.png",
      name: "John Deo",
    ));
    // notifyListeners();
  }

  getLocation() async {
    report.location = await _locationService.getCurrentLocation();
    print(report.toJson());
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      images = result.paths.map((path) => File(path!)).toList();
    } else {
      print('else');
    }
    notifyListeners();
  }

  ///
  ///Upload data to database also set value to the Reports class variables
  ///

  Future uploadData() async {
    setState(ViewState.busy);

    final date = await NTP.now();
    DateTime todayDate = DateTime.now();
    report.timeStamp = todayDate;

    report.location = _locationService.geoPoint;
    report.imgUrls = await storageService.uploadImageFiles(images);
    storageService.uploadImageFiles(images);
    if (isPost) {
      dbService.reports(report, 'reports');
    } else {
      dbService.reports(report, 'activities');
    }

    setState(ViewState.idle);
  }

  void selectPostType(String value) {
    if (value == 'Post') {
      isPost = true;
      dropDownValue = value;
      print("ISPOST => $isPost");
    } else {
      isPost = false;
      dropDownValue = value;
    }
    notifyListeners();
  }

  // uploadImages() async {
  //   // getImageFileFromAssets(_images);
  //   setView(ViewState.busy);
  //   await dbService.uploadFiles(files);
  //   setView(ViewState.idle);
  // }

  ///
  ///convert assets into file
  ///

  // getImageFileFromAssets(asset) async {
  //   print("the first images lenght is ${asset.length}");
  //   asset.forEach((element) async {
  //     final byteData = await element.getByteData();
  //     final tempFile =
  //         File("${(await getTemporaryDirectory()).path}/${element.name}");
  //     final file = await tempFile.writeAsBytes(
  //       byteData.buffer
  //           .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  //     );

  //     files.add(file);
  //   });

  //   print("the file length is ${files.length}");
  // }
}
