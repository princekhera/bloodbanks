import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/MyData3.dart';

class ShowBanks extends StatefulWidget {
  
  var sdc;
  

  ShowBanks({this.sdc});
  
  @override
  _ShowBanksState createState() => _ShowBanksState(sdc);
}

class _ShowBanksState extends State<ShowBanks> {
  List<MyData3> allData = [];
  
  var sdc;
  

  _ShowBanksState(this.sdc);
  @override
  void initState() {

    print("value of sdc screen2: $sdc");
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('BloodBanks').orderByChild('sdc').equalTo(sdc).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyData3 d = new MyData3(

          data[key]['bloodBankName'],
          data[key]['address'],
          data[key]['Mobile'],
          data[key]['Pincode'],
          data[key]['Latitude'],
          data[key]['Longitude'],
          data[key]['Sdc'],
          
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
      appBar: new AppBar(title: new Text('Available Blood Banks'),backgroundColor: Colors.red[900],),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                      allData[index].bloodBankName,
                      allData[index].sdc,
                      allData[index].address,
                      
                      allData[index].mobile,
                      allData[index].pincode,
                      allData[index].latitude,
                      allData[index].longitude,
                      
                    );
                  },
                )),
    );
  }

  Widget UI(String bloodBankName,
            String address,
            String sdc,
            String mobile,
            String pincode,
            String latitude,
            String longitude,
            
            
            ) {
    return new Card(
      elevation: 100.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('$bloodBankName',style: Theme.of(context).textTheme.title,),
            new Text('Address : $sdc'),
            // new Text('Pincode : $pincode'),
            //new Text('Contact No. : $mobile'),
            // new Text('Latitude : $latitude'),
            // new Text('Longitude : $longitude'),

            
          ],
        ),
      ),
    );
  }
}