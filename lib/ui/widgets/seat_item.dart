import 'package:aerotrav/cubit/seat_cubit.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  const SeatItem({
    Key? key,
    // required this.status,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  // final int status;
  final String id;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.read<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableColor;
        }
      }
      // switch (status) {
      //   case 0:
      //     return availableColor;
      //   case 1:
      //     return primaryColor;
      //   case 2:
      //     return unavailableColor;
      //   default:
      //     unavailableColor;
      // }
    }

    borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return primaryColor;
      }
      // switch (status) {
      //   case 0:
      //     return primaryColor;
      //   case 1:
      //     return primaryColor;
      //   case 2:
      //     return unavailableColor;
      //   default:
      //     unavailableColor;
      // }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        );
      } else {
        return SizedBox();
      }

      // switch (status) {
      //   case 0:
      //     return SizedBox();
      //   case 1:
      //     return Center(
      //       child: Text(
      //         'YOU',
      //         style: whiteTextStyle.copyWith(
      //           fontSize: 16,
      //         ),
      //       ),
      //     );
      //   case 2:
      //     return SizedBox();
      //   default:
      //     SizedBox();
      // }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: backgroundColor(),
          border: Border.all(
            // color: borderColor()!,
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
