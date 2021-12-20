import 'package:flutter/material.dart';
import 'package:s_chat/Chat_Page/Chats.dart';

class Btn extends StatelessWidget {
  const Btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue[900]),
      child: TextButton(
        onPressed: () {
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatDetailPage()),
            );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Log In',
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}

class TxtWidget extends StatelessWidget {
  final String txt;
  final IconData ic;
  final TextInputType tp;
  const TxtWidget(this.txt, this.ic, this.tp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: tp,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(ic),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: txt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
