class LogoModel {
  final String image;

  LogoModel(
    this.image,
  );

  factory LogoModel.fromJson(Map<String, dynamic> json) {
    return LogoModel(
      json['logo'] as String ?? "Unknown",
    );
  }
}