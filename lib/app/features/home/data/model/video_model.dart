// ignore_for_file: annotate_overrides, overridden_fields

class VideoModel {
  final String subtitle;
  final String title;
  final String coverImage;
  final String video;

  const VideoModel(
      {required this.subtitle,
      required this.title,
      required this.coverImage,
      required this.video});

  factory VideoModel.fromMap(Map<String, dynamic> json) => VideoModel(
      title: json["title"],
      subtitle: json["subtitle"],
      coverImage: json["coverImage"] ?? "",
      video: json["video"] ?? "");

  // Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
