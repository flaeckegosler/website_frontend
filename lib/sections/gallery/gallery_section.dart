import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/pictures.dart';
import 'package:website_frontend/provider/pictures_provider.dart';
import 'package:website_frontend/sections/gallery/image_card.dart';

class GallerySection extends StatefulWidget {
  @override
  _GallerySectionState createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  bool _isLoading = false;
  int activeIndex = 0;
  final controller = CarouselController();

  //Fetch all Listings
  Future fetchGalleryList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<PicturesProvider>(context, listen: false)
        .fetchPicturesList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGalleryList();
  }

  Widget buildGridView(List<SpecificImage> imageList, int index) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width > 1250 ? 4 : 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index2) {
            if (index2 + (index * 8) < imageList.length) {
              return ImageCard(
                imageData: imageList[index2 + (index * 8)],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  Widget buildCarousel(dynamic _pictureProvider) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      child: CarouselSlider.builder(
        carouselController: controller,
        options: CarouselOptions(
          aspectRatio: width > 1250 ? (2 / 1) : (1 / 2),
          autoPlay: true,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          autoPlayInterval: const Duration(seconds: 7),
          autoPlayAnimationDuration: const Duration(seconds: 4),
          onPageChanged: (index, reason) => {
            setState(() => activeIndex = index),
          },
        ),
        itemCount: (_pictureProvider.allPictures[0].specificImage.length / 8)
            .ceil() as int,
        itemBuilder: (context, index, realIndex) {
          return buildGridView(
              _pictureProvider.allPictures[0].specificImage
                  as List<SpecificImage>,
              index);
        },
      ),
    );
  }

  Widget buildIndicator(int numberOfCarousels) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: numberOfCarousels,
        onDotClicked: animateToSlide,
        effect: const WormEffect(
          activeDotColor: Color.fromRGBO(147, 90, 162, 1),
        ),
      );

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(147, 90, 162, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 15)),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          if (stretch)
            const Spacer()
          else
            const SizedBox(
              width: 32,
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(147, 90, 162, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 15)),
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

  @override
  Widget build(BuildContext context) {
    final _pictureProvider = context.watch<PicturesProvider>();
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const SectionTitle(
                title: "Fotos",
                subTitle: "Schau dir unsere Bilder an!",
                color: Color.fromRGBO(147, 90, 162, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                buildCarousel(_pictureProvider),
              if (_isLoading)
                const SizedBox()
              else
                buildIndicator(
                  (_pictureProvider.allPictures[0].specificImage.length / 8)
                      .ceil(),
                ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading) const SizedBox() else buildButtons(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
