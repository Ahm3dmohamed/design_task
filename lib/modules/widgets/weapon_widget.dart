import 'package:flutter/material.dart';
import 'package:design_task/model/weapons_api_model.dart';
import 'package:design_task/modules/manager/api_manager.dart';

class WeaponWidget extends StatelessWidget {
  static const String routeName = "WeaponWidget";
  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeaponModel>(
      future: apiManager.fetchWeapons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading weapons'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found'));
        } else {
          var weapons = snapshot.data!.data ?? [];
          return ListView.builder(
            itemCount: weapons.length,
            itemBuilder: (context, index) {
              final angel = index % 2 == 0 ? 5 / 12 : -5 / 12;

              return Container(
                height: 190,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Card(
                        margin: const EdgeInsets.only(
                            left: 12, right: 12, top: 24, bottom: 24),
                        color: const Color(0xff081E34),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      left: 5,
                      top: 0,
                      child: Transform.rotate(
                        angle: angel,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: weapons[index].displayIcon != null
                              ? Image.network(
                                  weapons[index].displayIcon!,
                                  fit: BoxFit.contain,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                )
                              : const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weapons[index].displayName ?? 'Unknown Weapon',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          // Text(
                          //   weapons[index].category ?? 'Unknown Category',
                          //   style: const TextStyle(
                          //     color: Colors.white70,
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
