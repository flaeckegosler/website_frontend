class Album {
  final String id;
  final String menuTitle;
  final String albumTitle;
  final String albumTitleRoute;
  final int dateUnix;
  final String dateFormatted;
  final List<SpecificImage> specificImage;

  Album({
    required this.id,
    required this.menuTitle,
    required this.albumTitle,
    required this.albumTitleRoute,
    required this.dateUnix,
    required this.dateFormatted,
    required this.specificImage,
  });
}

class SpecificImage {
  final String pictureIndex;
  final String pictureName;
  final String pictureUrl;

  SpecificImage({
    required this.pictureIndex,
    required this.pictureName,
    required this.pictureUrl,
  });
}
