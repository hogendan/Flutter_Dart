import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          if (place.image != null)
            Image.file(
              place.image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                place.location.address,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
