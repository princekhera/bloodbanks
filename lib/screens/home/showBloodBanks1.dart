import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/showBloodBanks.dart';
import 'package:flutter/material.dart';


class ShowBanks1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bloodBanks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchBank(title: 'Search Donors'),
    );
  }
}

class MySearchBank extends StatefulWidget {
  MySearchBank({Key key, this.title}) : super(key: key);
    final String title;
  @override
  _MySearchBankState createState() => _MySearchBankState();
}

 class _MySearchBankState extends State<MySearchBank> {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),backgroundColor: Colors.red[900],
       ),
       body: Center(
           child: SingleChildScrollView(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text("You can Search Blood Banks ",
                   style: TextStyle(
                       fontWeight: FontWeight.w200,
                       fontSize: 30,
                       fontFamily: 'Roboto',
                       fontStyle: FontStyle.italic)),
               SearchBank(),
              
             ]
             ),
       )
       ),
     );
   }
 }

class SearchBank extends StatefulWidget {
  SearchBank({Key key}) : super(key: key);

  @override
  _SearchBankState createState() => _SearchBankState();
}

class _SearchBankState extends State<SearchBank> {
  final _formKey = GlobalKey<FormState>();

  var state1;
  var district1;
  var city1;
  var sdc;
  final dbRef = FirebaseDatabase.instance.reference().child("BloodBanks");

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              //controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter State",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'State';
                }
                return null;
              },onChanged: (text) {
              state1 = text;
              print("value of State: $state1");

              },
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              
              //controller: ageController,
              decoration: InputDecoration(
                labelText: "Enter District",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter District';
                }
                return null;
              },
              onChanged: (text) {
              district1 = text;
              print("value of state: $state1");
              },
            ),
            
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              
              //controller: ageController,
              decoration: InputDecoration(
                labelText: "Enter City",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter City';
                }
                return null;
              },
              onChanged: (text) {
              city1 = text;
              print("value of city: $city1");
              sdc = ('$state1 $district1 $city1');
              print("value of sdc: $sdc");
          
              },
            ),
            
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (_formKey.currentState.validate()){

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShowBanks(sdc: sdc,)),
                      );

                      Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Successfully Added')));
                     }
                    },
                    child: Text('Submit'),
                  ),
                ],
              )),
              
        ]
        )
        )
        );
  }
  
  //  @override
  //  void dispose() {
  //    super.dispose();
  //    ageController.dispose();
  //    nameController.dispose();
  //  }
}