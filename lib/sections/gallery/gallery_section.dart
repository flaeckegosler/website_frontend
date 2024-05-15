import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/album.dart';
import 'package:website_frontend/provider/album_provider.dart';
import 'package:website_frontend/sections/gallery/image_card.dart';

class GallerySection extends StatefulWidget {
  @override
  _GallerySectionState createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  bool _isLoading = false;
  bool _isLoading2 = true;
  int activeIndex = 0;
  final controller = CarouselController();

  late Album _selectedGallery;

  //Fetch all Listings
  Future fetchGalleryList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<PicturesProvider>(context, listen: false)
        .fetchFirstAlbum();
    _selectedGallery =
        Provider.of<PicturesProvider>(context, listen: false).getFirstAlbum();
    setState(() {
      _isLoading = false;
    });
    await Provider.of<PicturesProvider>(context, listen: false)
        .fetchAlbumList();
    setState(() {
      _isLoading2 = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Provider.of<PicturesProvider>(context, listen: false)
        .allPictures
        .isEmpty) {
      fetchGalleryList();
    } else {
      _selectedGallery =
          Provider.of<PicturesProvider>(context, listen: false).allPictures[0];
    }
  }

  Widget buildGridView(
    List<SpecificImage> imageList,
    int index,
    bool isMobile,
  ) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: isMobile ? 6 : 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 1250 ? 4 : 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index2) {
          if (index2 + (index * (isMobile ? 6 : 8)) < imageList.length) {
            return GalerieImageCard(
              imageData: imageList[index2 + (index * (isMobile ? 6 : 8))],
              albumTitleRoute: _selectedGallery.albumTitleRoute,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildCarousel(dynamic pictureProvider, bool isMobile) {
    int divider;
    isMobile ? divider = 6 : divider = 8;
    final double width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
      carouselController: controller,
      options: CarouselOptions(
        aspectRatio: width > 1250 ? (2 / 1) : (1 / 1.5),
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        autoPlayInterval: const Duration(seconds: 7),
        autoPlayAnimationDuration: const Duration(seconds: 4),
        onPageChanged: (index, reason) => {
          setState(() => activeIndex = index),
        },
      ),
      itemCount: (_selectedGallery.specificImage.length / divider).ceil(),
      itemBuilder: (context, index, realIndex) {
        return buildGridView(_selectedGallery.specificImage, index, isMobile);
      },
    );
  }

  Widget buildIndicator(int numberOfCarousels) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: numberOfCarousels,
      onDotClicked: animateToSlide,
      effect: WormEffect(
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget buildButtons(int numberOfCarousels) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
            ),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          if (numberOfCarousels > 9)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "${activeIndex + 1} / $numberOfCarousels",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          else
            const SizedBox(
              width: 32,
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
            ),
            onPressed: next,
            child: const Icon(
              Icons.arrow_forward,
              size: 32,
            ),
          ),
        ],
      );

  void previous() =>
      controller.previousPage(duration: const Duration(milliseconds: 500));

  void next() =>
      controller.nextPage(duration: const Duration(milliseconds: 500));

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget dropDownButton() {
    return PopupMenuButton(
      onSelected: (result) {
        setState(() {
          _selectedGallery =
              Provider.of<PicturesProvider>(context, listen: false)
                  .allPictures[result];
        });
      },
      itemBuilder: (context) {
        return List.generate(
          10,
          (index) {
            return PopupMenuItem(
              value: index,
              child: Row(
                children: [
                  Text(
                    Provider.of<PicturesProvider>(context, listen: false)
                        .allPictures[index]
                        .albumTitle,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 400 ? 200 : 130,
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width > 400 ? 0 : 10,
                ),
                Text(
                  _selectedGallery.albumTitle,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.expand_more,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width > 400 ? 0 : 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1250;
    final pictureProvider = context.watch<PicturesProvider>();
    return Container(
      width: double.infinity,
      color: const Color(0xffFFFFFF),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SectionTitle(
                      title: "Fotos",
                      subTitle: "Schau unsere Bilder an!",
                      color: Theme.of(context).primaryColor,
                    ),
                    if (_isLoading)
                      const SizedBox()
                    else
                      AnimatedOpacity(
                        opacity: _isLoading2 &&
                                pictureProvider.allPictures.isEmpty
                            ? 0.0
                            : 1.0, // Set the opacity based on the _loading bool
                        duration: const Duration(
                          milliseconds: 500,
                        ), // Set the duration of the animation
                        curve: Curves.easeInCirc, // Set the animation curve
                        child: dropDownButton(), // Your dropDownButton widget
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
                SizedBox(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              else
                buildCarousel(pictureProvider, isMobile),
              const SizedBox(
                height: 10,
              ),
              if (_isLoading ||
                  (isMobile &&
                      (_selectedGallery.specificImage.length /
                                  (isMobile ? 6 : 8))
                              .ceil() >
                          11))
                const SizedBox()
              else
                buildIndicator(
                  (_selectedGallery.specificImage.length / (isMobile ? 6 : 8))
                      .ceil(),
                ),
              const SizedBox(
                height: 20,
              ),
              if (!_isLoading)
                buildButtons(
                  (_selectedGallery.specificImage.length / (isMobile ? 6 : 8))
                      .ceil(),
                ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
