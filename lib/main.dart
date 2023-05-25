import 'package:device/provider/place.dart';
import 'package:device/screens/add_places.dart';
import 'package:device/screens/places_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = ColorScheme(
      primary: Colors.blue,
      secondary: Colors.green,
      surface: Colors.white,
      background: Colors.grey.shade200,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    );

    final myTheme = ThemeData(
      colorScheme: myColorScheme,
    );

    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: myTheme,
        home: const PlacesList(),
        routes: {
          PlacesList.routeName: (context) => const PlacesList(),
          AddPlace.routeName: (context) => const AddPlace(),
        },
      ),
    );
  }
}
