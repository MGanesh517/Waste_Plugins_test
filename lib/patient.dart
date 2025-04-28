import 'package:flutter/material.dart';


class ExpandableForm extends StatefulWidget {
  const ExpandableForm({super.key});

  @override
  _ExpandableFormState createState() => _ExpandableFormState();
}

class _ExpandableFormState extends State<ExpandableForm> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _toggleExpand,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 0.5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Patient',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
                    ],
                  ),
                ),
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary, width: 0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Add Patient', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            GestureDetector(
                              onTap: _toggleExpand,
                              child: Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Patient Name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Note',
                            prefixIcon: Icon(Icons.note),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Age',
                            prefixIcon: Icon(Icons.cake),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Gender'),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Male'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text('Female'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
