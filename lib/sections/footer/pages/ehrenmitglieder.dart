import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/models/ehrenmitglied.dart';
import 'package:website_frontend/provider/ehrenmitglieder_provider.dart';
import 'package:website_frontend/sections/footer/configuration/MyCustomScrollBehavior.dart';

class EhrenMitgliederPage extends StatelessWidget {
  final List<String> column = [
    "Vorname",
    "Nachname",
    "Ort",
    "Anerkennungsjahr"
  ];

  @override
  Widget build(BuildContext context) {
    List<DataCell> getCells(List<dynamic> cells) =>
        cells.map((data) => DataCell(Text('$data'))).toList();

    List<DataRow> getRows() {
      Provider.of<EhrenMitgliederProvider>(context, listen: false)
          .createMembers();
      final _ehrenMigliedProvider = context.watch<EhrenMitgliederProvider>();
      List<EhrenMitglied> results = _ehrenMigliedProvider.allEhrenMitglieder;
      final List<DataRow> dataRowResult = [];
      for (int i = 0; i < results.length; i++) {
        final cells = [];
        cells.add(results[i].firstName);
        cells.add(results[i].lastName);
        cells.add(results[i].town);
        cells.add(results[i].recognationYear.toString());

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
      body: Container(
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
