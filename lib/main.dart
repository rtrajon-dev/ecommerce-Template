import 'package:ecommarcetemplate/setting_page.dart';
import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'home_page.dart';
import 'about_us_page.dart';
import 'favorites_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNavApp(),
  ));
}


class BottomNavApp extends StatefulWidget {
  @override
  _BottomNavAppState createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  int _currentIndex = 0;
  // final pages = [Text("Home page"), Text("Favorites"), Text("Profile")];
  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onTabSelected(int index){
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("My Shop")),
      drawer: customDrawerWidget(),
      // body: Center(child: pages[_currentIndex]),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          selectedItemColor: Colors.indigo,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),

      ]),
    );
  }

  Widget customDrawerWidget(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40,),
                ),
                SizedBox(height: 10),
                Text("Rajon Talukdar", style: TextStyle(color: Colors.white, fontSize: 18),),
                Text("rt@example.com", style: TextStyle(color: Colors.white70),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            selected: _currentIndex ==0,
            onTap: () => _onTabSelected(0),
            
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favorite"),
            selected: _currentIndex ==1 ,
            onTap: () => _onTabSelected(1),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            selected: _currentIndex == 2,
            onTap: () => _onTabSelected(2),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUsPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              _showLogoutDialog(context);
            },
          )
        ],
      ),
    );
  }



  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Confirm Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          TextButton(
            child: Text("Logout", style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged out")),
              );
              // You can redirect to login here
            },
          ),
        ],
      ),
    );
  }
}










// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// //Entry point widget
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// //stateful widget with bottomnav
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//   final pages = [Text("Home page"), Text("Favorites"), Text("Profile")];
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(title: Text("BottomNav + Drawer")),
//       drawer: customDrawerWidget(),
//       body: Center(child: pages[_currentIndex]),
//       bottomNavigationBar: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
//
//           ]),
//     );
//   }
//
//   Widget customDrawerWidget(){
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(child: Text("my drawer")),
//           ListTile(title: Text("Home"),),
//           ListTile(title: Text("Favorite"),),
//         ],
//       ),
//     );
//   }
// }
//
//











// DRAWER

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("Basic Scaffold"),),
//         drawer: customDrawerWidget(),
//         body: Center(child: Text("Hello Flutter"),),
//       ),
//     );
//   }
//
//
//   Widget customDrawerWidget(){
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(child: Text("my drawer")),
//           ListTile(title: Text("Home"),),
//           ListTile(title: Text("Favorite"),),
//         ],
//       ),
//     );
//   }
// }