import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:s_chat/Friend_list/account_page.dart';
import 'package:s_chat/Friend_list/friends_page.dart';
import 'package:s_chat/Friend_list/messages.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;
  List<Widget> ls = const [Msgs(), FriendsPage(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 35, 38, 51),
        body: ls[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          backgroundColor: Colors.black,
          selectedIndex: _selectedIndex,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            const Duration(milliseconds: 100);
          }),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.message),
                title: const Text('Messages'),
                activeColor: Colors.blue),
            BottomNavyBarItem(
                icon: const Icon(Icons.people),
                title: const Text('Friends'),
                activeColor: Colors.yellowAccent),
            BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Account'),
                activeColor: Colors.greenAccent),
          ],
        ));
  }
}
