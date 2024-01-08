import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:municipality/src/auth/screens/register_screen.dart';
import 'package:municipality/src/auth/widgets/auth_field.dart';
import 'package:municipality/src/features/home/screen/home_user.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.heightBox,
              const Image(
                image: AssetImage('assets/login.png'),
                fit: BoxFit.cover,
              ),
              AuthField(
                label: 'Email',
                hint: 'Enter your email',
                icon: Icons.email,
                controller: _emailController,
                inputType: TextInputType.emailAddress,
              ),
              20.heightBox,
              AuthField(
                label: 'Password',
                hint: 'Enter your password',
                icon: Icons.lock,
                controller: _passwordController,
                inputType: TextInputType.number,
                isObscure: true,
              ),
              20.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: 'Forgot Password?'
                    .text
                    .color(color3)
                    .semiBold
                    .size(16)
                    .make(),
              ),
              30.heightBox,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: color3,
                  ),
                  onPressed: () => Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const HomeUser(),
                    ),
                  ),
                  child:
                      'Login'.text.size(20).bold.white.make().pSymmetric(v: 10),
                ),
              ),
              20.heightBox,
              'or login with'.text.semiBold.size(18).color(Colors.grey).make(),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/google.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  20.widthBox,
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/facebook.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  20.widthBox,
                  Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/twitter.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              30.heightBox,
              RichText(
                text: TextSpan(
                  text: 'Or, doesn\'t have an account? ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: color3,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
