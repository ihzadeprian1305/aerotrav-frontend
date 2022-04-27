import 'package:aerotrav/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailItem extends StatelessWidget {
  const BookingDetailItem({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  final String title;
  final String valueText;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(
              right: 6,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/image_icon_check.png',
                ),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              color: valueColor,
            ),
          )
        ],
      ),
    );
  }
}
