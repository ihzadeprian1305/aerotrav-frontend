import 'package:aerotrav/cubit/auth_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget nameInput() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return CustomTextFormField(
              title: 'Full Name',
              hintText: state.user.name,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              controller: emailController,
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget emailInput() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return CustomTextFormField(
              title: 'Email Address',
              hintText: state.user.email,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              controller: emailController,
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget body() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
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
                  nameInput(),
                  emailInput(),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Profile',
          style: blackTextStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: greenColor,
            ),
          )
        ],
      ),
      body: body(),
    );
  }
}
