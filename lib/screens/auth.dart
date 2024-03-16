import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  bool _loginMode = true;

  final _formKey = GlobalKey<FormState>();

  String _enteredEmail = '';
  String _enteredPassword = '';

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
    }
  }

  @override
  void initState() {
    _loginMode = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 200,
                child: Image.asset("assets/images/messenger_logo.png"),
              ),
              Form(
                  key: _formKey,
                  child: Card(
                    margin: const EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              label: const Text("Email"),
                              labelStyle:
                                  const TextStyle().copyWith(fontSize: 15),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return "Please enter a vaild email address";
                              }
                            },
                            onSaved: (newValue) {
                              _enteredEmail = newValue!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                label: const Text("Password"),
                                labelStyle:
                                    const TextStyle().copyWith(fontSize: 15),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5)),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return "Password should be at least 6 characters";
                              }
                            },
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FilledButton(
                              onPressed: () {
                                _submit();
                              },
                              child: Text(_loginMode ? "Login" : "Sign up")),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _loginMode = !_loginMode;
                              });
                            },
                            child: Text(_loginMode
                                ? "Create an account"
                                : "Already have an Account"),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
