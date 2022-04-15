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
      ),

      endDrawer: SideDrawer(),
      
      body: Column(
        children: [
          WelcomeText('Dan'),
          Section('Balcony'),
          BalconyInfo(),
          Section('Plants'),
          PlantList(),
          Section('Reminders'),
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
  var color = Colors.transparent;
  Section(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(15, 35, 10, 10),
      child: Column (mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.end,
        children: [ 
          Align(
            alignment: Alignment.centerLeft,
            child: Text(category,style: TextStyle(fontSize: 25,  fontWeight: FontWeight.w600)
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,  
            hoverColor: Colors.transparent,
            icon: const Icon(Icons.add),
            //tooltip: 'Increase volume by 10',
            onPressed: () {
            Null;
            },
          ),
          ),
       ],
     ),
    );
  }
}

class BalconyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[400]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Temperature'),
                Text('24 C',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ])),
      Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[200]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Humidity'),
                Text('62%',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ])),
      Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.teal[100]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Water Tank'),
                Text('9%',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ])),
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
      backgroundColor: Colors.green[300],
      selectedItemColor: Colors.white70,
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
        BottomNavigationBarItem(
          icon: Icon(Icons.error_outline),
          label: 'Alerts',
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Plant('Chili peppers'),
      Plant('Cherry Tomatoes'),
      Plant('Monstera'),
    ]);
  }
}

//tää on vielä placeholder
class Plant extends StatelessWidget {
  String species;

  Plant(this.species);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 100,
        child: Text(species),
        color: Colors.green[200],
        shape: const CircleBorder(),
        onPressed: () {});
  }
}

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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