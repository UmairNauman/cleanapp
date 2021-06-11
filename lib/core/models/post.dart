class Post {
  String? name;
  String? profile;
  String? id;
  String? image;
  String? description;
  String? checkedIn;
  String? timeStamp;
  String? activitypost;
  String? like;
  String? dislike;
  String? countimage;

  Post(
      {this.name,
      this.profile,
      this.id,
      this.image,
      this.description,
      this.checkedIn,
      this.timeStamp,
      this.activitypost,
      this.like,
      this.dislike,
      this.countimage});

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profile = json['profile'];
    id = json['id'];
    image = json['image'];
    description = json['description'];
    checkedIn = json['checkedIn'];
    timeStamp = json['timeStamp'];
    activitypost = json['activitypost'];
    like = json['like'];
    dislike = json['dislike'];
    countimage = json['countimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['id'] = this.id;
    data['image'] = this.image;
    data['description'] = this.description;
    data['checkedIn'] = this.checkedIn;
    data['timeStamp'] = this.timeStamp;
    data['activitypost'] = this.activitypost;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    data['countimage'] = this.countimage;
    return data;
  }
}
