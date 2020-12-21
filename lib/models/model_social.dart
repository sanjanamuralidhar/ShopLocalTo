class SocialIcon {
  final int id;
  final String image;

  SocialIcon(
    this.id,
    this.image
  );

  factory SocialIcon.fromJson(Map<String, dynamic> json) {
    return SocialIcon(
      json['id'] as int ?? "Unknown",
      json['image'] as String ?? "Unknown",
    );
  }
}