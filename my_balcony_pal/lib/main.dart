import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Balcony Pal',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          canvasColor: Colors.grey[200]),
      home: const MyHomePage(title: 'My Balcony Pal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const drawerIcons = [
      Icon(Icons.person_outline),
      //Icon(Icons.edit_note), heittää erroria
      Icon(Icons.source_outlined),
      Icon(Icons.insights),
      Icon(Icons.settings),
      Icon(Icons.local_florist),
      Icon(Icons.help_outlined)
    ];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

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

      //TÄÄ on oikea menu debugin alla piilossa
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.person_outline),
              title: const Text('Name'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.grey),
            // tämä heittää erroria jostain syystä
            //ListTile(
            //  leading: Icon(Icons.edit_note),
            //  title: const Text('Notes'),
            //  onTap: () {
            //    Navigator.pop(context);
            //  },
            //),
            ListTile(
              leading: Icon(Icons.source_outlined),
              title: const Text('Data'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.insights),
              title: const Text('Graphs'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_florist_outlined),
              title: const Text('Gardening info'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: const Text('Help & Feedback'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.green[300],
        selectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
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
      ),
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
    return Row(children: [
      Container(
        padding: EdgeInsets.all(15),
        child: Text(category,
            textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
      ),
      Spacer(),
      FloatingActionButton(
          mini: true,
          onPressed: () {},
          backgroundColor: Colors.green[200],
          child: Icon(Icons.add))
    ]);
  }
}

class BalconyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
          height: 110,
          width: 110,
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
          height: 110,
          width: 110,
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
          height: 110,
          width: 110,
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

class PlantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Plant('Chili peppers'),
      Plant('Tomatoes'),
      Plant('Monstera'),
    ]);
  }
}

//tästä puuttuu taustakuvat ja kokoa pitää vielä säätää
class Plant extends StatelessWidget {
  String species;

  Plant(this.species);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(species),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 120), shape: const CircleBorder()));
  }
}

// tämä voisi olla myös Erikan ehdottama ListTile + ListView
//ListTilessa on ikoni + yksi, kaksi tai kolme riviä tekstiä
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
