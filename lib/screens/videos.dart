import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/api_service.dart';
import '../models/video_model.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    super.initState();
    videos = ApiService.getVideos();
  }

  Future<void> openYoutube(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GX20D Videos"),
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: videos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Videos Found"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final video = data[index];

              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.network(
                      "https://gx20d-gaming.great-site.net/uploads/${video.thumbnail}",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.video_library,
                            size: 70,
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        video.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(video.description),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.visibility),
                          const SizedBox(width: 5),
                          Text(video.views.toString()),

                          const Spacer(),

                          const Icon(Icons.timer),
                          const SizedBox(width: 5),
                          Text(video.duration),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 12,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openYoutube(video.youtubeUrl);
                        },
                        icon: const Icon(Icons.play_arrow),
                        label: const Text("Watch"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}