import 'package:flutter/material.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        "level": "Level 1",
        "name": "AB. Prem Kumar",
        "status": "Approved",
        "date": "20-12-2024",
        "approved": true,
      },
      {
        "level": "Level 2",
        "name": "AB. Prem Kumar",
        "status": "Approved",
        "date": "20-12-2024",
        "approved": true,
      },
      {
        "level": "Level 3",
        "name": "AB. Prem Kumar",
        "status": "Pending",
        "date": "21-12-2024",
        "approved": false,
      },
      {
        "level": "Level 4",
        "name": "AB. Prem Kumar",
        "status": "Pending",
        "date": "21-12-2024",
        "approved": false,
      },
      {
        "level": "Level 5",
        "name": "AB. Prem Kumar",
        "status": "Pending",
        "date": "21-12-2024",
        "approved": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Vertical Stepper")),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step Indicator
              Column(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: step['approved'] == true ? Colors.green : Colors.grey,
                    child: Icon(
                      step['approved'] == true ? Icons.check : Icons.remove,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 75,
                      color: step['approved'] == true ? Colors.green : Colors.grey,
                    ),
                ],
              ),
              const SizedBox(width: 16),
              // Step Content
              Expanded(
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step['level'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step['name'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 16, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(
                                        step['date'] as String,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: step['approved'] == true
                                    ? Colors.green[100]
                                    : Colors.red[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: step['approved'] == true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    step['status'] as String,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: step['approved'] == true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class VerticalStepper extends StatelessWidget {
//   final List<Map<String, dynamic>> steps;

//   const VerticalStepper({Key? key, required this.steps}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       itemCount: steps.length,
//       itemBuilder: (context, index) {
//         final step = steps[index];
//         final isLast = index == steps.length - 1;

//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Step Indicator
//             Column(
//               children: [
//                 CircleAvatar(
//                   radius: 12,
//                   backgroundColor: step['approved'] == true ? Colors.green : Colors.grey,
//                   child: Icon(
//                     step['approved'] == true ? Icons.check : Icons.remove,
//                     size: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 if (!isLast)
//                   Container(
//                     width: 2,
//                     height: 60,
//                     color: step['approved'] == true ? Colors.green : Colors.grey,
//                   ),
//               ],
//             ),
//             const SizedBox(width: 16),
//             // Step Content
//             Expanded(
//               child: Card(
//                 elevation: 3,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         step['level'] as String,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 16,
//                             backgroundColor: Colors.grey[300],
//                             child: const Icon(Icons.person, color: Colors.white),
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   step['name'] as String,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.calendar_today,
//                                         size: 16, color: Colors.grey),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       step['date'] as String,
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: step['approved'] == true
//                                   ? Colors.green[100]
//                                   : Colors.red[100],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   height: 8,
//                                   width: 8,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: step['approved'] == true
//                                         ? Colors.green
//                                         : Colors.red,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 4),
//                                 Text(
//                                   step['status'] as String,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: step['approved'] == true
//                                         ? Colors.green
//                                         : Colors.red,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class StepperDemo extends StatelessWidget {
//   const StepperDemo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final steps = [
//       {
//         "level": "Level 1",
//         "name": "AB. Prem Kumar",
//         "status": "Approved",
//         "date": "20-12-2024",
//         "approved": true,
//       },
//       {
//         "level": "Level 2",
//         "name": "AB. Prem Kumar",
//         "status": "Approved",
//         "date": "20-12-2024",
//         "approved": true,
//       },
//       {
//         "level": "Level 3",
//         "name": "AB. Prem Kumar",
//         "status": "Pending",
//         "date": "21-12-2024",
//         "approved": false,
//       },
//       {
//         "level": "Level 4",
//         "name": "AB. Prem Kumar",
//         "status": "Pending",
//         "date": "21-12-2024",
//         "approved": false,
//       },
//       {
//         "level": "Level 5",
//         "name": "AB. Prem Kumar",
//         "status": "Pending",
//         "date": "21-12-2024",
//         "approved": false,
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text("Vertical Stepper Example")),
//       body: VerticalStepper(steps: steps),
//     );
//   }
// }

// void main() => runApp(const MaterialApp(home: StepperDemo()));
