import 'dart:io';

import 'package:device/helpers/db_hepler.dart';
import 'package:device/models/great_place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _item = [];

  List<Place> get item {
    return [..._item];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);
    _item.add(newPlace);
    notifyListeners();

    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    final listData = await dataList;
    _item = listData
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(
              item['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
