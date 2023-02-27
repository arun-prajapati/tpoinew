import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Page.dart';


Future getPrivacyPage() async {
 await http.get(Uri.parse('$privacyPolicy'),
  ).then((res){
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.privacyPolicPage =PageData.fromJson(Storedataoflist);
  });
}

Future getAboutUs() async {
await  http.get(Uri.parse('$aboutUs'),
  ).then((res){

    var Storedataoflist = jsonDecode(res.body);
    print(res.body);
    print(Storedataoflist);
    Global.aboutUsPage = PageData.fromJson(Storedataoflist);
  });
}


getFaq() async {
  await http.get(Uri.parse('$faq'),
  ).then((res){
    print(res.body);
    var Storedataoflist = jsonDecode(res.body);
    print(Storedataoflist);
    Global.faqPage =PageData.fromJson(Storedataoflist);
  });
}
