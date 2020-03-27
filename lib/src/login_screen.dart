import 'package:flutter/material.dart';
import 'bloc/bloc.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children:[
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top:25.0),
          ),
          submitButton(),
        ]
      ),
    );
  }

  Widget emailField(){

    return StreamBuilder(stream: bloc.email,
     builder: (context, snapshot) {
     return TextField(
       onChanged: bloc.changeEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
      hintText:'abc@example.com',
      labelText: "Email Address",
      errorText: snapshot.error,
      ),

    );
 },
);  
  }

  Widget passwordField(){
    return StreamBuilder(
      stream: bloc.password,
      builder:(context,snapshot){
          return TextField(
            onChanged:bloc.changePassword,
            
          decoration: InputDecoration(
          hintText:'Password',
          labelText:'Password',
          errorText: snapshot.error,
),
     obscureText: true,
    );
      },
    );
    
  }
  Widget submitButton(){
return RaisedButton(onPressed: 
(){

},
child: Text('Login'),
color: Colors.blue,
textColor: Colors.white,
);
  }
}