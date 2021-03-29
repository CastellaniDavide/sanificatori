import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  //_LoginDemoState createState() => _LoginDemoState();

  _LoginDemoState createState()
  {
    return _LoginDemoState();
  }
}

class _LoginDemoState extends State<LoginDemo> {
  var _emailController = TextEditingController(text: "");
  var _pwsController = TextEditingController(text: "");

  Widget _buildLoginButton()
  {
    return FlatButton(
      onPressed: () {
        if (_emailController.text =="" || _pwsController.text == "")
        {
          print("Error, you need to insert a value");
        }
        else
        {
          if (_emailController.text == "test@test.com" || _pwsController.text == "1234")
          {
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(email: _emailController.text, pws: _pwsController.text)));
          }
          else
          {
            print("Error, wrong email or password");
          }
        }
      },
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _pwsController,

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: _buildLoginButton()
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: _test,), // Singolo bottone
    );
  }
}
