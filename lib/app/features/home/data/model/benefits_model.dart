// ignore_for_file: annotate_overrides, overridden_fields


class BenefitsModel {
  final String icon;
  final String label;
  final String subTitle;
  final String title;
  final String bgImage;
 

  const BenefitsModel(
      {required this.icon,
      required this.subTitle,
      required this.label,
      required this.bgImage,
      required this.title});

  factory BenefitsModel.fromMap(Map<String, dynamic> json) => BenefitsModel(
      icon: json["icon"],
      title: json["title"],
      bgImage: json["bgImage"],
      subTitle: json["subTitle"],
      label: json["label"]);

  // Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
