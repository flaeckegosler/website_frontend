import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/models/sujet.dart';
import 'package:website_frontend/provider/sujet_provider.dart';

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
      List<Sujet> results = sujetProvider.allSujetsByYear;
      final List<DataRow> dataRowResult = [];
      for (int i = 0; i < results.length; i++) {
        final cells = [];
        cells.add(results[i].jahr);
        cells.add(results[i].name);

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
      return dataTable;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
      ),
      body: SizedBox.expand(
        child: buildDataTable(),
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
