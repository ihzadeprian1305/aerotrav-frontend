import 'package:aerotrav/cubit/auth_cubit.dart';
import 'package:aerotrav/cubit/destination_cubit.dart';
import 'package:aerotrav/cubit/screen_cubit.dart';
import 'package:aerotrav/cubit/seat_cubit.dart';
import 'package:aerotrav/cubit/transaction_cubit.dart';
import 'package:aerotrav/ui/screens/bonus_screen.dart';
import 'package:aerotrav/ui/screens/choose_seat_screen.dart';
import 'package:aerotrav/ui/screens/edit_profile_screen.dart';
import 'package:aerotrav/ui/screens/get_started_screen.dart';
import 'package:aerotrav/ui/screens/main_screen.dart';
import 'package:aerotrav/ui/screens/sign_in_screen.dart';
import 'package:aerotrav/ui/screens/sign_up_screen.dart';
import 'package:aerotrav/ui/screens/splash_screen.dart';
import 'package:aerotrav/ui/screens/success_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScreenCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/get-started': (context) => GetStartedScreen(),
          '/sign-in': (context) => SignInScreen(),
          '/sign-up': (context) => SignUpScreen(),
          '/bonus': (context) => BonusScreen(),
          '/main': (context) => MainScreen(),
          '/success': (context) => SuccessCheckoutScreen(),
          '/edit-profile': (context) => EditProfileScreen(),
        },
      ),
    );
  }
}
