import 'package:flutter/material.dart';

class TimeCalculation extends StatefulWidget {
  const TimeCalculation({Key? key}) : super(key: key);

  @override
  _TimeCalculationState createState() => _TimeCalculationState();
}

class _TimeCalculationState extends State<TimeCalculation> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  DateTime? startDateTime;
  DateTime? endDateTime;
  String timeDifferenceResult = '';

  void calculateTimeDifference() {
    if (startDateTime != null && endDateTime != null) {
      Duration difference = endDateTime!.difference(startDateTime!);

      setState(() {
        timeDifferenceResult = formatTimeDifference(difference);
      });
    }
  }

  String formatTimeDifference(Duration difference) {
    if (difference.inDays > 0) {
      return '${difference.inDays} days, ${difference.inHours % 24} hours, ${difference.inMinutes % 60} minutes';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours, ${difference.inMinutes % 60} minutes, ${difference.inSeconds % 60} seconds';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes, ${difference.inSeconds % 60} seconds';
    } else {
      return '${difference.inSeconds} seconds';
    }
  }

  Future<void> selectDateTime(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          if (isStartDate) {
            startDateTime = selectedDateTime;
            startDateController.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            startTimeController.text =
                "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
          } else {
            endDateTime = selectedDateTime;
            endDateController.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            endTimeController.text =
                "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Difference Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Start Date Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: startDateController,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => selectDateTime(context, true),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: startTimeController,
                    decoration: InputDecoration(
                      labelText: 'Start Time',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.access_time),
                        onPressed: () => selectDateTime(context, true),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // End Date Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: endDateController,
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => selectDateTime(context, false),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: endTimeController,
                    decoration: InputDecoration(
                      labelText: 'End Time',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.access_time),
                        onPressed: () => selectDateTime(context, false),
                      ),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Calculate Button
            ElevatedButton(
              onPressed: calculateTimeDifference,
              child: const Text('Calculate Difference'),
            ),
            const SizedBox(height: 16),
            // Result Display
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Time Difference: $timeDifferenceResult',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    startDateController.dispose();
    startTimeController.dispose();
    endDateController.dispose();
    endTimeController.dispose();
    super.dispose();
  }
}
