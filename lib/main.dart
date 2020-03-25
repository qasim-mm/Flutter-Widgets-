
import 'package:flutter/material.dart';
import 'package:http_demo/cart_bloc.dart';
import 'package:http_demo/cart_page.dart';
import 'package:provider/provider.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<CartBloc>
    (
      create: (context)=>CartBloc(),

    child: MaterialApp(
      title: 'Shopping Cart',
      theme:ThemeData(
        primarySwatch:Colors.cyan
      ),
      home: MyHomePage(title: 'Gift Shop'),
    ),
    
    );
  }
}
 
 class MyHomePage extends StatefulWidget {

   final String title;
   MyHomePage({Key key,this.title}):super(key:key);

   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {
   
   @override
   Widget build(BuildContext context) {
     var bloc=Provider.of<CartBloc>(context);
     int totalCount=0;
     if(bloc.cart.length>0){
       totalCount=bloc.cart.values.reduce((a,b)=>a+b); 
     }

     return Scaffold(
       appBar: AppBar(
        title:Text(widget.title),
        actions: <Widget>[
           Padding(padding: const EdgeInsets.all(10.0),
          child:  Container(
      height: 150,
        width: 30,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(),
            ),
            );
          },
          child: Stack(
          children: <Widget>[
          IconButton(icon: Icon(
            Icons.shopping_cart,
          color: Colors.white), 
          onPressed: null),
          Positioned(child: new Stack(
          children: <Widget>[
            new Icon(Icons.brightness_1,
            size:20.0,
            color: Colors.red[800], ),
            new Positioned(
              top: 3.0,
              right: 7,

              child: new Center(
                child: new Text('$totalCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500
                ),
                ),

              )
            )
          ],
          ),)
          ],
          ),
        ),
          ),
          )
        ],
       ),
       body: GridView.count(crossAxisCount: 2,
       children:List.generate(6, (index){
return GestureDetector(
  onTap:(){
bloc.addToCart(index);
  },
  child:Container(
    height:200,
    width:200,
    decoration: BoxDecoration(
image: DecorationImage(
  image:AssetImage("assets/${index+1}.jpg"),
  fit: BoxFit.fitWidth),
  borderRadius: BorderRadius.circular(12.0),
    ),
    
  ),
);
       },
       )
       ),
     );
    
   }
 }
