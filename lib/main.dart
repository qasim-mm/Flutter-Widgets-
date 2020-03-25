import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_demo/src/models/image_model.dart';
import 'dart:convert';
import 'package:http_demo/src/widgets/image_list.dart';

main() async=>runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

int count=0;


List<ImageModel> imageList=[]; //list
//function to fetching images from server 
 void fetchImage() async{
   count++;
 var response= await get('https://jsonplaceholder.typicode.com/photos/$count');
 
  var imageModel=ImageModel.fromJson(json.decode(response.body));

  setState(() {
      imageList.add(imageModel);

  });

  }
  
// Future<String> get(String url){

// return new Future.delayed(new Duration(seconds: 3),(){
//     return url;
//   });

// }
  @override
  Widget build(BuildContext context) {

    return MaterialApp
    (
      home: Scaffold(
        appBar: AppBar(title:Text('Http Demo'),
        ),
      body: ImageList(imageList),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
         onPressed: fetchImage,



        ),
        

    ),
    
    );
  }
}

