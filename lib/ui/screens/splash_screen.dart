import 'dart:async';

import 'package:aerotrav/cubit/auth_cubit.dart';
import 'package:aerotrav/ui/screens/get_started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(
        seconds: 5,
      ),
      () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/get-started', (route) => false);
        } else {
          context.read<AuthCubit>().getCurrentUser(user.uid);
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_icon_airplane.png',
                  ),
                ),
              ),
            ),
            Text(
              'AEROTRAV',
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
