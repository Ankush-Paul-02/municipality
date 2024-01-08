import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:municipality/src/auth/screens/login_screen.dart';
import 'package:municipality/src/features/home/screen/home_admin.dart';
import 'package:municipality/src/features/home/screen/home_supervisor.dart';
import 'package:municipality/src/features/home/screen/home_thikadar.dart';
import 'package:municipality/src/features/home/screen/home_user.dart';
import 'package:municipality/src/theme/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/auth_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedUserType = 'User';

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
                image: AssetImage('assets/register.png'),
                fit: BoxFit.cover,
                height: 180,
                width: 180,
              ),
              AuthField(
                label: 'Name',
                hint: 'Enter your username',
                icon: Icons.person,
                controller: _userController,
                inputType: TextInputType.emailAddress,
              ),
              20.heightBox,
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
              AuthField(
                label: 'Confirm Password',
                hint: 'Enter your password',
                icon: Icons.lock,
                controller: _confirmPasswordController,
                inputType: TextInputType.number,
                isObscure: true,
              ),
              20.heightBox,
              AuthField(
                label: 'Phone',
                hint: 'Enter your phone number',
                icon: Icons.phone,
                controller: _phoneController,
                inputType: TextInputType.number,
                isObscure: true,
              ),
              20.heightBox,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedUserType,
                    onChanged: (value) {
                      setState(() {
                        _selectedUserType = value!;
                      });
                    },
                    items: [
                      'User',
                      'Supervisor',
                      'Thikadar',
                      'Admin',
                    ].map((String userType) {
                      return DropdownMenuItem<String>(
                        value: userType,
                        child: Text(
                          userType,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
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
                  onPressed: () {
                    if (_selectedUserType == 'User') {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (context) => const HomeUser(),
                        ),
                        (route) => false,
                      );
                    } else if (_selectedUserType == 'Supervisor') {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (context) => const HomeSupervisor(),
                        ),
                        (route) => false,
                      );
                    } else if (_selectedUserType == 'Thikadar') {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (context) => const HomeThikadar(),
                        ),
                        (route) => false,
                      );
                    } else if (_selectedUserType == 'Admin') {
                      Navigator.of(context).pushAndRemoveUntil(
                        CupertinoPageRoute(
                          builder: (context) => const HomeAdmin(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: 'Register'
                      .text
                      .size(20)
                      .bold
                      .white
                      .make()
                      .pSymmetric(v: 10),
                ),
              ),
              20.heightBox,
              'or'.text.semiBold.size(18).color(Colors.grey).make(),
              20.heightBox,
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: color3,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => const LoginScreen(),
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
