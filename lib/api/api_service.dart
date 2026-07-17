import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/game_model.dart';
import '../models/app_model.dart';
import '../models/video_model.dart';

class ApiService {
  static const String baseUrl =
      "https://gx20d-gaming.great-site.net/api/";

  // ================= Games =================

  static Future<List<GameModel>> getGames() async {
    final response = await http.get(
      Uri.parse("${baseUrl}games.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data["games"] as List)
          .map((e) => GameModel.fromJson(e))
          .toList();
    }

    throw Exception("Failed to load games");
  }

  // ================= Apps =================

  static Future<List<AppModel>> getApps() async {
    final response = await http.get(
      Uri.parse("${baseUrl}apps.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data["apps"] as List)
          .map((e) => AppModel.fromJson(e))
          .toList();
    }

    throw Exception("Failed to load apps");
  }

  // ================= Videos =================

  static Future<List<VideoModel>> getVideos() async {
    final response = await http.get(
      Uri.parse("${baseUrl}videos.php"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data["videos"] as List)
          .map((e) => VideoModel.fromJson(e))
          .toList();
    }

    throw Exception("Failed to load videos");
  }
}