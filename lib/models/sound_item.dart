class SoundItem {
  final String soundTitle;
  final String image;
  final String soundUrl;

  SoundItem({
    required this.soundTitle,
    required this.image,
    required this.soundUrl,
  });

  factory SoundItem.fromJson(Map<String, dynamic> json) {
    return SoundItem(
      soundTitle: json['sound_title'] as String,
      image: json['image'] as String,
      soundUrl: json['sound_url'] as String,
    );
  }
}
