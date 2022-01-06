import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/MyData2.dart';

class ShowDonors extends StatefulWidget {

  var bloodC;
  var state1;

  ShowDonors({this.bloodC});

  @override
  _ShowDonorsState createState() => _ShowDonorsState(bloodC);
}

class _ShowDonorsState extends State<ShowDonors> {
  List<MyData2> allData = [];

  var bloodC;
  var state1;

  _ShowDonorsState(this.bloodC);
  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Donors').orderByChild('bloodGroup').equalTo(bloodC).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyData2 d = new MyData2(
          
          data[key]['fullName'],
          data[key]['state'],
          data[key]['district'],
          data[key]['city'],
          data[key]['bloodGroup'],
          data[key]['age'],
          data[key]['contactNumber'],

        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('All Donors',),backgroundColor: Colors.red[900]
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      //allData[index].fullName,
                      allData[index].state,
                      allData[index].district,
                      allData[index].city,
                      allData[index].age,
                      allData[index].bloodGroup,
                      allData[index].contactNumber,


                    );
                  },
                )),
    );
  }

  Widget UI(//String fullName,
            String state,
            String district,
            String city,
            String bloodGroup,
            String age,
            String contactNumber) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Blood Component : $bloodGroup',style: Theme.of(context).textTheme.title,),
            new Text('State : $state'),
            new Text('District : $district'),
            new Text('City : $city'),
            new Text('Age : $age'),
            new Text('Contact No. : $contactNumber'),
            
          ],
        ),
      ),
    );
  }
}