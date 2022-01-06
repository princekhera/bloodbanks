import 'package:bloodbanks/screens/home/search_donors.dart';
import 'package:bloodbanks/screens/home/showBloodBanks1.dart';
import 'package:bloodbanks/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloodbanks/screens/home/search_donors1.dart';
import 'package:bloodbanks/screens/home/donor_page.dart';
import 'package:bloodbanks/screens/home/acceptor_page.dart';
import 'package:bloodbanks/screens/home/search_page1.dart';
import 'package:bloodbanks/screens/home/bloodBankRegisteration_page.dart';

class FirstPage extends StatefulWidget {

  @override
_FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red[200],
      appBar: new AppBar(title: new Text("Blood Bank"), backgroundColor: Colors.red[900],
      actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
      ),
      
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Registered User"),
              accountEmail: new Text("+917042421848")
              ),
            new ListTile(
            title: new Text("Donor"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Donor())),
            ),
            new ListTile(
            title: new Text("Search Donors"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ShowDonors1())),
            ),
            new ListTile(
            title: new Text("Acceptor"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Acceptor())),
            ),
            new ListTile(
            title: new Text("Search Blood Banks"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ShowBanks1())),
            ),
            new ListTile(
            title: new Text("New Blood Bank Registration"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new RegisterNewBank())),
            ),
            new ListTile(
            title: new Text("Search for New Blood Banks"),
            trailing: new Icon(Icons.arrow_right),
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SearchNew())),
            ),
            
            new Divider(),
            new ListTile(
            title: new Text("Close"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
            ),
          ],


        ),
      ),

      body: new Center(
        child: Image(
          image: AssetImage('images/home_page.png'),
          )
    ),
    bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => SearchNew(),
        child: Icon(Icons.view_agenda),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}