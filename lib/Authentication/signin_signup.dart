import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s_chat/Authentication/btn_and_input.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: Colors.indigo[900],
            color: Colors.grey[900]),
        child: SizedBox(
          height: 330,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                         
                          setState(() {
                            flag = true;
                          });
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 24,
                            color: flag == true ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(fontSize: 28),
                      ),
                      TextButton(
                        onPressed: () {
                          
                          setState(() {
                            flag = false;
                          });
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 24,
                            color: flag == false ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 4,
                    thickness: 2,
                  ),
                ],
              ),
              const TxtWidget(
                  'Username', Icons.account_circle, TextInputType.name),
              if (!flag)
                const TxtWidget('Phone no.', Icons.call, TextInputType.phone),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TxtWidget(
                      'OTP', Icons.confirmation_number, TextInputType.number),
                  TextButton(
                    onPressed: () { 
               },
                    child: const Text(
                      'Generate OTP',
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ),
                ],
              ),
              Btn(flag),
            ],
          ),
        ),
      ),
    );
  }
}
