import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Donor extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DonorState();
  }
}

class DonorState extends State<Donor> {
  String _name;
  String _contactNumber;
  String _bloodGroup;
  String _age;
  String _city;
  String _state;
  String _district;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final dbRef = FirebaseDatabase.instance.reference();

void sendData(){
      dbRef.child('Donors').push().set({
        "fullName": _name,
        "age": _age,
        "bloodGroup": _bloodGroup,
        "state": _state,
        "district": _district,
        "city": _city,
        "contactNumber": _contactNumber,

      });
  }


  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      
      decoration: InputDecoration(labelText: 'Name', enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    ));
  }

  Widget _buildBloodGroup() {
     return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Blood Group', enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 3,
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

Widget _buildState() {
     return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'State', enabledBorder: OutlineInputBorder(
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
      decoration: InputDecoration(labelText: 'District', enabledBorder: OutlineInputBorder(
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
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'City', enabledBorder: OutlineInputBorder(
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

Widget _buildContactNumber() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Contact Number', enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Contact number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _contactNumber = value;
      },
    ));
  }

Widget _buildAge() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'Age', enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (String value) {
        int age = int.tryParse(value);

        if (age == null || age <= 18 || age >= 62 ) {
          return 'Age must be between 18 to 62 ';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Donor Details"),backgroundColor: Colors.red[900],),
      body: SingleChildScrollView(
        //margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildContactNumber(),
              _buildAge(),
              _buildBloodGroup(),
              _buildState(),
              _buildDistrict(),
              _buildCity(),
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

                  print(_name);
                  print(_age);
                  print(_contactNumber);
                  print(_bloodGroup);
                  print(_state);
                  print(_district);
                  print(_city);

                  Fluttertoast.showToast(
                  msg: "Data added Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
                  );
                  //Send to API
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}