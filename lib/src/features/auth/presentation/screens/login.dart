import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/form_login.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: Stack(
          children: [
            const Background(),
            Positioned(
              left: 25,
              right: 25,
              top: screen.height * 0.3,
              child: const FormLogin(),
            ),
          ],
        ),
      ),
    );
  }
}
