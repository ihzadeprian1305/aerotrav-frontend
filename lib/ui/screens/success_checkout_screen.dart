import 'package:aerotrav/cubit/screen_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  const SuccessCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(
                bottom: 80,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_schedule.png',
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              onPressed: () {
                context.read<ScreenCubit>().setScreen(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              margin: EdgeInsets.only(
                top: 50,
              ),
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}
