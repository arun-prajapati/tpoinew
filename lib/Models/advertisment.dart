class Advertisment {
  int status;
  String content;

  Advertisment({this.status, this.content});

  Advertisment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['content'] = this.content;
    return data;
  }
}
