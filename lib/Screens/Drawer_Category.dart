import 'package:flutter/material.dart';
import 'package:morbimirror/CustomFile/CustomColorsFile.dart';
import 'package:morbimirror/Global/Global.dart';



class News_category_drawer extends StatefulWidget {
  @override
  _News_category_drawerState createState() => _News_category_drawerState();
}

class _News_category_drawerState extends State<News_category_drawer> {
  final title = 'Grid List';

  List<String> clist=[

   "   Avsanondh & Besnu",
   " Birthday",
  "  Halvad",
"    Maliya Miyana",
    "Morbi",
    "Promotional",
    "Tankara",
    "Wakaner",

    "Ahmedabad",
    "Amreli",
    "Anand",
    "Aravalli",
    "Bharuch",
    "Bhavnagar",
    "Botad",
   " Chhota Udaipur",
    "Dahod",
    "Dang"

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.white,title:Text("Choose Category",style: TextStyle(color: staticDarkblue,fontSize: MediaQuery.of(context).size.width*0.06,fontWeight: FontWeight.bold,),),
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();

          },child: Icon(Icons.arrow_back,color: Colors.black,),
        ),),
      body: GridView.count(

        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(Global.CategoryList.length,(index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(elevation: 7.7,color: staticDarkblue,
              child: InkWell(splashColor: staticBlack,onTap: (){

                Global.selectedCategoryId=Global.CategoryList[index].id.toString();
                Navigator.of(context).pushNamed('categorynews');

              },
                child: GridTile(
                  child: Center(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                    Global.CategoryList[index].name??"",textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20,color: staticWhite,fontWeight: FontWeight.w400)
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),

    );
  }
}
