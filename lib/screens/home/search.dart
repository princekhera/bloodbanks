import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bloodbanks/screens/home/MyData.dart';
//import 'package:bloodbanks/screens/home/search_page1.dart';

class ShowDataPage extends StatefulWidget {

  var stateval;
  var districtval;

  ShowDataPage({this.stateval,this.districtval});

  @override
  _ShowDataPageState createState() => _ShowDataPageState(stateval,districtval);
}

class _ShowDataPageState extends State<ShowDataPage> {
  
  List<MyData> allData = [];

  String stateval;
  String districtval;

  _ShowDataPageState(this.stateval,this.districtval);
 @override
 
  void initState() {
  

    print("value of statevalscreen2: $stateval");
    print("value of districtvals2: $districtval");
    DatabaseReference ref = FirebaseDatabase.instance.reference().child('NewBloodBankReg');
    ref.orderByChild('State').equalTo(stateval).once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        MyData d = new MyData(
          
          data[key]['Blood Bank Name'],
          data[key]['State'],
          data[key]['District'],
          data[key]['City'],
          data[key]['Pincode'],
          data[key]['Address'],
          data[key]['Contact Number'],
          data[key]['Latitude'],
          data[key]['Longitude'],
          
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
        title: new Text('New Blood Banks'),backgroundColor: Colors.red[900]
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' No Data is Available')
              : new ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return UI(
                     
                      allData[index].bloodBankName,
                      allData[index].state,
                      allData[index].district,
                      allData[index].city,
                      allData[index].pincode,
                      allData[index].address,
                      allData[index].contactNumber,
                      allData[index].latitude,
                      allData[index].longitude,
                    
                    );
                  },
                )),
    );
  }

  Widget UI(String bloodBankName,
            String state,
            String district,
            String city,
            String pincode,
            String address,
            String contactNumber,
            String latitude,
            String longitude) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Name : $bloodBankName',style: Theme.of(context).textTheme.title,),
            new Text('State : $state'),
            new Text('District : $district'),
            new Text('City : $city'),
            new Text('Pincode : $pincode'),
            new Text('Address : $address'),
            new Text('Contact No. : $contactNumber'),
            new Text('Latitude : $latitude'),
            new Text('Longitude : $longitude'),
          ],
        ),
      ),
    );
  }
  
}