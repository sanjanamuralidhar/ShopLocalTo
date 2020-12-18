class IconModel {
  final String title;
  final String icon;
  final String image;

  IconModel(
    this.title,
    this.icon,
    this.image
  );

  factory IconModel.fromJson(Map<String, dynamic> json) {
    return IconModel(
      json['title'] as String ?? "Unknown",
      json['icon'] as String ?? "Unknown",
      json['image'] as String ?? "Unknown",
    );
  }
}
