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
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading maps'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found'));
        } else {
          var maps = snapshot.data!.data!;
          return Skeletonizer(
            child: ListView.builder(
              itemCount: maps.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      Image.network(
                          height: 224,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          maps[index].listViewIcon ?? "Error "),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 9,
                          left: 9,
                        ),
                        child: Text(
                          maps[index].displayName ?? 'Unknown',
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -5,
                        bottom: -5,
                        child: maps[index].displayIcon != null
                            ? Image.network(
                                maps[index].displayIcon!,
                                height: 130,
                                width: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.error);
                                },
                              )
                            : Icon(Icons.map),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
