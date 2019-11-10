import 'package:flutter/material.dart';
import 'background.dart';
import 'title.dart';
import 'signup.dart';
import 'login.dart';
import 'dashboard.dart';
import 'welcome.dart';

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

    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow,
        child: MaterialButton(
          minWidth: 325.0,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardRoute()),
            );
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 25.0
              )
          ),
        )
    );


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
                    MaterialPageRoute(builder: (context) => DashboardRoute()),
                  );
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              loginButton
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
                  child: RangerRoarTitle()
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        );
                      },
                      child: new Text(
                          'Home',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          )
                      )
                  )
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
