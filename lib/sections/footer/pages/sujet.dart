import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/models/sujet.dart';
import 'package:website_frontend/provider/sujet_provider.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';

class SujetPage extends StatelessWidget {
  final List<String> column = [
    "Jahr",
    "Sujetname",
  ];

  @override
  Widget build(BuildContext context) {
    List<DataCell> getCells(List<dynamic> cells) =>
        cells.map((data) => DataCell(Text('$data'))).toList();

    List<DataRow> getRows() {
      Provider.of<SujetProvider>(context, listen: false).createMembers();
      final sujetProvider = context.watch<SujetProvider>();
      final List<Sujet> results = sujetProvider.allSujetsByYear;
      final List<DataRow> dataRowResult = [];
      for (int i = 0; i < results.length; i++) {
        final cells = [];
        cells.add(results[i].jahr);
        cells.add(results[i].name);

        dataRowResult.add(DataRow(cells: getCells(cells)));
      }
      return dataRowResult;
    }

    List<DataColumn> getColumns() {
      final List<DataColumn> dataColumnResult = [
        const DataColumn(
          label: SizedBox(
            child: Text("Jahr"),
          ),
        ),
        const DataColumn(
          label: SizedBox(
            child: Text("Sujetname"),
          ),
        ),
      ];
      return dataColumnResult;
    }

    Widget buildDataTable() {
      final DataTable dataTable = DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[300]),
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        dataRowHeight: 35,
        sortAscending: false,
        columns: getColumns(),
        rows: getRows(),
      );
      return dataTable;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 430,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 10),
                      child: SectionTitle(
                        title: "Sujet",
                        subTitle: "Wir sind nicht seit gestern dabei!",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDataTable(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 400,
              child: BottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
