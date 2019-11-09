import 'package:flutter/material.dart';


class ReportForm extends StatefulWidget {
  ReportForm({Key key}) : super(key: key);

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  String activityValue = 'Poaching';
  String severityValue = 'Low: Inform';

  var activities = [
    'Poaching',
    'Dead Animal',
    'Trafficking',
    'Other'
  ];

  var severity = [
    'Critical: Animal or Human Life in Danger',
    'High: Active illegal activity',
    'Medium: Sighting or movement',
    'Low: Inform'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            obscureText: false,
            maxLength: 120,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description of Activity',
            ),
          ),
          TextFormField(
            obscureText: false,
            maxLength: 15,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Species',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please provide species';
              }
              return null;
            },
          ),
          DropdownButton<String>(
            value: activityValue,
            elevation: 16,
            style: TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
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
          DropdownButton<String>(
            value: severityValue,
            elevation: 16,
            style: TextStyle(
                color: Colors.deepPurple
            ),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                severityValue = newValue;
              });
            },
            items: severity
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
                .toList(),
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
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
