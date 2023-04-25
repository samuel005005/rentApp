import 'package:flutter/material.dart';
import 'package:rest_house_rd/src/ui/theme/colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _Background(),
          Positioned(
            left: 25,
            right: 25,
            top: screen.height * 0.3,
            child: const Form(),
          ),
        ],
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
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
    return SizedBox(
      width: 400,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              TextFormField(
                focusNode: _focusEmail,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_outlined,
                      color: _focusEmail.hasFocus
                          ? ColorsApp.primaryColor
                          : Colors.grey.shade600),
                ),
                style: TextStyle(color: ColorsApp.primaryColor),
              ),
              const SizedBox(height: 30),
              TextFormField(
                focusNode: _focusPassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password ',
                  prefixIcon: Icon(Icons.lock_outline,
                      color: _focusPassword.hasFocus
                          ? ColorsApp.primaryColor
                          : Colors.grey.shade600),
                ),
                style: TextStyle(color: ColorsApp.primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPainter(),
      ),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint2 = Paint();
    // Properties
    paint2.color = ColorsApp.secundaryColor;
    paint2.style = PaintingStyle.fill; // .fill .stroke
    paint2.strokeWidth = 5;

    final pathBackground = Path();

    pathBackground.lineTo(0, size.height * .18);

    pathBackground.quadraticBezierTo(size.width * .1, size.height * .20,
        size.width * 0.28, size.height * .16);

    pathBackground.quadraticBezierTo(
        size.width * .4, size.height * .14, size.width * 0.5, size.height * .2);

    pathBackground.quadraticBezierTo(size.width * .8, size.height * .34,
        size.width * .83, size.height * .15);

    pathBackground.quadraticBezierTo(
        size.width * .82, size.height * .01, size.width * .75, 0);

    canvas.drawPath(pathBackground, paint2);

    final paint = Paint();
    // Properties
    paint.color = ColorsApp.primaryColor;
    paint.style = PaintingStyle.fill; // .fill .stroke
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * .14);

    path.quadraticBezierTo(size.width * .05, size.height * .15,
        size.width * .25, size.height * .11);

    path.quadraticBezierTo(size.width * .35, size.height * 0.1,
        size.width * .45, size.height * .16);

    path.quadraticBezierTo(size.width * .75, size.height * .30, size.width * .8,
        size.height * .15);

    path.quadraticBezierTo(
        size.width * .82, size.height * .1, size.width * .75, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
