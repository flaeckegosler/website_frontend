import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/ehrenmitglied.dart';
import 'package:website_frontend/provider/ehrenmitglieder_provider.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';
import 'package:website_frontend/sections/footer/configuration/MyCustomScrollBehavior.dart';

class EhrenMitgliederPage extends StatefulWidget {
  @override
  State<EhrenMitgliederPage> createState() => _EhrenMitgliederPageState();
}

class _EhrenMitgliederPageState extends State<EhrenMitgliederPage> {
  bool _isLoading = true;

  @override
  void initState() {
    if (Provider.of<EhrenMitgliederProvider>(context, listen: false)
        .allEhrenMitglieder
        .isEmpty) {
      fetchEhrenMitgliederAsync();
    }
    super.initState();
  }

  //Fetch all Listings
  Future fetchEhrenMitgliederAsync() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<EhrenMitgliederProvider>(context, listen: false)
        .readEhrenMitgliederJson();
    setState(() {
      _isLoading = false;
    });
  }

  final List<String> column = [
    "Name",
    "Ort",
    "Aktivehrenmitglied",
    "Anerkennungsjahr"
  ];

  @override
  Widget build(BuildContext context) {
    List<DataCell> getCells(List<dynamic> cells) =>
        cells.map((data) => DataCell(Text('$data'))).toList();

    List<DataRow> getRows() {
      List<EhrenMitglied> results =
          context.watch<EhrenMitgliederProvider>().allEhrenMitglieder;
      final List<DataRow> dataRowResult = [];
      for (int i = 0; i < results.length; i++) {
        final cells = [];
        cells.add(results[i].name);
        cells.add(results[i].ortschaft);
        cells.add(results[i].isAktivEhrenMitglied.toString());
        cells.add(results[i].anerkennungsjahr);

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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 10),
              child: SectionTitle(
                title: "Ehrenmitglieder",
                subTitle: "Ehre dem Ehre gebührt!",
                color: Color.fromRGBO(147, 90, 162, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: _isLoading
                  ? SizedBox(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(147, 90, 162, 1),
                        ),
                      ),
                    )
                  : buildDataTable(),
            ),
            SizedBox(
              height: 40,
            ),
            _isLoading
                ? SizedBox()
                : Container(
                    height: 400,
                    child: const BottomBar(),
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