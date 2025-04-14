class Campaign {
  final String id;
  final String title;
  final String subtitle; // ✅ NEW
  final String description;
  final String platform;
  final String logoUrl;
  final String bannerImageUrl;
  final String startDate;
  final String endDate;
  final String engagement;
  final String payment;
  final String extraInfo; // ✅ NEW
  String status;

  Campaign({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.platform,
    required this.logoUrl,
    required this.bannerImageUrl,
    required this.startDate,
    required this.endDate,
    required this.engagement,
    required this.payment,
    required this.status,
    required this.extraInfo,
  });
}
