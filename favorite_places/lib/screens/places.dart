import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/places_notifier.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  void _addItem(BuildContext context) async {
    await Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (ctx) => const AddPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeList = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              _addItem(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: PlaceList(
        places: placeList,
      ),
    );
  }
}
