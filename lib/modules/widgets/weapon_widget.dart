import 'package:flutter/material.dart';
import 'package:design_task/model/weapons_api_model.dart';
import 'package:design_task/modules/manager/api_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeaponWidget extends StatelessWidget {
  static const String routeName = "WeaponWidget";
  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeaponModel>(
      future: apiManager.fetchWeapons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Skeleton.unite(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ac_unit, size: 32),
                SizedBox(width: 8),
                Icon(Icons.access_alarm, size: 32),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading weapons'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found'));
        } else {
          var weapons = snapshot.data!.data ?? [];
          return ListView.builder(
            itemCount: weapons.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: weapons[index].displayIcon != null
                    ? Image.network(
                        weapons[index].displayIcon!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      )
                    : null,
                title: Text(
                  weapons[index].displayName ?? 'Unknown Weapon',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          );
        }
      },
    );
  }
}
