// import 'package:flutter/material.dart';

// class ResponsiveSideMenu extends StatelessWidget {
//   const ResponsiveSideMenu({super.key});

//   final commonStyle = const TextStyle(
//       fontWeight: FontWeight.w600, color: Colors.black, fontSize: 15);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final bool isLargeScreen = constraints.maxWidth > 500;

//       return Scaffold(
//         body: SafeArea(
//           top: true,
//           bottom: false,
//           child: Padding(
//             padding: isLargeScreen
//                 ? const EdgeInsets.symmetric(vertical: 20, horizontal: 30)
//                 : const EdgeInsets.all(18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "B2B Dashboard",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 24,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 SizedBox(height: isLargeScreen ? 20.0 : 12.0),
//                 ResponsiveRow(
//                   runSpacing: 10,
//                   spacing: 20,
//                   columns: [
//                     ResponsiveColumn(
//                       ResponsiveConstants().searchBreakPoint,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           enabledBorder: const OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                               borderSide: BorderSide(color: Colors.grey)),
//                           hintText: 'Search',
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey[300]!,
//                             ),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           suffixIcon: const Icon(Icons.search, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CustomisedCommonButton(
//                         icon: Icon(Icons.filter_alt_rounded),
//                         titleText: 'Filter',
//                         onPressed: () {},
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                       ),
//                     ),
//                     ResponsiveColumn(
//                       ResponsiveConstants().buttonBreakpoints,
//                       child: CustomisedCommonButton(
//                         icon: Icon(Icons.import_export_rounded),
//                         titleText: 'Export',
//                         onPressed: () {},
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: isLargeScreen ? 25.0 : 12.0),
//                 // Define a fixed width and height for PaginatedDataTable
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: PaginatedDataTable(
//                         header: Text('Paginated Data Table', style: commonStyle),
//                         columns: const <DataColumn>[
//                           DataColumn(label: Text('Column 1')),
//                           DataColumn(label: Text('Column 2')),
//                           DataColumn(label: Text('Column 3')),
//                           DataColumn(label: Text('Column 4')),
//                           DataColumn(label: Text('Column 5')),
//                           DataColumn(label: Text('Column 6')),
//                           DataColumn(label: Text('Column 7')),
//                           DataColumn(label: Text('Column 8')),
//                           DataColumn(label: Text('Column 9')),
//                           DataColumn(label: Text('Column 10')),
//                           DataColumn(label: Text('Column 11')),
//                           DataColumn(label: Text('Column 12')),
//                         ],
//                         source: MyDataSource(),
//                         rowsPerPage: 10,
//                         showCheckboxColumn: false,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

// class MyDataSource extends DataTableSource {
//   @override
//   DataRow? getRow(int index) {
//     return DataRow(
//       cells: <DataCell>[
//         DataCell(Text('Name $index')),
//         DataCell(Text('Age $index')),
//         DataCell(Text('Role $index')),
//         DataCell(Text('Location $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Status $index')),
//         DataCell(Text('Anime $index')),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => 100;

//   @override
//   int get selectedRowCount => 0;
// }
