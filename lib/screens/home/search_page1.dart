import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/search.dart';
import 'package:flutter/material.dart';

//void main() => runApp(SearchNew());

class SearchNew extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bloodBanks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchPage(title: 'Search Blood Banks'),
    );
  }
}

class MySearchPage extends StatefulWidget {
  MySearchPage({Key key, this.title}) : super(key: key);
    final String title;
  @override
  _MySearchPageState createState() => _MySearchPageState();
}

 class _MySearchPageState extends State<MySearchPage> {
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
               SearchBB(),
              
             ]
             ),
       )
       ),
     );
   }
 }

class SearchBB extends StatefulWidget {
  SearchBB({Key key}) : super(key: key);

  @override
  _SearchBBState createState() => _SearchBBState();
}

class _SearchBBState extends State<SearchBB> {
  final _formKey = GlobalKey<FormState>();
  
  //final nameController = TextEditingController();
  //final ageController = TextEditingController();

  var districtval;
  var stateval;
  

  final dbRef = FirebaseDatabase.instance.reference().child("NewBloodBankReg");

  
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
                  return 'Enter State';
                }
                return null;
              },onChanged: (text) {
              stateval = text;
              print("value of stateval: $stateval");

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
              districtval = text;
              print("value of district: $districtval");
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
                      builder: (context) => ShowDataPage(stateval: stateval,districtval: districtval,)),
                      );

                      Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('results')));
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