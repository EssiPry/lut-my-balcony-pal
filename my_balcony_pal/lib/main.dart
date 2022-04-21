import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.green, canvasColor: Colors.grey[200]),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB0D494),
          foregroundColor: Colors.black87,
        ),
        endDrawer: SideDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WelcomeText('Dan'),
            BalconyInfo(),
            PlantList(),
            ReminderList(),
          ],
        ),
        bottomNavigationBar: BottomMenu());
  }
}

class WelcomeText extends StatelessWidget {
  String name;

  WelcomeText(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Welcome back, ',
              style: TextStyle(
                  letterSpacing: .5,
                  fontSize: 30,
                  fontFamily: 'Graphie',
                  fontWeight: FontWeight.w800)),
          Text('$name!',
              style: TextStyle(
                  letterSpacing: .5,
                  fontSize: 30,
                  fontFamily: 'Graphie',
                  fontWeight: FontWeight.w900)),
        ]));
  }
}

class Section extends StatelessWidget {
  final String category;
  const Section(this.category, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 5, bottom: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(category,
              style: const TextStyle(
                  letterSpacing: .5,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600)),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.add),
            //tooltip: 'Increase volume by 10',
            onPressed: () {},
          )
        ]));
  }
}

class BalconyObject extends StatelessWidget {
  String text;
  String number;
  var color;

  BalconyObject(this.text, this.number, this.color);
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(text,
              style: const TextStyle(
                  letterSpacing: .5,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600)),
          Text(number,
              style: const TextStyle(
                  letterSpacing: .5,
                  fontSize: 36,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600)),
        ]));
  }
}

class BalconyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Section('Balcony'),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        BalconyObject('Temperature', '24°C', Color(0xFFB0D494)),
        BalconyObject('Humidity', '62%', Color(0xFFC6DDB7)),
        BalconyObject('Water tank', '9%', Color(0xFFBBEBDC)),
      ])
    ]);
  }
}

class DrawerItem extends StatelessWidget {
  Icon icon;
  Text text;
  DrawerItem(this.icon, this.text);
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: text,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class BottomMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed
      backgroundColor: Color(0xFFC6DDB7),
      selectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.yard_outlined),
          label: 'Plants',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Rules',
        ),
        //Creates navbaritem with alert
        BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.error_outline),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '2',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: 'Alerts'),
      ],
    );
  }
}

class SideDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerItem(Icon(Icons.person_outline), Text('Name')),
          const Divider(color: Colors.grey),
          DrawerItem(Icon(Icons.edit_note), Text('Notes')),
          DrawerItem(Icon(Icons.source_outlined), Text('Data')),
          DrawerItem(Icon(Icons.insights), Text('Graphs')),
          DrawerItem(Icon(Icons.settings), Text('Settings')),
          DrawerItem(
              Icon(Icons.local_florist_outlined), Text('Gardening info')),
          DrawerItem(Icon(Icons.help_outline), Text('Help & Feedback'))
        ],
      ),
    );
  }
}

class PlantList extends StatelessWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Section('Plants'),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        PlantObject('Chili peppers', 'chili'),
        PlantObject('Cherry Tomatoes', 'tomato'),
        PlantObject('Monstera', 'monstera')
      ])
    ]);
  }
}

class PlantObject extends StatelessWidget {
  String text;
  String pic;
  PlantObject(this.text, this.pic);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Plant(pic),
          Padding(padding: EdgeInsets.only(top: 10), child: Text(text))
        ],
      ),
    );
  }
}

class Plant extends StatelessWidget {
  String pic;
  Plant(this.pic);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: () {}, // Handle your callback.
      splashColor: Colors.green.withOpacity(0.5),
      child: Ink(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          image: DecorationImage(
            image: AssetImage('images/$pic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Section('Reminders'),
      Reminder('Today', 'Check cherry tomatoes'),
      Reminder('10 days to', 'Add nutrients')
    ]);
  }
}

class Reminder extends StatelessWidget {
  final String when;
  final String toDo;

  Reminder(this.when, this.toDo);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
          padding: EdgeInsets.fromLTRB(24, 10, 10, 10),
          child: SizedBox(
              width: 150,
              child: Text(when,
                  style: const TextStyle(
                      letterSpacing: .5,
                      fontSize: 19,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600)))),
      Text(toDo,
          style: const TextStyle(
            letterSpacing: .5,
            fontSize: 18,
            fontFamily: 'Roboto',
          ))
    ]);
  }
}
