import 'package:flutter/material.dart';

import 'login_screen.dart';

class App extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return MaterialApp(
    darkTheme: ThemeData.dark(),
    title:'Login',
    home:Scaffold(
    
      body: LoginScreen(),
      
    )
  );
}
}