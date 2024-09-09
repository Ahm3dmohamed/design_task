import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:design_task/model/maps_api_model.dart';
import 'package:design_task/modules/manager/api_manager.dart';

class MapWidget extends StatelessWidget {
  static const String routeName = "MapWidget";
  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MapsModel>(
      future: apiManager.fetchMaps(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading maps'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found'));
        } else {
          var maps = snapshot.data!.data!;
          return Skeletonizer(
            enabled: snapshot.connectionState == ConnectionState.waiting,
            child: ListView.builder(
              itemCount: maps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    maps[index].displayName ?? 'Unknown',
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: maps[index].displayIcon != null
                      ? Image.network(maps[index].displayIcon!)
                      : null,
                );
              },
            ),
          );
        }
      },
    );
  }
}
