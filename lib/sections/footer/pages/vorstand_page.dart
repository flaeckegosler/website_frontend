import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/vorstand.dart';
import 'package:website_frontend/provider/vorstand_provider.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/footer/configuration/my_custom_scroll_behavior.dart';

class VorstandPage extends StatefulWidget {
  @override
  State<VorstandPage> createState() => _VorstandPageState();
}

class _VorstandPageState extends State<VorstandPage> {
  bool _isLoading = false;

  @override
  void initState() {
    if (Provider.of<VorstandProvider>(context, listen: false)
        .allVorstand
        .isEmpty) {
      fetchVorstandAsync();
    }
    super.initState();
  }

  //Fetch all Listings
  Future fetchVorstandAsync() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<VorstandProvider>(context, listen: false)
        .readVorstandJson();
    setState(() {
      _isLoading = false;
    });
  }

  final List<String> column = [
    "Jahr",
    "Präsident",
    "Tambourmajor",
    "Vize-Präsident",
    "Kassier",
    "Sujetchef",
    "Materialverwalter",
    "Aktuar",
    "Sujet"
  ];

  @override
  Widget build(BuildContext context) {
    List<DataCell> getCells(List<dynamic> cells) =>
        cells.map((data) => DataCell(Text('$data'))).toList();

    List<DataRow> getRows() {
      List<Vorstand> results = [];
      results = context.watch<VorstandProvider>().allVorstand;
      final List<DataRow> dataRowResult = [];
      for (int i = 0; i < results.length; i++) {
        final cells = [];
        cells.add(results[i].jahr);
        cells.add(results[i].praesident);
        cells.add(results[i].tambourmajor);
        cells.add(results[i].vizePraesident);
        cells.add(results[i].kassier);
        cells.add(results[i].sujetchef);
        cells.add(results[i].materialverwalter);
        cells.add(results[i].aktuar);
        cells.add(results[i].sujet);

        dataRowResult.add(DataRow(cells: getCells(cells)));
      }
      return dataRowResult;
    }

    Widget buildDataTable() {
      final DataTable dataTable = DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[300]),
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        dataRowHeight: 35,
        sortAscending: false,
        columns: getColumns(column),
        rows: getRows(),
      );

      // Initialize local variables
      final ScrollController controller = ScrollController();
      final deviceSize = MediaQuery.of(context).size;

      //Return correct datatTable
      if (deviceSize.width < 2850) {
        return ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: dataTable,
          ),
        );
      } else {
        return dataTable;
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 1600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 10),
                      child: SectionTitle(
                        title: "Vorstand",
                        subTitle: "Zusammensetzung seit 1989!",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Zusammensetzung seit 1989!',
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Gosler',
                        ),
                      ),
                    ),
                    Container(
                      child: _isLoading
                          ? SizedBox(
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          : buildDataTable(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            if (_isLoading)
              const SizedBox()
            else
              const SizedBox(
                height: 400,
                child: BottomBar(),
              ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    final List<DataColumn> dataColumnResult = [];
    for (int i = 0; i < columns.length; i++) {
      dataColumnResult.add(
        DataColumn(
          label: Text(columns[i]),
        ),
      );
    }
    return dataColumnResult;
  }
}
