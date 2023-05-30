// ignore_for_file: annotate_overrides, overridden_fields

class FooterModel {
  final String subtitle;
  final String title;

  const FooterModel(
      {required this.subtitle,required this.title});

  factory FooterModel.fromMap(Map<String, dynamic> json) => FooterModel(
      title: json["title"],
      subtitle: json["subtitle"]);

  // Map<String, dynamic> toMap() => {"label": label, "icon": icon};
}
