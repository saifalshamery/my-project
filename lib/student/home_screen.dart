import 'package:flutter/material.dart';
import 'package:teachers/widgets/search_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الرئيسية'),
      ),
      drawer: Sidenav((int index) {
        setState(() {
          selectedIndex = index;
        });
      }, selectedIndex),
    );
  }
}

class Sidenav extends StatelessWidget {
  final Function onIndexChanged;
  final int selectedIndex;
  const Sidenav(this.onIndexChanged, this.selectedIndex);
  //const Sidenav(int selectedIndex, {Key? key}) : super(key: key);
  //Sidenav(this.onIndexChanged, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(""),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.deepPurple
                  : Colors.white,
              child: new Text("Tacher"),
            ),

          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Container(
            color: selectedIndex == 0
                ? Theme.of(context).primaryColorLight
                : Colors.transparent,
            child: ListTile(
              title: Text("تسجيل الدخول"),
              leading: Icon(
                Icons.login,
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
              selected: selectedIndex == 0,
              onTap: () {
                Navigator.of(context).pushNamed('login');
                onIndexChanged(0);
              },
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Container(
            color: selectedIndex == 1
                ? Theme.of(context).primaryColorLight
                : Colors.transparent,
            child: ListTile(
              title: Text("تسجيل "),
              leading: Icon(
                Icons.account_box,
                color: Colors.black,
              ),
              selected: selectedIndex == 1,
              onTap: () {
                Navigator.of(context).pushNamed('register');
                onIndexChanged(1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
