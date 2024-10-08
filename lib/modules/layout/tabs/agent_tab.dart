import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_task/model/agents_api_model.dart';
import 'package:design_task/modules/manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:design_task/modules/widgets/character_custom_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AgentsTab extends StatelessWidget {
  static String routeName = "AgentsTab";

  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AgentsModel>(
      future: apiManager.fetchAgents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Skeletonizer(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading agents'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No data found'));
        } else {
          var agents = snapshot.data!.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
              ),
              items: agents.map((agent) {
                return CharacterCustomWidget(
                    selectedIndex: agents.indexOf(agent),
                    txt: agent.displayName ?? 'Unknown',
                    imgPaths: [agent.fullPortrait ?? ''],
                    color: agent.backgroundGradientColors
                            ?.map((color) => Color(int.parse('0xff$color')))
                            .toList() ??
                        [Colors.black, Colors.black]);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
