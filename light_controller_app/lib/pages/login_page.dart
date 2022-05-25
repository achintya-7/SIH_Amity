import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/LoginPage.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Card(
              key: formGlobalKey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                      color: Colors.black, style: BorderStyle.none)),
              color: Colors.white,
              elevation: 10,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Name"),
                      validator: (name) {
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (email) {
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (password) {
                        return null;
                      },
                    )
                  ],
                ).p(2),
              ).p(4),
            ).pOnly(bottom: 0),
        ),
      ),
    );
  }
}
