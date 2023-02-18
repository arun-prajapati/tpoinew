import 'Posts.dart';

class MainCategory {
  String? parentCatName;
  int? parentCatId;
  List<Posts>? posts;
  List<Category>? category;

  MainCategory(
      {this.parentCatName, this.parentCatId, this.posts, this.category});

  MainCategory.fromJson(Map<String, dynamic> json) {
    parentCatName = json['parent_cat_name'];
    parentCatId = json['parent_cat_id'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_cat_name'] = this.parentCatName;
    data['parent_cat_id'] = this.parentCatId;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
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

class Category {
  String? catName;
  int? catId;
  List<Posts>? posts;

  Category({this.catName, this.catId, this.posts});

  Category.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    catId = json['cat_id'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_name'] = this.catName;
    data['cat_id'] = this.catId;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
