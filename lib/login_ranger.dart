import 'package:flutter/material.dart';
import 'background.dart';
import 'title.dart';
import 'signup.dart';
import 'login.dart';
import 'authority.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginRoute()),
                );
              },
              child: new Text(
                'Forgot Password?',
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
            new Text(
                ' | ',
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
            new FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpRoute()),
                );
              },
              child: new Text(
                'Sign Up',
                style: new TextStyle(
                    color: Colors.yellow,
                    fontSize: 20
                ),
              ),
            )
          ],
        )
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                maxLines: 1,
                obscureText: false,
                maxLength: 120,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              Text(
                'Password',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                obscureText: false,
                maxLength: 120,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onFieldSubmitted: (term) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthorityRoute()),
                  );
                },
              )
            ],
          )
      )
    );
  }
}

class LoginRangerRounte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: RoarTitle()
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 430.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: NavBar(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 230),
            child: Align(
              alignment: Alignment.center,
              child: LoginForm(),
            )
          )
        ],
      )
    );
  }
}
