import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top decoration
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/main_top.png', width: 100),
          ),

          // Login illustration
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/login.svg',
                width: 300,
                height: 300,
              ),
            ),
          ),

          // Bottom decoration
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/login_bottom.png', width: 100),
          ),

          // Login form
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // EMAIL
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Please enter your email',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.purple,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 183, 228),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }

                      return null;
                    },

                    onSaved: (value) {
                      _email = value;
                    },
                  ),

                  const SizedBox(height: 15),

                  // PASSWORD
                  TextFormField(
                    obscureText: _obscurePassword,
                    obscuringCharacter: '*',

                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Please enter your password',

                      prefixIcon: const Icon(Icons.lock, color: Colors.purple),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.purple,
                        ),

                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),

                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 183, 228),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (value.length < 6) {
                        return 'The password must be at least 6 characters long';
                      }

                      return null;
                    },

                    onSaved: (value) {
                      _password = value;
                    },
                  ),

                  const SizedBox(height: 20),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          print('Email: $_email');
                          print('Password: $_password');
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                      ),

                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );
    },
    backgroundColor: Colors.purple,
    child: const Icon(
      Icons.home,
      color: Colors.white,
    ),
  ),
    );
  }
}
