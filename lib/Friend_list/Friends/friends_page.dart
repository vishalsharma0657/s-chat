import 'package:flutter/material.dart';
import 'package:s_chat/Friend_list/Messages/box.dart';
import 'package:s_chat/Friend_list/Messages/dummy_name.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add friend',
            style: TextStyle(fontSize: 22, color: Colors.orange),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: 'enter username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Your friends',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return FriendBox(friends[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
