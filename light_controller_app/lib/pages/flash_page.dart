// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:light_controller_app/pages/home_page.dart';
import 'package:light_controller_app/pages/login_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class FlashPage extends StatefulWidget {
  const FlashPage({Key? key}) : super(key: key);

  @override
  State<FlashPage> createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/FlashScreen.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Image.asset(
              'assets/images/logo.jpg',
              height: MediaQuery.of(context).size.height * 0.25,
            ).centered(),
            const Spacer(flex: 5),
            ElevatedButton(
                style: ButtonStyle(
                    enableFeedback: true,
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.white60
                          : null;
                    }),
                    fixedSize: MaterialStateProperty.all(const Size(250, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(204, 46, 247, 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                        )
                      )
                    ),
                onPressed: () {
                  if(FirebaseAuth.instance.currentUser != null){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )).pOnly(bottom: 8),
            ElevatedButton(
                style: ButtonStyle(
                    enableFeedback: true,
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.white60
                          : null;
                    }),
                    fixedSize: MaterialStateProperty.all(const Size(250, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 245, 225, 43)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                        )
                    )
                ),
                onPressed: () {},
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}
