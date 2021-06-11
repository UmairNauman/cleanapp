import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<String> uploadImage(File imgFile) async {
    return 'sdfsdf';
  }

  ///
  /// Uploads the images to firebase storage and returns
  /// the download URL.

  List<String> imagesUrl = [];
  Future<List<String>> uploadImageFiles(List<File> image) async {
    for (int i = 0; i < image.length; i++) {
      var fileName = image[i].path.split("/").last;
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('Post/$fileName');
      final UploadTask uploadTask = storageRef.putFile(image[i]);
      final StreamSubscription streamSubscription =
          uploadTask.snapshotEvents.listen((event) {
        switch (event.state) {
          case TaskState.success:
            print('Image Upload success');
//          _imageSavedSuccessfully();
            break;
          case TaskState.running:
            print('Image upload in progress');

            ///In Progress
            break;
          case TaskState.error:
//          _showSnackBar('Image Upload Failed. Please try again');
            break;
          case TaskState.paused:
//          _showSnackBar('Image Upload paused, Please check your internet');
            break;
          case TaskState.running:
            print('Image Upload resumed');
            break;
          case TaskState.canceled:
            // TODO: Handle this case.
            break;
        }
        print('EVENT ${event.state}');
      });
      TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final imgUrl = await snapshot.ref.getDownloadURL();
      streamSubscription.cancel();
      imagesUrl.add(imgUrl);
      print("The full url is $imagesUrl");
    }
    return imagesUrl;
  }

//   Future<String> uploadImageFiles(List<File> imgFiles) async {
//     for (int i = 0; i < image.length; i++) {

//     var filename = imgFiles.path.split("/").last;
//     final Reference storageRef =
//         FirebaseStorage.instance.ref().child('images/$filename');
//     final UploadTask uploadTask = storageRef.putFile(imgFiles);
//     final StreamSubscription streamSubscription =
//         uploadTask.snapshotEvents.listen((event) {
//       switch (event.state) {
//         case TaskState.success:
//           print('Image Upload success');
// //          _imageSavedSuccessfully();
//           break;
//         case TaskState.running:
//           print('Image upload in progress');

//           ///In Progress
//           break;
//         case TaskState.error:
// //          _showSnackBar('Image Upload Failed. Please try again');
//           break;
//         case TaskState.paused:
// //          _showSnackBar('Image Upload paused, Please check your internet');
//           break;
//         case TaskState.running:
//           print('Image Upload resumed');
//           break;
//         case TaskState.canceled:
//           // TODO: Handle this case.
//           break;
//       }
//       print('EVENT ${event.state}');
//     }});

//     TaskSnapshot snapShot = await uploadTask.whenComplete(() {});

//     final imgUrl = await snapShot.ref.getDownloadURL();
//     streamSubscription.cancel();
//     return imgUrl;
//   }
}
