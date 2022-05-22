import 'package:flutter/material.dart';

import '../screen/categories_screen.dart';
import '../screen/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Veysel"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpngimg.com%2Fuploads%2Fpokemon%2Fpokemon_PNG149.png&f=1&nofb=1"),
            ),
            accountEmail: Text("veysel@gmail"),
            decoration: (BoxDecoration(color: Colors.blue)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Ana Sayfa"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text("Katgoriler"),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesScreen())),
          ),
        ],
      ),
    );
  }
}
