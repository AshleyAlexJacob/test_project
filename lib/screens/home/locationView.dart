import 'package:flutter/material.dart';
import 'package:project_1/demoRepo/locationsRepo.dart';
import 'package:project_1/shared/tagButton.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  List<bool> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: LocationRepo().locations.length,
        // itemCount: 6,
        itemBuilder: (context, index) {
          selectedTags.add(false);
          return TagButton(
            tagValue: LocationRepo().locations[index].tag,
            selected: selectedTags[index],
            callback: () {
              setState(() {
                selectedTags[index] = !selectedTags[index];
              });
            },
          );
        });
  }
}
