import 'package:easypayeasywash/home/home.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key? key, required this.userData}) : super(key: key);
  Map<String, dynamic>? userData;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ebiwayo'),
              accountEmail: Text('ebiwayo@ebiwayo.com'),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(
                  size: 42.0,
                ),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  child: Text("N"),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                ),
                CircleAvatar(
                  child: Icon(Icons.add),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey,
                )
              ],
            ),
            ListTile(title: Text('Item 1'), onTap: () {}),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
            // Divider(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  title: Text('Item 3'),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
