import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Balcony Pal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.grey[200]),
      home: const MyHomePage(title: 'My Balcony Pal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      bottomNavigationBar: BottomMenu()
    );
  }
}


class WelcomeText extends StatelessWidget {
  String name;

  WelcomeText(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text('Welcome back, $name!', style: TextStyle(fontSize: 25)));
  }
}

class Section extends StatelessWidget {
  final String category;
  Section(this.category);
  @override
  Widget build(BuildContext context) {

    return 
      Padding(
        padding: EdgeInsets.only(left:10, right: 5), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(category,style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,  
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.add),
          //tooltip: 'Increase volume by 10',
            onPressed: () {},
          )
          ]
        ));
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
          borderRadius: BorderRadius.circular(10),
          color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(number,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))
          ]
        )
      );
  }
}

class BalconyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Section('Balcony'),
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      BalconyObject('Temperature', '24C',Color(0xFFB0D494)),
      BalconyObject('Humidity', '62%', Color.fromARGB(255, 198, 221, 183)),
      BalconyObject('Water tank', '24C', Color.fromARGB(255, 187, 235, 220)),
     
    ])]);
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
      backgroundColor: Color(0xFFB0D494),
      selectedItemColor: Colors.black87 ,
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
                child: new Text('2',
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
        label: 'Alerts'
      ),
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
          DrawerItem(Icon(Icons.local_florist_outlined), Text('Gardening info')),
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
    return 
    Column(children: [Section('Plants'),
    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      PlantObject('Chili peppers'),
      PlantObject('Cherry Tomatoes'),
      PlantObject('Monstera')
    ])]);
  }
}

class PlantObject extends StatelessWidget {
  String text;
  PlantObject(this.text);
  @override
  Widget build(BuildContext context) {
    return  Container(
        child:
        Column(children: [Plant(), 
        Padding(
          padding: EdgeInsets.only(top:10), //apply padding to all four sides
          child: Text(text)
          )
        ],
      ),
    );
  }
}


//tää on vielä placeholder
class Plant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: () {},
  child: null,
  
  style: ElevatedButton.styleFrom(
    primary: Color(0xFFB0D494),
    shape: CircleBorder(),
    padding: EdgeInsets.all(24),
     fixedSize: const Size(110,110)
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
          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: SizedBox(
              width: 100,
              child:
                  Text(when, style: TextStyle(fontWeight: FontWeight.bold)))),
      Text(toDo)
    ]);
  }
}
