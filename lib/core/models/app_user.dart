class AppUser {
  String? avatarImgUrl;
  String? email;
  String? fullName;
  String? noOfActivities;
  String? noOfReports;
  String? noOfUpvotes;
  String? id;
  String? password;

  AppUser({
    this.avatarImgUrl,
    this.email,
    this.fullName,
    this.noOfActivities,
    this.noOfReports,
    this.noOfUpvotes,
    this.id,
    this.password,
  });

  AppUser.fromJson(json) {
    avatarImgUrl = json['avatarImgUrl'];
    email = json['email'];
    fullName = json['fullName'];
    noOfActivities = json['noOfActivities'];
    noOfReports = json['noOfReports'];
    noOfUpvotes = json['noOfUpvotes'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarImgUrl'] = this.avatarImgUrl;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['noOfActivities'] = this.noOfActivities;
    data['noOfReports'] = this.noOfReports;
    data['noOfUpvotes'] = this.noOfUpvotes;
    data['id'] = this.id;
    return data;
  }
}
