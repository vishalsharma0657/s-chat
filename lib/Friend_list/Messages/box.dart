import 'package:flutter/material.dart';

class FriendBox extends StatelessWidget {
  final String name;
  const FriendBox(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 60,
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
