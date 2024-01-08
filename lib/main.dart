import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:municipality/src/features/home/screen/home_user.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Municipality',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home: const HomeUser(),
      ),
    );
  }
}
