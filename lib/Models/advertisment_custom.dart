class Advertisement_Custom {
  int status;
  String content;

  Advertisement_Custom({this.status, this.content});

  Advertisement_Custom.fromJson(Map<String, dynamic> json) {
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
