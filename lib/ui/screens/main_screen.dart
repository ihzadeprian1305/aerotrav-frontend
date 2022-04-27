import 'package:aerotrav/cubit/screen_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/screens/home_screen.dart';
import 'package:aerotrav/ui/screens/setting_screen.dart';
import 'package:aerotrav/ui/screens/transaction_screen.dart';
import 'package:aerotrav/ui/screens/wallet_screen.dart';
import 'package:aerotrav/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeScreen();
        case 1:
          return TransactionScreen();
        case 2:
          return WalletScreen();
        case 3:
          return SettingScreen();
        default:
          return HomeScreen();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(
              18,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/image_icon_globe.png',
                // isSelected: true,
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/image_icon_booking.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/image_icon_card.png',
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: 'assets/image_icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<ScreenCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              buildContent(
                currentIndex,
              ),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
