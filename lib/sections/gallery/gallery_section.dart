import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';

class GallerySection extends StatefulWidget {
  @override
  _GallerySectionState createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  bool _isLoading = false;

  //Fetch all Listings
  Future fetchGalleryList() async {
    setState(() {
      _isLoading = true;
    });
    // await Provider.of<NewsProvider>(context, listen: false).createNews();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(46, 142, 196, 1),
      child: Align(
        child: Container(
          alignment: Alignment.center,
          //color: Colors.red, //good for debugging
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.yellow,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
