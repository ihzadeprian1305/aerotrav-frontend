import 'dart:convert';

import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String place;
  final String city;
  final String about;
  final String imageUrl;
  final double rating;
  final int price;

  DestinationModel({
    required this.id,
    this.place = '',
    this.city = '',
    this.about = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        place: json['place'],
        city: json['city'],
        about: json['about'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'place': place,
        'city': city,
        'about': about,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        place,
        city,
        about,
        imageUrl,
        rating,
        price,
      ];
}
