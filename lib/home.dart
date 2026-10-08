import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'log_in.dart';
import 'sign_in.dart';

class HomePage extends StatelessWidget {
   const  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: 100,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/icons/chat.svg',
              width: 300,
              height: 300,
            ),
          ),
           Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_bottom.png',
              width: 100,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context) => const LoginPage(),
      ),
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 5,
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 220, 183, 228),
                    foregroundColor: const Color.fromARGB(255, 45, 45, 45),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 5,
                  ),
                  child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
