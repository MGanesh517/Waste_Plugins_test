import 'package:flutter/material.dart';
import 'package:waste/datepicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyWidget(),
    );
  }
}


// // First, define a model for form fields
// class DynamicFormField {
//   final String id;
//   final String label;
//   final String type; // text, number, dropdown, date, etc.
//   final bool isRequired;
//   final List<String>? options; // For dropdown/radio fields
//   dynamic value;
//   String? errorText;

//   DynamicFormField({
//     required this.id,
//     required this.label,
//     required this.type,
//     this.isRequired = false,
//     this.options,
//     this.value,
//     this.errorText,
//   });
// }

// class DynamicForm extends StatefulWidget {
//   final List<DynamicFormField> fields;
//   final Function(Map<String, dynamic>) onSubmit;

//   const DynamicForm({
//     super.key,
//     required this.fields,
//     required this.onSubmit,
//   });

//   @override
//   State<DynamicForm> createState() => _DynamicFormState();
// }

// class _DynamicFormState extends State<DynamicForm> {
//   final _formKey = GlobalKey<FormState>();
//   final Map<String, dynamic> _formData = {};

//   Widget _buildField(DynamicFormField field) {
//     switch (field.type) {
//       case 'text':
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: field.label,
//             errorText: field.errorText,
//           ),
//           initialValue: field.value?.toString(),
//           validator: (value) {
//             if (field.isRequired && (value == null || value.isEmpty)) {
//               return '${field.label} is required';
//             }
//             return null;
//           },
//           onChanged: (value) {
//             _formData[field.id] = value;
//           },
//         );

//       case 'number':
//         return TextFormField(
//           decoration: InputDecoration(
//             labelText: field.label,
//             errorText: field.errorText,
//           ),
//           keyboardType: TextInputType.number,
//           initialValue: field.value?.toString(),
//           validator: (value) {
//             if (field.isRequired && (value == null || value.isEmpty)) {
//               return '${field.label} is required';
//             }
//             if (value != null && value.isNotEmpty) {
//               final number = num.tryParse(value);
//               if (number == null) {
//                 return 'Please enter a valid number';
//               }
//             }
//             return null;
//           },
//           onChanged: (value) {
//             _formData[field.id] = num.tryParse(value);
//           },
//         );

//       case 'dropdown':
//         return DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             labelText: field.label,
//             errorText: field.errorText,
//           ),
//           value: field.value,
//           items: field.options?.map((option) {
//             return DropdownMenuItem(
//               value: option,
//               child: Text(option),
//             );
//           }).toList(),
//           validator: (value) {
//             if (field.isRequired && value == null) {
//               return '${field.label} is required';
//             }
//             return null;
//           },
//           onChanged: (value) {
//             setState(() {
//               field.value = value;
//               _formData[field.id] = value;
//             });
//           },
//         );

//       case 'date':
//         return InkWell(
//           onTap: () async {
//             final date = await showDatePicker(
//               context: context,
//               initialDate: field.value ?? DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2100),
//             );
//             if (date != null) {
//               setState(() {
//                 field.value = date;
//                 _formData[field.id] = date;
//               });
//             }
//           },
//           child: InputDecorator(
//             decoration: InputDecoration(
//               labelText: field.label,
//               errorText: field.errorText,
//             ),
//             // child: Text(
//             //   field.value != null
//             //       ? DateFormat('yyyy-MM-dd').format(field.value)
//             //       : 'Select date',
//             // ),
//           ),
//         );

//       default:
//         return Container();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Form'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   ...widget.fields.map((field) => Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: _buildField(field),
//                       )),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         widget.onSubmit(_formData);
//                       }
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Example usage:
// void main() {
//   final formFields = [
//     DynamicFormField(
//       id: 'name',
//       label: 'Full Name',
//       type: 'text',
//       isRequired: true,
//     ),
//     DynamicFormField(
//       id: 'age',
//       label: 'Age',
//       type: 'number',
//     ),
//     DynamicFormField(
//       id: 'gender',
//       label: 'Gender',
//       type: 'dropdown',
//       options: ['Male', 'Female', 'Other'],
//       isRequired: true,
//     ),
//     DynamicFormField(
//       id: 'birthDate',
//       label: 'Birth Date',
//       type: 'date',
//       isRequired: true,
//     ),
//   ];

//   runApp(MaterialApp(
//     home: Scaffold(
//       body: DynamicForm(
//         fields: formFields,
//         onSubmit: (data) {
//           print('Form submitted with data: $data');
//         },
//       ),
//     ),
//   ));
// }