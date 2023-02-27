import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Category.dart';

const String BaseURL = "https://thepressofindia.com/";
//const String BaseURL = "https://morbimirror.com/";
const String urlForTopBarCategories = BaseURL + "wp-json/wp/v2/categories?per_page=100&hide_empty=true";
const String urlForMenu = BaseURL + "wp-json/wp/v2/menu";
const String urlForTopBarSubCategories = BaseURL + "wp-json/wp/v2/categories?per_page=100&order=desc&hide_empty=true&parent=";

const String privacyPolicy = "${BaseURL}wp-json/wp/v2/pages/3";
const String aboutUs = "${BaseURL}wp-json/wp/v2/pages/17313";
const String faq = "${BaseURL}wp-json/wp/v2/pages/17315";

class DatabaseHelper {
  static Future getAllCat() async {
    print('Getting Data');
    await http.get(Uri.parse("https://thepressofindia.com/wp-json/wp/v2/subcat_posts")).then((value) {
      print("====");
      var parsedData = jsonDecode(value.body);
     Global.mainCategory =(parsedData as List).map((e) => MainCategory.fromJson(e)).toList();
      print(value.body);
      print("====");
      print(jsonEncode(Global.mainCategory));
    });
  }
}
