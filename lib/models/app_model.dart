class AppModel {
  final int id;
  final String appName;
  final String version;
  final String description;
  final String image;
  final String downloadLink;

  AppModel({
    required this.id,
    required this.appName,
    required this.version,
    required this.description,
    required this.image,
    required this.downloadLink,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      id: int.parse(json["id"].toString()),
      appName: json["app_name"] ?? "",
      version: json["version"] ?? "",
      description: json["description"] ?? "",
      image: json["image"] ?? "",
      downloadLink: json["download_link"] ?? "",
    );
  }
}