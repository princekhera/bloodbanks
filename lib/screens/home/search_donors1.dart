import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/search_donors.dart';
import 'package:flutter/material.dart';

//void main() => runApp(SearchNew());

class ShowDonors1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bloodBanks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchDonor(title: 'Search Donors'),
    );
  }
}

class MySearchDonor extends StatefulWidget {
  MySearchDonor({Key key, this.title}) : super(key: key);
    final String title;
  @override
  _MySearchDonorState createState() => _MySearchDonorState();
}

 class _MySearchDonorState extends State<MySearchDonor> {
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
               Text("You can Search Blood Donors ",
                   style: TextStyle(
                       fontWeight: FontWeight.w200,
                       fontSize: 30,
                       fontFamily: 'Roboto',
                       fontStyle: FontStyle.italic)),
               SearchDD(),
              
             ]
             ),
       )
       ),
     );
   }
 }

class SearchDD extends StatefulWidget {
  SearchDD({Key key}) : super(key: key);

  @override
  _SearchDDState createState() => _SearchDDState();
}

class _SearchDDState extends State<SearchDD> {
  final _formKey = GlobalKey<FormState>();

  var state1;
  var bloodC;

  final dbRef = FirebaseDatabase.instance.reference().child("Donors");

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
                labelText: "Enter Blood Group",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLength: 3,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Blood Group required';
                }
                return null;
              },onChanged: (text) {
              bloodC = text;
              print("value of blood: $bloodC");

              },
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              
              //controller: ageController,
              decoration: InputDecoration(
                labelText: "Enter State",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              // validator: (value) {
              //   if (value.isEmpty) {
              //     return 'Enter state';
              //   }
              //   return null;
              // },
              // onChanged: (text) {
              // state1 = text;
              // print("value of state: $state1");
              // },
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
                      builder: (context) => ShowDonors(bloodC: bloodC)),
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
