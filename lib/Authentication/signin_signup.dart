import 'package:flutter/material.dart';
import 'package:s_chat/Authentication/btn_and_input.dart';
import 'package:s_chat/Chat_Page/chats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:s_chat/Friend_list/listpage.dart';
import 'package:s_chat/Friend_list/details_user/details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  TextEditingController otpController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = new TextEditingController();
  bool flag = false;
  bool isLoggedIn = false;
  String name = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  
   @override
  void initState() {
    super.initState();
    autoLogIn();
  }
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('name');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }

  
  bool otpVisibility = false;
  var f = 1;
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
                  TextField(
                    controller: userController,
                    obscureText: true,
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
                      decoration: const InputDecoration(labelText: "OTP"),
                      keyboardType: TextInputType.number),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        flag = true;
                      });
                      var msgg = await checkuser(
                          userController.text, phoneController.text);
                      var msgz = jsonDecode(msgg.body);
                      var lmsg = msgz['result'];
                      print(lmsg);
                      print(msgz);

                      if (lmsg == "old bakra") {
                        loginWithPhone();
                      } else if (lmsg == "new bakra") {
                        f = 2;
                        loginWithPhone();
                      } else {
                        Fluttertoast.showToast(
                          msg: lmsg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    child: const Text(
                      'Generate OTP',
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    ),
                  ),
                ],
              ),
              TextButton(onPressed: verifyOTP, child: const Text("VERIFY"))
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
    print(credential);
    
    await auth.signInWithCredential(credential).then(
      (value) async {
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
        await addUser(phoneController.text, userController.text);
        usrname = userController.text;
         final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', userController.text);

    setState(() {
      name = userController.text;
      isLoggedIn = true;
    });

    userController.clear();
        navigation();
      },
    );
  }

  navigation() async {
    var ussr = await fetchUserDetails(usrname);
     
    final usr = jsonDecode(ussr.body);
    usrname = usr['name'];
    phoneNo = usr['phone_no'];
    for (String k in usr['friends'].keys) {
      friends.add(usr['friends'][k]);
    }

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListPage(userController.text),
        ));
  }
}
