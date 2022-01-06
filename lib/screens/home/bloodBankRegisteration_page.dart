import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegisterNewBank extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    return RegisterNewBankState();
  }
}
  
class RegisterNewBankState extends State<RegisterNewBank> {
  String _bloodBankName;
  String _city;
  String _state;
  String _district;
  String _pincode;
  String _contactNumber;
  String _address;

final dbRef = FirebaseDatabase.instance.reference();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void sendData(){
      dbRef.child('NewBloodBankReg').push().set({
        "Blood Bank Name": _bloodBankName,
        "Pincode": _pincode,
        "State": _state,
        "District": _district,
        "City": _city,
        "Contact Number": _contactNumber,
        "Address": _address
      });
  }


Widget _buildBloodBankName() {
    return Padding( 
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'Blood Bank Name',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 30,

      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _bloodBankName = value;
      },
    )
    );
  }
    
  Widget _buildPincode() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Pincode',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 6,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Pincode is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _pincode = value;
      },
    )
    );
  }

Widget _buildContactNumber() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Contact Number',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Contact Number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _contactNumber = value;
      },
    )
    );
  }

Widget _buildState() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
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
    )
    );
  }


Widget _buildDistrict() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
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
    )
    );
  }

Widget _buildCity() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
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
    )
    );
  }

Widget _buildAddress() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child:TextFormField(
      decoration: InputDecoration(labelText: 'Address',enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)),contentPadding: EdgeInsets.symmetric(horizontal: 15.0)),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    )
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Blood Bank Registeration"),backgroundColor: Colors.red[900],),
      body: SingleChildScrollView(
        //margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildBloodBankName(),
              _buildState(),
              _buildDistrict(),
              _buildCity(),
              _buildPincode(),
              _buildContactNumber(),
              _buildAddress(),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.greenAccent,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();

                  sendData();

                  print(_bloodBankName);
                  print(_state);
                  print(_district);
                  print(_city);
                  print(_pincode);
                  print(_contactNumber);
                  print(_address);
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