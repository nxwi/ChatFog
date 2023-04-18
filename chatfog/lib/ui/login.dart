import 'package:chatfog/ui/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            color: const Color(0xffFFCB45),
            child: Image.asset(
              'assets/image/home.png',
              width: MediaQuery.of(context).size.width * 1,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 50, left: 25, right: 25),
                    child: const Text(
                      'Welcome to ChatFog',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xffFFCB45),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Connect with people around you anonymously and safely',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width - 100,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          authService.signinWithGoogle(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFFCB45),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/image/google.png',
                              width: 30,
                            ),
                            const Text('Continue with Google'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
