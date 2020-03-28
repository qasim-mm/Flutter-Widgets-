
import 'package:flutter/material.dart';
import 'bloc/bloc.dart';
import 'bloc/provider.dart';



class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final bloc=Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children:[
          emailFailed(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top:25.0),
          ),
          submitButton(bloc),
        ]
      ),
    );
  }

  Widget emailFailed(Bloc bloc){

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

  Widget passwordField(Bloc bloc){
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
  Widget submitButton(Bloc bloc){

    return StreamBuilder(
      stream:bloc.submitValue,
      builder: (context,snapshot){
 
        return RaisedButton(
          onPressed:snapshot.hasData?bloc.submit:null,  //ternorary operator
        child: Text('Login'),
        color: Colors.blue,
        textColor: Colors.white,
        );
      },
    );

  }
}