import 'package:flutter/material.dart';
import 'package:waste/camerapreview.dart';
import 'package:waste/collapsible_sidebar.dart';
import 'package:waste/curved.dart';
import 'package:waste/custom_date.dart';
import 'package:waste/download_percentage_shower.dart';
import 'package:waste/dynamic_forms.dart';
import 'package:waste/nav_2.dart';
import 'package:waste/nav_bar.dart';
import 'package:waste/patient.dart';
import 'package:waste/shimmer.dart';
import 'package:waste/slider_to_unlock.dart';
import 'package:waste/stepper.dart';
import 'package:waste/stepper_widget.dart';
import 'package:waste/time_calculation.dart';
import 'package:waste/tinder_card.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DatePicker()),
                  );
                },
                child: const Text("On Tap")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomDateWidget()),
                  );
                },
                child: const Text("Tap fo custom date")),
                 OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Stepperwidget()),
                  );
                },
                child: const Text("stepper")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpandableForm()),
                  );
                },
                child: const Text("Expandable form ")),
                 OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CameraExampleHome()),
                  );
                },
                child: const Text("Camera Preview")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TinderCard()),
                  );
                },
                child: const Text("Tinder Card")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShimmerPlugin()),
                  );
                },
                child: const Text("Shimmer Plugin")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Navbar()),
                  );
                },
                child: const Text("Navbar")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  NavBarTwo()),
                  );
                },
                child: const Text("nav2")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  BottomNavBar()),
                  );
                },
                child: const Text("Curved bottombar")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SidebarPage()),
                  );
                },
                child: const Text("Collapsible Sidebar")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  DownloadPercentageShower()),
                  );
                },
                child: const Text("download % shower")),
                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SlideToUnlock()),
                  );
                },
                child: const Text("Slide to Unlock")),

                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TimeCalculation()),
                  );
                },
                child: const Text("Time Calculation")),

                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerticalStepper()),
                  );
                },
                child: const Text("Stepper Widget")),


                OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DynamicFieldForm()),
                  );
                },
                child: const Text("Dynamic Forms")),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  DatePicker({super.key});
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body:
          DatePickerDialog(firstDate: DateTime(1990), lastDate: DateTime(2200)),
    );
  }
}

class DateRangePicker extends StatelessWidget {
  const DateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DateRangePickerDialog(
        currentDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2200));
  }
}
