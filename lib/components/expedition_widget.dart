import 'package:flutter/material.dart';

class ExpeditionWidget extends StatelessWidget {
  const ExpeditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 1250,
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: 250,
            child: Column(
              children: [
                Card(
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
                      const SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 15,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Webseite",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
