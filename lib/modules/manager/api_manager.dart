import 'dart:convert';
import 'package:design_task/model/agents_api_model.dart';
import 'package:design_task/model/maps_api_model.dart';
import 'package:design_task/model/weapons_api_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  final String _agentsUrl = "https://valorant-api.com/v1/agents";
  final String _mapsUrl = "https://valorant-api.com/v1/maps";
  final String _weaponsUrl = "https://valorant-api.com/v1/weapons";

  // Fetch Agents
  Future<AgentsModel> fetchAgents() async {
    try {
      final response = await http.get(Uri.parse(_agentsUrl));
      if (response.statusCode == 200) {
        return AgentsModel.fromJson(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode}');
        throw Exception("Failed to load agents");
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception("Failed to load agents");
    }
  }

  Future<MapsModel> fetchMaps() async {
    try {
      final response = await http.get(Uri.parse(_mapsUrl));
      if (response.statusCode == 200) {
        return MapsModel.fromJson(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode}');
        throw Exception("Failed to load maps");
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception("Failed to load maps");
    }
  }

  // Fetch Weapons
  Future<WeaponModel> fetchWeapons() async {
    try {
      final response = await http.get(Uri.parse(_weaponsUrl));
      if (response.statusCode == 200) {
        return WeaponModel.fromJson(json.decode(response.body));
      } else {
        print('Error: ${response.statusCode}');
        throw Exception("Failed to load weapons");
      }
    } catch (e) {
      print('Exception: $e');
      throw Exception("Failed to load weapons");
    }
  }
}
