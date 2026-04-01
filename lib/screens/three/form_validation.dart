import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  String request = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  // validate email and password fields when the user taps the login button
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // dispose the controllers when the widget is removed from the widget tree
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // this will hide the keyboard when tapping outside of the text fields
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  // form title
                  Text(
                    'Form Validation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  // form fields and validation logic here
                  // Email field
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    onChanged: (_) => setState(() {}),
                    validator: validateEmail,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white54),
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password field
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    onChanged: (_) => setState(() {}),
                    validator: validatePassword,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    obscureText: isPasswordHidden,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white54),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        child: Icon(
                          isPasswordHidden
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: Colors.white54,
                        ),
                      ),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white54),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.deepPurpleAccent),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  // Login button
                  GestureDetector(
                    onTap:
                        _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                request =
                                    'Email: ${_emailController.text}, /Password: ${_passwordController.text}';
                              });
                            }
                          }
                        : null,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color:
                            _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty
                            ? Colors.deepPurpleAccent
                            : Colors.white54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'request : $request',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
