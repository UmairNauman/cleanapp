import 'package:cloud_firestore/cloud_firestore.dart';

///
/// [status] can have the following values:
/// 1) open
/// 2) reported
/// 3) spammed
///

class Report {
  String? description;
  List<String>? imgUrls;
  GeoPoint? location;
  int? noOfDownVotes;
  int? noOfUpvotes;
  String? status;
  DateTime? timeStamp;
  String? userAvatarUrl;
  String? userId;
  String? userName;
  // String? Address;

  Report(
      {this.description,
      this.imgUrls,
      this.location,
      this.noOfDownVotes,
      this.noOfUpvotes,
      this.status,
      this.timeStamp,
      this.userAvatarUrl,
      this.userId,
      this.userName});

  Report.fromJson(json) {
    description = json['description'];
    imgUrls = json['imgUrls'].cast<String>(); //json['imgUrls'];
    location = json['location'];
    noOfDownVotes = json['noOfDownVotes'];
    noOfUpvotes = json['noOfUpvotes'];
    status = json['status'];
    timeStamp = json['timeStamp'].toDate();
    userAvatarUrl = json['userAvatarUrl'];
    // userId = json['userId'];
    userName = json['userName'];
    // Address = await LocationService.getAddressFromLatLng(location);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['imgUrls'] = this.imgUrls;
    data['location'] = this.location;
    data['noOfDownVotes'] = this.noOfDownVotes ?? 0;
    data['noOfUpvotes'] = this.noOfUpvotes ?? 0;
    data['status'] = this.status ?? 'open';
    data['timeStamp'] = this.timeStamp;
    data['userAvatarUrl'] = this.userAvatarUrl;
    // data['userId'] = this.userId;
    data['userName'] = this.userName ?? 'umair';
    return data;
  }


}
