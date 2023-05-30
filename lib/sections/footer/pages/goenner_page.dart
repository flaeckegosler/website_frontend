import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/provider/goenner_provider.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/news/mobile/title_default.dart';

class GoennerPage extends StatefulWidget {
  const GoennerPage();

  @override
  State<GoennerPage> createState() => _GoennerPageState();
}

class _GoennerPageState extends State<GoennerPage> {
  bool _isLoading = true;
  final String api = 'https://api.flaeckegosler.ch/';

  //Fetch all Listings
  Future fetchAgendaList() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<GoennerProvider>(context, listen: false)
        .fetchGoennerPageData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    fetchAgendaList();
    super.initState();
  }

  Widget _buildTitelBild(String url) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: 300,
        width: 480,
        child: CachedNetworkImage(
          imageUrl: api + url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildImageDescription(String description) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Text(
        description,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildMainText(String url) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Html(
        data: url,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 480,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 10),
                              child: SectionTitle(
                                title: Provider.of<GoennerProvider>(
                                  context,
                                  listen: false,
                                ).getGoennerPageData.title,
                                subTitle: Provider.of<GoennerProvider>(
                                  context,
                                  listen: false,
                                ).getGoennerPageData.subtitle,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildTitelBild(
                              Provider.of<GoennerProvider>(
                                context,
                                listen: false,
                              ).getGoennerPageData.imageUrl,
                            ),
                            _buildImageDescription(
                              Provider.of<GoennerProvider>(
                                context,
                                listen: false,
                              ).getGoennerPageData.imageDescription,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                right: 20,
                                left: 20,
                              ),
                              child: TitleDefault(
                                Provider.of<GoennerProvider>(
                                  context,
                                  listen: false,
                                ).getGoennerPageData.newsTitle,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                right: 10.0,
                                left: 10.0,
                              ),
                              child: Html(
                                data: Provider.of<GoennerProvider>(
                                  context,
                                  listen: false,
                                ).getGoennerPageData.newsIntro,
                              ),
                            ),
                            _buildMainText(
                              Provider.of<GoennerProvider>(
                                context,
                                listen: false,
                              ).getGoennerPageData.newsMain,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Spacer(),
                        BottomBar(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
