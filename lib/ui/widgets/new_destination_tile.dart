import 'package:aerotrav/models/destination_model.dart';
import 'package:aerotrav/shared/theme.dart';
import 'package:aerotrav/ui/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NewDestinationTile extends StatelessWidget {
  const NewDestinationTile({
    Key? key,
    // required this.place,
    // required this.city,
    // required this.imageUrl,
    // this.rating = 0.0,
    required this.destination,
  }) : super(key: key);

  // final String place;
  // final String city;
  // final String imageUrl;
  // final double rating;

  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              destination: destination,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          color: whiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  18,
                ),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      destination.imageUrl,
                    )
                    //image: AssetImage(
                    //   imageUrl,
                    // ),
                    ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.place,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 24,
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image_icon_star.png',
                      ),
                    ),
                  ),
                ),
                Text(
                  destination.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
