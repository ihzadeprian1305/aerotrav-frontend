import 'package:aerotrav/cubit/auth_cubit.dart';
import 'package:aerotrav/cubit/screen_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 50,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        // image: AssetImage(
                        //   'assets/image_icon_profile.png',
                        // ),
                        image: NetworkImage(
                          state.user.imageProfileUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy, ${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${state.user.email}',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthCubit>().signOut();
                    },
                    child: Image.asset(
                      'assets/image_icon_signout.png',
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: greyTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          color: whiteColor,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem('Edit Profile'),
            ),
            menuItem('Your Transactions'),
            menuItem('Help'),
          ],
        ),
      );
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<ScreenCubit>().setScreen(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (AuthState is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // return Center(
        //   child: CustomButton(
        //     title: 'Sign Out',
        //     onPressed: () {
        //       context.read<AuthCubit>().signOut();
        //     },
        //     width: 220,
        //   ),
        // );
        return Column(
          children: [
            header(),
            body(),
          ],
        );
      },
    );
  }
}
