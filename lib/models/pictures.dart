class Pictures {
  final String id;
  final String menuTitle;
  final String albumTitle;
  final String bodyText;
  final int dateUnix;
  final String dateFormatted;
  final List<SpecificImage> specificImage;

  Pictures({
    required this.id,
    required this.menuTitle,
    required this.albumTitle,
    required this.bodyText,
    required this.dateUnix,
    required this.dateFormatted,
    required this.specificImage,
  });
}

class SpecificImage {
  final String pictureName;
  final String pictureLink;

  SpecificImage({
    required this.pictureName,
    required this.pictureLink,
  });
}
