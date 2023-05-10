import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rest_house_rd/src/config/routes/app_routes.dart';
import 'package:rest_house_rd/src/config/theme/colors.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  late FocusNode _focusEmail, _focusPassword;
  @override
  void initState() {
    _focusEmail = FocusNode();
    _focusPassword = FocusNode();
    super.initState();

    _focusEmail.addListener(() {
      setState(() {});
    });
    _focusPassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    // final height = screen.height;
    final width = screen.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login",
          style: TextStyle(
            fontSize: width * 0.072992701,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: width * 0.072992701),
        Column(
          children: [
            TextFormField(
              focusNode: _focusEmail,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: Icon(Ionicons.mail_open_outline,
                    color: _focusEmail.hasFocus
                        ? ColorsApp.primaryColor
                        : Colors.grey.shade600),
              ),
              style: TextStyle(color: ColorsApp.primaryColor),
            ),
            SizedBox(height: width * 0.072992701),
            TextFormField(
              focusNode: _focusPassword,
              decoration: InputDecoration(
                hintText: 'Enter your password ',
                prefixIcon: Icon(Ionicons.lock_closed_outline,
                    color: _focusPassword.hasFocus
                        ? ColorsApp.primaryColor
                        : Colors.grey.shade600),
              ),
              style: TextStyle(color: ColorsApp.primaryColor),
            ),
            SizedBox(height: width * 0.072992701),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                onTap: () {},
              )
            ]),
            SizedBox(height: width * 0.072992701),
            SizedBox(
              width: width * 0.729927007,
              height: width * 0.121654501,
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorsApp.primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: ColorsApp.secundaryColor),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Login".toUpperCase(),
                  style: TextStyle(fontSize: width * 0.03406326),
                ),
              ),
            ),
            SizedBox(height: width * 0.072992701),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.grey.shade500),
              ),
              InkWell(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.primaryColor),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              )
            ]),
          ],
        )
      ],
    );
  }
}
