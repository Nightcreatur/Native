import 'package:device/provider/place.dart';
import 'package:device/screens/add_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatelessWidget {
  static const routeName = './place-list';
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPlace.routeName);
              // Navigator.of(context).push(
              //   CustomPageRoute(
              //     builder: ((context) => const AddPlace()),
              //   ),
              // );
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: ((context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: const Center(
                        child: Text('No Place added yet, wanna add some?'),
                      ),
                      builder: (context, value, ch) => value.item.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: value.item.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(value.item[index].image)),
                                title: Text(value.item[index].title),
                                onTap: () {},
                              ),
                            ),
                    ))),
    );
  }
}
