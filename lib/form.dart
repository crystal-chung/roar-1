import 'package:flutter/material.dart';
import 'confirmation.dart';
import 'user.dart';


class UserReportForm extends StatefulWidget {
  UserReportForm({Key key}) : super(key: key);

  @override
  _UserReportFormState createState() => _UserReportFormState();
}

class ReportForm extends StatefulWidget {
  ReportForm({Key key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  String activityValue = 'Poaching';

  var activities = [
    'Poaching',
    'Dead Animal',
    'Trafficking',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    final UploadButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("Upload",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black
              )
          ),
        )
    );

    final SelectLocationButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("Select Location",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black
              )
          ),
        )
    );

    final SubmitButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfirmationRoute()
                )
            );
            },
          child: Text("Submit",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black
              )
          ),
        )
    );

    final NoButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("No",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black
              )
          ),
        )
    );

    final UseMyLocation = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("Use My Location",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black
              )
          ),
        )
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 300,
            child: Column(
              children: <Widget> [
                Text(
                  'What Happened?',
                  style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  obscureText: false,
                  maxLength: 120,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: 300,
            child: Column(
              children: <Widget> [
                Text(
                  'What animals were involved?',
                  style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                ),
                TextFormField(
                  obscureText: false,
                  maxLength: 15,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide species';
                    }
                    return null;
                  },
                ),
              ]
            )
          ),
          new Container(
            child: Column(
              children: <Widget> [
                Text(
                  'What type of activity happened?',
                  style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                ),
                new Container(
                  margin: EdgeInsets.all(12),
                  color: Colors.white,
                  child: DropdownButton<String>(
                    value: activityValue,
                    elevation: 16,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    underline: Container(
                      height: 0,
                      color: Colors.white,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        activityValue = newValue;
                      });
                    },
                    items: activities
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })
                        .toList(),
                  ),
                )
              ]
            )
          ),
        new Container(
          child: Column(
            children: <Widget>[
              Text(
                'Do you have images or video?',
                style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              new Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: UploadButton
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: NoButton
                    ),
                  ],
                )
              )
            ]
          )
        ),
        new Container(
          child: Column(
            children: <Widget>[
              Text(
                'Where did this happen?',
                style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              ),
              new Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SelectLocationButton
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: UseMyLocation
                    ),
                  ],
                )
              )
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: SubmitButton
        ),
        ],
      ),
    );
  }
}


class _UserReportFormState extends State<UserReportForm> {
  final _formKey = GlobalKey<FormState>();
  String activityValue = 'Poaching';

  var activities = [
    'Poaching',
    'Dead Animal',
    'Trafficking',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 300,
            child: Column(
              children: <Widget> [
                Text(
                  'What Happened?',
                  style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  obscureText: false,
                  maxLength: 120,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          new Container(
              width: 300,
              child: Column(
                  children: <Widget> [
                    Text(
                      'What animals were involved?',
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    TextFormField(
                      obscureText: false,
                      maxLength: 15,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide species';
                        }
                        return null;
                      },
                    ),
                  ]
              )
          ),
          new Container(
              child: Column(
                  children: <Widget> [
                    Text(
                      'What type of activity happened?',
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    new Container(
                      margin: EdgeInsets.all(12),
                      color: Colors.white,
                      child: DropdownButton<String>(
                        value: activityValue,
                        elevation: 16,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        underline: Container(
                          height: 0,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            activityValue = newValue;
                          });
                        },
                        items: activities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),
                    )
                  ]
              )
          ),
          new Container(
              child: Column(
                  children: <Widget>[
                    Text(
                      'Do you have images or video?',
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    new Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: RaisedButton(
                                color: Colors.yellow,
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                  }
                                },
                                child: Text('Upload'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: RaisedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                  }
                                },
                                child: Text('No'),
                              ),
                            ),
                          ],
                        )
                    )
                  ]
              )
          ),
          new Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Where did this happen?',
                    style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  new Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              color: Colors.yellow,
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  // Process data.
                                }
                              },
                              child: Text('Select Location'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  // Process data.
                                }
                              },
                              child: Text('Use My Location'),
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserRoute()
                    )
                );
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}