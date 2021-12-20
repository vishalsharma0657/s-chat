import 'package:flutter/material.dart';

class FriendBox extends StatelessWidget {
  final String name;
  final int idx;
  const FriendBox(this.name, this.idx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.account_circle,
              color: col[idx],
              size: 60,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20, color: col[idx]),
          )
        ],
      ),
    );
  }
}

List<Color> col = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.lightGreen,
  Colors.blue,
  Colors.pink,
  Colors.deepPurpleAccent,
];
