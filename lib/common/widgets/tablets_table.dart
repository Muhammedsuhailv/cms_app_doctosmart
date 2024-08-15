import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  // Predefined data within the widget itself
  final List<Map<String, dynamic>> _data = [
    {"Test No": 1, "Test Name": "Haemoglobin", "Report Heading": "Complete Blood Count", "Charges": "₹1500"},
    {"Test No": 13, "Test Name": "Vitamin B2", "Report Heading": "Vitamins", "Charges": "₹2500"},
    {"Test No": 30, "Test Name": "Vitamin C", "Report Heading": "Vitamins", "Charges": "₹500"},
    {"Test No": 24, "Test Name": "HDL Cholesterol", "Report Heading": "Cholesterol", "Charges": "₹500"},
    {"Test No": 44, "Test Name": "Albumin", "Report Heading": "Liver & Gastrointestinal", "Charges": "₹1000"},
    {"Test No": 44, "Test Name": "Serum Creatinine", "Report Heading": "Renal Function", "Charges": "₹1500"},
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        dataTableTheme: DataTableThemeData(
          dataRowColor: MaterialStateProperty.all(Colors.transparent),
          headingRowColor: MaterialStateProperty.all(Colors.transparent),
          dividerThickness: 0.0,
        ),
      ),
      child: DataTable(
        columnSpacing: 12, // Reducing the space between columns
        headingRowHeight: 25, // Height of the header row
        dataRowHeight: 20, // Height of the data rows
        headingTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff01BFE1)), // Styling the headings
        dataTextStyle: TextStyle(fontSize: 11), // Smaller text for data
        columns: const [
          DataColumn(label: Flexible(child: Text('Test No', overflow: TextOverflow.ellipsis))),
          DataColumn(label: Flexible(child: Text('Test Name', overflow: TextOverflow.ellipsis))),
          DataColumn(label: Flexible(child: Text('Report Heading', overflow: TextOverflow.ellipsis))),
          DataColumn(label: Flexible(child: Text('Charges', overflow: TextOverflow.ellipsis))),
        ],
        rows: _data.map((test) => DataRow(
          cells: [
            DataCell(Text(test["Test No"].toString())),
            DataCell(Text(test["Test Name"])),
            DataCell(Text(test["Report Heading"])),
            DataCell(Text(test["Charges"], style: const TextStyle(color: Color(0xff0867A6), fontWeight: FontWeight.bold))),
          ],
        )).toList(),
      ),
    );
  }
}
