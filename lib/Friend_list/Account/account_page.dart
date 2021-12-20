import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person_rounded,
                size: 80,
                color: Colors.blue,
              ),
            ),
            Text(
              'username',
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            Text(
              '+91-9876543210',
              style: TextStyle(fontSize: 22, color: Colors.yellow),
            ),
            Text(
              '0  friends',
              style: TextStyle(fontSize: 22, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}
