class CertificationModel {
  final String id;
  final String title;
  final String issuer;
  final String description;
  final String imageUrl;
  final DateTime? completedDate;
  final DateTime? expiryDate;
  final List<String> skills;

  CertificationModel({
    required this.id,
    required this.title,
    required this.issuer,
    required this.description,
    required this.imageUrl,
    this.completedDate,
    this.expiryDate,
    required this.skills,
  });
}
