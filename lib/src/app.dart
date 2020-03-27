import 'package:flutter/material.dart';
import 'package:http_demo/src/bloc/provider.dart';

import 'login_screen.dart';

class App extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Provider(
  child:MaterialApp(
    darkTheme: ThemeData.dark(),
    title:'Login',
    home:Scaffold(
    
      body: LoginScreen(),
      
    )
  )

  );
 
}
}