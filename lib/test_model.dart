

class User {
  String username;
  String phoneNo;
  String countryCode;
  String image;
  String status;
  String email;
  String firebaseId;
  String apiToken;

  User(
      {this.username,
        this.phoneNo,
        this.countryCode,
        this.image,
        this.status,
        this.email,
        this.firebaseId,
        this.apiToken});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phoneNo = json['phone_no'];
    countryCode = json['country_code'];
    image = json['image'];
    status = json['status'];
    email = json['email'];
    firebaseId = json['firebase_id'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phone_no'] = this.phoneNo;
    data['country_code'] = this.countryCode;
    data['image'] = this.image;
    data['status'] = this.status;
    data['email'] = this.email;
    data['firebase_id'] = this.firebaseId;
    data['api_token'] = this.apiToken;
    return data;
  }
}
