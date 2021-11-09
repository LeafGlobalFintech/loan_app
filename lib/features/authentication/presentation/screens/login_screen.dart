import 'package:flutter/material.dart';

import 'package:loan_app/features/authentication/authentication.dart';
import 'package:loan_app/features/home/home.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider _authProvider;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _authProvider = AuthProvider();
    _authProvider.addListener(() {
      if (_authProvider.loggedIn && !_authProvider.loading) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return NewHomeScreen();
          }),
          (route) => false,
        );
      }
      if (!_authProvider.loading && _authProvider.errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_authProvider.errorMessage),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _authProvider,
      builder: (context, _) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(),
        ),
        extendBody: true,
        bottomSheet: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log in",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                sizedBoxFifteen,
                Consumer<AuthProvider>(
                  builder: (context, _, __) => Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthTextField(
                          controller: usernameController,
                          hintText: 'Username',
                        ),
                        sizedBoxFifteen,
                        AuthTextField(
                          controller: passwordController,
                          hintText: 'Password',
                        ),
                        sizedBoxFifteen,
                        TextButton(
                            onPressed: !_authProvider.loading
                                ? () {
                                    _authProvider.login(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                : null,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_authProvider.loading)
                                  SizedBox(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    height: 20,
                                    width: 20,
                                  ),
                                if (_authProvider.loading)
                                  SizedBox(
                                    width: 10,
                                  ),
                                Text(
                                  'Log In',
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.9, 50),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(color: Colors.black, width: 0.9),
                            ))
                      ],
                    ),
                  ),
                ),
                sizedBoxFifteen,
                Text(
                  "Forgot password",
                  style: TextStyle(color: Color(0xFFA4A4A4)),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Color(0xFFA4A4A4)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign up on Leaf Wallet",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget get sizedBoxFifteen => SizedBox(
      height: 15,
    );
