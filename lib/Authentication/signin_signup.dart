import 'package:flutter/material.dart';
import 'package:s_chat/Authentication/btn_and_input.dart';
import 'package:s_chat/Chat_Page/chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool flag = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const TextField(
                   
                    decoration: InputDecoration(labelText: "User name"),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: "Phone number"),
                    keyboardType: TextInputType.phone,
                  ),
                  TextField(
                    controller: otpController,
                    decoration: InputDecoration(labelText: "OTP"),
                    keyboardType: TextInputType.number
                  ),
                  TextButton(
                    onPressed: () {
                    loginWithPhone();
                    },
                    child: const Text(
                      'Generate OTP',
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ),
                ],
              ),
              TextButton(onPressed: verifyOTP, child: Text("VERIFY"))
            ],
          ),
        ),
      ),
    );
  }
void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
      (value) {
        print("You are logged in successfully");
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(),
          ),
        );
      },
    );
  }
}
