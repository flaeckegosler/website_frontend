class Kleiderverkauf {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String imageDescription;
  final String newsTitle;
  final String newsIntro;
  final String newsMain;

  Kleiderverkauf({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.imageDescription,
    required this.newsTitle,
    required this.newsIntro,
    required this.newsMain,
  });

  factory Kleiderverkauf.fromJson(Map<String, dynamic> json) {
    return Kleiderverkauf(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['news_image'] as String,
      imageDescription: json['news_image_description'] as String,
      newsTitle: json['news_title'] as String,
      newsIntro: json['news_intro'] as String,
      newsMain: json['news_main'] as String,
    );
  }
}
