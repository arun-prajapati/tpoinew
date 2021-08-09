import 'package:morbimirror/Models/Category.dart';
import 'package:morbimirror/Models/Posts.dart';

class AllData{

  List<Category> myCategories = new List();
  List<List<Posts>> myPostsList = new List();
  List<Posts> myPosts = new List();

  AllData({this.myCategories, this.myPostsList, this.myPosts});
}