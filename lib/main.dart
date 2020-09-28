import 'package:basi/secondfragment.dart';
import 'package:basi/thirdfragment.dart';
import 'package:flutter/material.dart';
import 'package:basi/firstfragment.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    int currentindex = 1;

    // ignore: missing_return
    Widget getCurrentFragment() {
      switch (currentindex) {
        case 1:
          return firstfragment();
          break;
        case 2:
          return secondfragment();
          break;
        case 3:
          return thirdfragment();
          break;
      }
    }

    setCurentIndex(int index) {
      setState(() {
        currentindex = index;
      });
      Navigator.of(context).pop();
    }

    return Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: Column(
          children: [
            Container(
              color: Colors.black54,
              height: 200.0,
              width: double.infinity,
              child: UserAccountsDrawerHeader(
                accountEmail: Text('lingaraj592000@gmail.com'),
                accountName: Text('LINGARAJ'),
                otherAccountsPictures: [Icon(Icons.account_circle)],
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.people),
                ),
              ),
            ),
            ListTile(
              title: Text('Events'),
              selected: currentindex == 1 ? true : false,
              onTap: () {
                setCurentIndex(1);
              },
              leading: Icon(Icons.bookmark),
            ),
            ListTile(
              title: Text('Emails'),
              selected: currentindex == 2 ? true : false,
              onTap: () {
                setCurentIndex(2);
              },
              leading: Icon(Icons.bookmark),
            ),
            ListTile(
              title: Text('Setting'),
              selected: currentindex == 3 ? true : false,
              onTap: () {
                setCurentIndex(3);
              },
              leading: Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EMAIL'),
        centerTitle: true,
        actions: [
          Icon(Icons.share),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 10.0,
        child: Icon(Icons.home),
      ),
      body: getCurrentFragment(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
    );
  }
}
