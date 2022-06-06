import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:light_controller_app/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formGlobalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
          body: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 60),
                    Form(
                        key: formGlobalKey,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 7)
                              ]),
                          child: Column(
                            children: [
                              const SizedBox(height: 60),
                              TextFormField(
                                maxLines: 1,
                                style: const TextStyle(fontSize: 18),
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  helperText: " ",
                                ),
                                validator: (email) {
                                  if (isEmailValid(email!)) {
                                    return null;
                                  } else {
                                    return 'Enter a valid email address';
                                  }
                                },
                              ),
                              TextFormField(
                                controller: passwordController,
                                style: const TextStyle(fontSize: 18),
                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  helperText: " ",
                                ),
                                obscureText: true,
                                validator: (password) {
                                  if (isPasswordValid(password!)) {
                                    return null;
                                  } else {
                                    return 'Password has more than 6 charectors';
                                  }
                                },
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      enableFeedback: true,
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                              (states) {
                                        return states
                                                .contains(MaterialState.pressed)
                                            ? Colors.white60
                                            : null;
                                      }),
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(200, 45)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  204, 46, 247, 20)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              side: const BorderSide(
                                                  color: Colors.black,
                                                  width: 3)))),
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      formGlobalKey.currentState!.save();
                                      signIn();
                                    }
                                  },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )).pOnly(top: 12, bottom: 12),
                            ],
                          ).pOnly(left: 8, right: 8, top: 10),
                        )),
                  ],
                ),
                Image.asset('assets/images/logo_small.png')
              ],
            ),
          ).centered()),
    );
  }

  bool isEmailValid(String email) => email.contains('@') && email.isNotEmpty;
  bool isPasswordValid(String password) => password.length >= 6;

  Future signIn() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong, Please check your Email and Password",
        toastLength: Toast.LENGTH_LONG,
      );
      debugPrint(e.toString());
    }
  }
}
