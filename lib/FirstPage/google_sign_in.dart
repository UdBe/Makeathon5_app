import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makeathon5_app/HomePage/main.dart';

import '../SharedPreferences.dart';

FindTeamName() async {
  DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(await getUserID())
      .get()
      .then((value) async {
    Map<String, dynamic> userdetails = value.data() as Map<String, dynamic>;
    await SaveTeamName(userdetails['Team']);
    return value;
  });
}

GoogleSignIn? googleSignIn;

class Authentication {
  Future<UserCredential> signInWithGoogle() async {
    googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn!.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

Future<void> updateOnDatabase(User user) async {
  final databaseRef =
      FirebaseDatabase.instance.ref().child('Users').child(user.uid);
  databaseRef.child('Name').set(user.providerData[0].displayName);
}

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        child: Container(
          // margin: EdgeInsets.fromLTRB(0, 10, 20, 50),
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 216, 217, 216))),
            onPressed: () {
              Authentication().signInWithGoogle().then(
                (value) async {
                  User? user = value.user;
                  String? userEmail =
                      FirebaseAuth.instance.currentUser?.email.toString();
//
                  CollectionReference users =
                      FirebaseFirestore.instance.collection("users");
                  final query = users.where("Email", isEqualTo: userEmail);
                  query.get().then((value) async {
                    if (value.docs.isNotEmpty) {
                      String userId = value.docs.first.id;
                      await saveUserID(userId);
                      await FindTeamName();
                      updateOnDatabase(user!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return HomePage();
                          }),
                        ),
                      );
                    } else {
                      _signOut();
                    }
                  });
//
                },
              );
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                child: Row(
                  children: [
                    Image.asset(
                      'Assets/googlelogo.png',
                      height: 40,
                    ),
                    Spacer(),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 34, 99, 192),
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    googleSignIn!.disconnect();
    Fluttertoast.showToast(msg: 'Please login with your devfolio email');
  }

  Future<void> updateOnDatabase(User user) async {
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Users').child(user.uid);
    databaseRef.child('name').set(user.providerData[0].displayName);
  }
}
