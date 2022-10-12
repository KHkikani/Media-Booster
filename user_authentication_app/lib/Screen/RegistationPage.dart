import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController regiUserEmailController = TextEditingController();
  final TextEditingController regiPasswordController = TextEditingController();
  final TextEditingController regiFirstNameController = TextEditingController();
  final TextEditingController regiLastNameController = TextEditingController();

  GlobalKey<FormState> registrationFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
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
              key: registrationFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 82),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: regiFirstNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter first name";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "First Name",
                        labelText: "First Name",
                        enabled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: regiLastNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your last name";
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Last Name",
                        labelText: "Last Name",
                        enabled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: regiUserEmailController,
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
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: regiPasswordController,
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
                      if (registrationFormKey.currentState!.validate()) {
                        String userEmail = regiUserEmailController.text;
                        String password = regiPasswordController.text;
                        String firstName = regiFirstNameController.text;

                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        await prefs.setString('userEmail', userEmail);
                        await prefs.setString('password', password);
                        await prefs.setString('username', firstName);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("New User Registered."),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            action: SnackBarAction(
                                label: "Dismiss", onPressed: () {}),
                          ),
                        );
                      }

                      setState(() {
                        registrationFormKey.currentState!.reset();
                        regiPasswordController.clear();
                        regiUserEmailController.clear();
                        regiFirstNameController.clear();
                        regiLastNameController.clear();
                      });
                    },
                    child: Container(
                      width: _width,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context)
                                .pushReplacementNamed("loginPage");
                          });
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ), //SignUp Section
          ),
        ),
      ),
    );
  }
}
