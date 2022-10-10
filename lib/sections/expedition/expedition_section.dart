import 'package:flutter/material.dart';
import 'package:website_frontend/components/section_title.dart';

class ExpeditionSection extends StatefulWidget {
  @override
  _ExpeditionSectionState createState() => _ExpeditionSectionState();
}

class _ExpeditionSectionState extends State<ExpeditionSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(230, 230, 230, 1),
      child: Align(
        child: Container(
          width: 1250,
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxWidth: 1250),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 10),
                child: SectionTitle(
                  title: "Expedition",
                  subTitle: "Das Fest, das knallt!",
                  color: Color.fromRGBO(147, 90, 161, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Here comes the buttons
              Container(
                height: 500,
                width: 1250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        children: [
                          Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 8.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 50,
                                  child: AppBar(
                                    backgroundColor: Colors.red,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    title: const Text(
                                      "Datum",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    centerTitle: true,
                                    elevation: 8.0,
                                    automaticallyImplyLeading: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "29. JAN",
                                        style: TextStyle(fontSize: 36),
                                      ),
                                      Text(
                                        "2022",
                                        style: TextStyle(fontSize: 55),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  primary: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 28, vertical: 15)),
                              onPressed: () {},
                              child: const Text(
                                "Webseite",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
