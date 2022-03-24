import 'package:cyc_test/utility/my_style.dart';
import 'package:cyc_test/widget/address.dart';
import 'package:cyc_test/widget/information_login.dart';
import 'package:cyc_test/widget/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  //late String user, email;
  Widget currentWidget = homePage();
  String? name, email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAnEmail();
  }

  Future<void> findNameAnEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event?.displayName;
          email = event?.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              bildUserAccountsDrawerHeader(),
              buildShowallTimeSlot(),
              buildListTitleInformation(),
              buildListTitleAddress(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildShowallTimeSlot() {
    return ListTile(
      leading: const Icon(Icons.home_filled),
      title: const Text('Index'),
      subtitle: const Text('Show all Time Slot'),
      onTap: () {
        setState(() {
          currentWidget = homePage();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTitleInformation() {
    return ListTile(
      leading: const Icon(Icons.money),
      title: const Text('Payment'),
      subtitle: const Text('Show all Payment'),
      onTap: () {
        setState(() {
          currentWidget = Information();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTitleAddress() {
    return ListTile(
      leading: const Icon(Icons.contact_mail),
      title: const Text('Contact'),
      subtitle: const Text('Show all Contact and Address'),
      onTap: () {
        setState(() {
          currentWidget = Address();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader bildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: MyStyle().darkColor,
      ),
      accountName: Text(name ?? 'Name'),
      accountEmail: Text(email ?? 'email'),
      currentAccountPicture: Center(
        child: Image.asset(
          'images/user.png',
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            //ออกจากระบบ และกลับสู่หน้าหลัก
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          tileColor: MyStyle().darkColor,
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 30,
          ),
          title: MyStyle().titleH2White(
            'Sign Out!',
          ),
        ),
      ],
    );
  }
}
