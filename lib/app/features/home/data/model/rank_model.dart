// ignore_for_file: annotate_overrides, overridden_fields

class RankModel {
 
  final String subTitle;
  final String title;
  final String bgImage;
 

  const RankModel({
      required this.subTitle,
      required this.bgImage,
      required this.title});

  factory RankModel.fromMap(Map<String, dynamic> json) => RankModel(
      title: json["title"],
      bgImage: json["bgImage"],
      subTitle: json["subTitle"]);

  // Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
