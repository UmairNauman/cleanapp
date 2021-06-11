import 'package:cleanapp/core/models/app_user.dart';
import 'package:cleanapp/core/models/reports_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  List<String> imagesUrls = [];

  registerUser(AppUser user) async {
    print("User @Id => ${user.id}");
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } catch (e, s) {
      print('Exception @DatabaseService/registerUser');
      print(s);
    }
  }

  /// Get User from database using this funciton
  Future<AppUser> getUser(id) async {
    //Todo: Rename getUsers -> getUser
    print('@getUser: id: $id');
    try {
      final snapshot = await _db.collection('users').doc(id).get();
      print('User Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data());
    } catch (e, s) {
      print('Exception @DatabaseService/getUser');
      print(s);
      throw e;
    }
  }

  reports(Report userReports, String postType) async {
    await _db.collection('$postType').add(userReports.toJson());
  }

  // Future<List<String>> uploadFiles( _images) async {
  //   print('the image lenght is ${_images.length}');
  // await _images.forEach((image) async {
  //     var fileName =  image.path.split("/").last;
  //     Reference storageReference =
  //         FirebaseStorage.instance.ref().child('posts/$fileName');
  //     UploadTask uploadTask =  storageReference.putFile(image);
  //     print('Finally put files succesffully.............!');
  //      imagesUrls.add( await uploadTask.then((res) async{
  //       print(" url is ${res.ref.getDownloadURL()}");

  //  return   await res.ref.getDownloadURL();
  //     }));
  //   });
  //   print(" the images url is ${imagesUrls.map((e) => e)}");
  //   return imagesUrls;
  // }

  // Future<List<Report>>

  ///
  ///Get all open reports
  ///

  Future<List<Report>> getOpenReports() async {
    List<Report> reportList = [];
    try {
      final snapshot = await _db
          .collection('reports')
          .where('status', isEqualTo: 'open')
          .get();

      if (snapshot.docs.length == 0 || snapshot.docs.isEmpty) {
      } else {
        //    for(int i=0;i<snapshot.docs.length;i++){
        //    reportList.add(Report.fromJson(snapshot.docs[i]));
        //  }
        snapshot.docs.forEach((element) {
          reportList.add(Report.fromJson(element));
        });
      }
      return reportList;
    } catch (e) {
      throw e;
    }
  }

  ///
  ///Get all open complete
  ///

  Future<List<Report>> getCompleteReports() async {
    List<Report> reportList = [];
    try {
      final snapshot = await _db
          .collection('reports')
          .where('status', isEqualTo: 'completed')
          .get();

      if (snapshot.docs.length == 0 || snapshot.docs.isEmpty) {
      } else {
        //    for(int i=0;i<snapshot.docs.length;i++){
        //    reportList.add(Report.fromJson(snapshot.docs[i]));
        //  }
        snapshot.docs.forEach((element) {
          reportList.add(Report.fromJson(element));
        });
      }
      return reportList;
    } catch (e) {
      throw e;
    }
  }

  ///
  ///Get all open activity
  ///

  Future<List<Report>> getOpenActivity() async {
    List<Report> reportList = [];
    try {
      final snapshot = await _db
          .collection('activities')
          .where('status', isEqualTo: 'open')
          .get();

      if (snapshot.docs.length == 0 || snapshot.docs.isEmpty) {
      } else {
        //    for(int i=0;i<snapshot.docs.length;i++){
        //    reportList.add(Report.fromJson(snapshot.docs[i]));
        //  }
        snapshot.docs.forEach((element) {
          reportList.add(Report.fromJson(element));
        });
      }
      return reportList;
    } catch (e) {
      throw e;
    }
  }
}
