// import 'package:chat_app/components/usermodel.dart';
// import 'package:chat_app/pages/chat.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vid_dowloader/authenticate/auth_google.dart';

class LoginComp extends StatefulWidget {
  const LoginComp({super.key});

  @override
  State<LoginComp> createState() => _LoginCompState();
}

class _LoginCompState extends State<LoginComp> {
  final AuthGoogle _authGoogle = AuthGoogle();
  final _loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  void checkVal() {
    // String email = emailController.text.trim();
    // String password = passController.text.trim();

    // signin(email, password);
  }

  // void signin(String email, String password) async {
  //   UserCredential? credential;
  //   try {
  //     credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     print(e.code.toString());

  //     if (e.code.toString() == "wrong-password" ||
  //         e.code.toString() == "user-not-found") {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text(
  //         "Incorrect Password/Email",
  //         style: TextStyle(fontFamily: 'Poppins', letterSpacing: 1.2),
  //       )));
  //     }
  //   }

  //   if (credential != null) {
  //     String uid = credential.user!.uid;
  //     DocumentSnapshot userData =
  //         await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //     // ignore: unused_local_variable
  //     UserModel userModel =
  //       UserModel.fromMap(userData.data() as Map<String, dynamic>);

  //       // ignore: use_build_context_synchronously
  //       Navigator.push(context,MaterialPageRoute(builder: (context){
  //         return Chat(userModel: userModel, firebaseUser: credential!.user!);
  //       }));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _loginKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailController,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Amigo',
                    letterSpacing: 1.2,
                    fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.white,
                      fontSize: 19),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter some value";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Amigo',
                    letterSpacing: 1.2,
                    fontSize: 20),
                decoration: InputDecoration(
                  fillColor: Colors.blue,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.blue : Colors.white,
                      fontSize: 19),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter some value";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 180,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_loginKey.currentState!.validate()) {
                      checkVal();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                          'Logging In',
                          style: TextStyle(
                              fontFamily: 'Amigo', letterSpacing: 1.2),
                        )),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(183, 84, 255, 84),
                      textStyle:
                          const TextStyle(fontSize: 20, letterSpacing: 1.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: const Text("Submit"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 70,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool res =
                              await _authGoogle.signInWithGoogle(context);
                          if (res) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Image(
                          image: AssetImage('assets/google.png'),
                          width: 50,
                          height: 50,
                        ),
                      )),
                  SizedBox(
                      width: 70,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Image(
                          image: AssetImage('assets/apple.png'),
                          width: 50,
                          height: 50,
                        ),
                      )),
                  SizedBox(
                      height: 60,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Image(
                          image: AssetImage('assets/github.png'),
                          width: 50,
                          height: 50,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
