import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Acceptor extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    return AcceptorState();
  }
}
  
class AcceptorState extends State<Acceptor> {
  String _bloodGroup;
  String _city;
  String _state;
  String _district;
  String _fullName;
  String _contactNumber;

final dbRef = FirebaseDatabase.instance.reference();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void sendData(){
      dbRef.child('Acceptors').push().set({
        "fullName": _fullName,
        "bloodGroup": _bloodGroup,
        "state": _state,
        "district": _district,
        "city": _city,
        "contactNumber": _contactNumber,

      });
  }


Widget _buildFullName() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Full Name', enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'State is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _fullName = value;
      },
    ));
  }

  Widget _buildBloodGroup() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'Blood Group',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Blood Group is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _bloodGroup = value;
      },
    ));
  }

Widget _buildContactNumber() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'Contact Number',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0) ),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number Required';
        }

        return null;
      },
      onSaved: (String value) {
        _contactNumber = value;
      },
    ));
  }

Widget _buildState() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'State',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'State is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _state = value;
      },
    ));
  }


Widget _buildDistrict() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'District',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'District is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _district = value;
      },
    ));
  }

Widget _buildCity() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'City',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'City is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _city = value;
      },
    ));
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acceptor Details"),backgroundColor: Colors.red[900],),
      body: SingleChildScrollView(
        //margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFullName(),
              _buildBloodGroup(),
              _buildState(),
              _buildDistrict(),
              _buildCity(),
              _buildContactNumber(),
              SizedBox(height: 10),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  //Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Data added Successfully')));
                  _formKey.currentState.save();

                  sendData();

                  print(_bloodGroup);
                  print(_state);
                  print(_district);
                  print(_city);
                  print(_fullName);
                  print(_contactNumber);
                  //Send to API

                  Fluttertoast.showToast(
                  msg: "Data added Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}