import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/providers/places_notifier.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String placeName = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onSaved: (newValue) {
                    placeName = newValue!;
                  },
                ),
                const SizedBox(height: 10),
                ImageInput(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.save();
                        ref.read(placesProvider.notifier).addPlace(
                              Place(title: placeName),
                            );
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Place'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
