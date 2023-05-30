// ignore_for_file: annotate_overrides, overridden_fields

class RankModel {
  final String subTitle;
  final String title;
  final String bgImage;
  final String heading;

  const RankModel(
      {required this.subTitle,required this.heading, required this.bgImage, required this.title});

  factory RankModel.fromMap(Map<String, dynamic> json) => RankModel(
      title: json["title"],
      bgImage: json["bgImage"],
      heading: json["heading"],
      subTitle: json["subTitle"]);

  // Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
