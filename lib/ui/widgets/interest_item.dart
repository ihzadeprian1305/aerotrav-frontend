import 'package:aerotrav/shared/theme.dart';
import 'package:flutter/cupertino.dart';

class InterestItem extends StatelessWidget {
  const InterestItem({
    Key? key,
    required this.interest,
  }) : super(key: key);

  final String interest;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            'Kids Park',
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
