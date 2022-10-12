import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  bool isRememberMe = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
              height: _height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 82),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFormField(
                        controller: userEmailController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter your email";
                          }
                          if (val.length < 5) {
                            return "Please enter valid Email address";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          labelText: "Email",
                          enabled: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter password";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          labelText: "Password",
                          enabled: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () async {
                        if (loginFormKey.currentState!.validate()) {
                          String userEmail = userEmailController.text;
                          String password = passwordController.text;

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          if (userEmail == prefs.getString('userEmail') &&
                              password == prefs.getString('password')) {

                            if(isRememberMe){
                              await prefs.setBool('isRemembered', true);
                            }

                            Navigator.of(context)
                                .pushReplacementNamed('homePage');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              content: const Text(
                                "Username or Password Invalid",
                              ),
                              action: SnackBarAction(
                                  label: "Dismiss", onPressed: () {}),
                            ));
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: Colors.black,
                            onChanged: (val) {
                              setState(() {
                                isRememberMe = val!;
                              });
                            },
                            value: isRememberMe),
                        const Text(
                          "Remember Me",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("registrationPage");
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ) //Login Section
              ),
        ),
      ),
    );
  }
}
