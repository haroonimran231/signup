import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/pages/home_page.dart';
import 'package:signup/pages/login_page.dart';
import 'package:signup/pages/signup_page.dart';
// import 'package:login/models/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Splash splashPage = Splash();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 4));

    // Check if the user is already logged in
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User is logged in, navigate to home page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomePage(onPress: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => HomePage(onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUPPage()));
                }),
              ),
            );
          }),
        ),
      );
    } else {
      // User is not logged in, navigate to login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginPage(),
        ),
      );
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "School",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   splashPage.isLogin(context);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: Center(
  //       child: Text("Splash"),
  //     ),
  //   );
  // }
}
