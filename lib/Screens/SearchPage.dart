import 'package:flutter/material.dart';
import 'package:morbimirror/ApiCall/All_URLS.dart';
import 'package:morbimirror/CustomFile/Common.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:morbimirror/Global/Global.dart';
import 'package:morbimirror/Models/Posts.dart';
import 'package:morbimirror/Screens/Searched_Data.dart';

import '../widgets/MajorPost.dart';

class searching extends StatefulWidget {
  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {
  final TextEditingController _controller = new TextEditingController();


  final String searchurl ="https://thepressofindia.com/wp-json/wp/v2/search_posts/?page=1&search=";
  Posts? post;

  bool isLoaded = false;
  bool isSearched = false;

  List<Posts> searchResults = [];



  void searchposts()async{

    print("Searching");
    if (_controller.text.isNotEmpty) {
      setState(() {
        isSearched = true;
        isLoaded = false;
      });
      var res = await http.get(Uri.parse(Uri.encodeFull(searchurl + _controller.text.trim())), headers: {"Accept": "application/json"});
      // fill our posts list with results and update state

      print(res.body);
      setState(() {
        var resBody = json.decode(res.body);

        resBody['posts'].forEach((element){
          searchResults.add(Posts.fromJson(element));
        });

        isLoaded = true;
      });



    } else {
      Show_toast_Now("Enter search term", Colors.red);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff222222),
            child: SafeArea(
              child: Row(
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back,color: Colors.white,),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8
                      ),
                      child: Container(
                        child: TextField(
                          onSubmitted: (value){
                            searchposts();
                          },
                          controller: _controller,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            fillColor: staticWhite,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: staticWhite),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: staticBlack)),
                            hintText: 'Search Here',

                          ),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      searchposts();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: isLoaded?
              Column(
                children: <Widget>[
             /*     Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 20, bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Search Results",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),*/
                  Expanded(
                    child: searchResults.length > 0
                        ? ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: searchResults.length,
                        itemBuilder:
                            (BuildContext context, int index) {

                          return MinorPost(searchResults[index]);

                            /*  return GestureDetector(onTap: (){

                                Global.activePost = searchResults[index];
                                print(Global.activePost!.iD!);

                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            Datasearched(
                                                searchResults[
                                                index]
                                                    .iD)));
                              },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
                                  child: Card(
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Center(
                                                    child:Container(
                                                      height: MediaQuery.of(context).size.width*0.25,
                                                      width: MediaQuery.of(context).size.width*0.35,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                                        topRight: Radius.circular(0.0),
                                                        *//*bottomRight: Radius.circular(50.0)*//*),
                                                        image: DecorationImage(
                                                          image: NetworkImage(searchResults[index].featuredMedia!.medium!),
                                                          fit: BoxFit.fill,
                                                        ),

                                                      ),
                                                    )
                                                ),
                                                SizedBox(width: 10,),
                                                Container(width: 200,
                                                    child: Column(
                                                      children: [
                                                        Text(searchResults[index].postTitle!),
                                                        SizedBox(height: 10,),
                                                        Row(
                                                          children: [
                                                            Text(searchResults[index].postDate!,),

                                                          ],
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              );*/
                        })
                        : Center(child: Text("No News found")),
                  )
                ],
              )
                  : Center(
                child: isSearched
                    ? CircularProgressIndicator()
                    : Container(),
              )
            ),
          ),
        ],
      ),
    );
  }
}
