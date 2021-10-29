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

  Widget buildGridView(List<SpecificImage> imageList, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            //  shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
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

  Widget buildIndicator(int numberOfCarousels) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: numberOfCarousels,
        effect: const WormEffect(
          activeDotColor: Color.fromRGBO(147, 90, 162, 1),
        ),
      );

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
                Container(
                  // color: Colors.red,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 630,
                      autoPlay: true,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      onPageChanged: (index, reason) => {
                        setState(() => activeIndex = index),
                      },
                    ),
                    itemCount:
                        (_pictureProvider.allPictures[0].specificImage.length /
                                8)
                            .ceil(),
                    itemBuilder: (context, index, realIndex) {
                      return buildGridView(
                          _pictureProvider.allPictures[0].specificImage, index);
                    },
                  ),
                ),
              // const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                buildIndicator(
                  (_pictureProvider.allPictures[0].specificImage.length / 8)
                      .ceil(),
                ),
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
