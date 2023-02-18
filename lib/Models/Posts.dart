

class Posts {
  int? iD;
  String? postAuthor;
  String? postDate;
  String? postContent;
  String? postTitle;
  String? postName;
  FeaturedMedia? featuredMedia;
  String? author;
  String? link;

  Posts(
      {this.iD,
        this.postAuthor,
        this.postDate,
        this.postContent,
        this.postTitle,
        this.postName,
        this.featuredMedia,
        this.author,
        this.link});

  Posts.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postAuthor = json['post_author'];
    postDate = json['post_date'];
    postContent = json['post_content'];
    postTitle = json['post_title'];
    postName = json['post_name'];
    featuredMedia = json['featured_media'] != null
        ? new FeaturedMedia.fromJson(json['featured_media'])
        : null;
    author = json['author'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['post_author'] = this.postAuthor;
    data['post_date'] = this.postDate;
    data['post_content'] = this.postContent;
    data['post_title'] = this.postTitle;
    data['post_name'] = this.postName;
    if (this.featuredMedia != null) {
      data['featured_media'] = this.featuredMedia!.toJson();
    }
    data['author'] = this.author;
    data['link'] = this.link;
    return data;
  }
}

class FeaturedMedia {
  String? medium;
  String? large;

  FeaturedMedia({this.medium, this.large});

  FeaturedMedia.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}
