import 'package:flutter/material.dart';

class CustomDateWidget extends StatefulWidget {
  final Function(String)? onDateFilterSelected;

  const CustomDateWidget({super.key, this.onDateFilterSelected});

  @override
  _CustomDateWidgetState createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  String? selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = "Today"; // Initialize with "Today" filter
    _applyFilter("Today"); // Apply default filter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4,right: 4),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue;
                      _applyFilter(newValue!);
                      print("date filter :::: ${selectedFilter}");
                    });
                  },
                  items: <String>[
                    "Today",
                    "Yesterday",
                    "This Week",
                    "This Month",
                    "This Year",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _applyFilter(String filter) {
    widget.onDateFilterSelected?.call(filter);
  }
}


class CustomDateFilter extends StatefulWidget {
  const CustomDateFilter({super.key});

  @override
  _CustomDateFilterState createState() => _CustomDateFilterState();
}

class _CustomDateFilterState extends State<CustomDateFilter> {
  String dateRange = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Date Filter'),
      ),
      body: Column(
        children: [
          CustomDateWidget(
            onDateFilterSelected: (filter) {
              setState(() {
                dateRange = filter;
                print('date ::::: ${filter}');
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Text(
                'Selected Date Range: ${_getSelectedDateRange()}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getSelectedDateRange() {
    switch (dateRange) {
      case 'Today':
        return _getTodayDate();
      case 'Yesterday':
        return _getYesterdayDate();
      case 'This Week':
        return _getWeekDates();
      case 'This Month':
        return _getMonthDates();
      case 'This Year':
        return _getThisYearDates();
      default:
        return '';
    }
  }

  String _getTodayDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return formattedDate;
  }

  String _getYesterdayDate() {
    DateTime now = DateTime.now();
    String formattedStartDate = '${now.day - 1}-${now.month}-${now.year}';
    return formattedStartDate;
  }

  String _getWeekDates() {
    DateTime now = DateTime.now();
    DateTime weekStart = now.subtract(const Duration(days: 7));
    DateTime weekEnd = now;

    String formattedStart = '${weekStart.day}-${weekStart.month}-${weekStart.year}';
    String formattedEnd = '${weekEnd.day}-${weekEnd.month}-${weekEnd.year}';

    return '$formattedStart to $formattedEnd';
  }

  String _getMonthDates() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    String formattedStart = '1-${now.month}-${now.year}';
    String formattedEnd = '$daysInMonth-${now.month}-${now.year}';

    return '$formattedStart to $formattedEnd';
  }

  String _getThisYearDates() {
    DateTime now = DateTime.now();
    int year = now.year;

    String formattedStart = '1-1-$year';
    String formattedEnd = '31-12-$year';

    return '$formattedStart to $formattedEnd';
  }
}
