import 'package:aerotrav/cubit/screen_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key,
    required this.index,
    required this.imageUrl,
    // this.isSelected = false,
  }) : super(key: key);

  final int index;
  final String imageUrl;
  // final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ScreenCubit>().setScreen(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          // Container(
          //   width: 24,
          //   height: 24,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(
          //         imageUrl,
          //       ),
          //     ),
          //   ),
          // ),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<ScreenCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              // color: isSelected ? primaryColor : transparentColor,
              color: context.read<ScreenCubit>().state == index
                  ? primaryColor
                  : transparentColor,
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
