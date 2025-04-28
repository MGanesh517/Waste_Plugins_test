
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicFormField {
  final String id;
  final String label;
  final String type;
  final bool isRequired;
  final List<String>? options;
  final Color borderColor;
  dynamic value;
  String? errorText;

  DynamicFormField({
    required this.id,
    required this.label,
    required this.type,
    this.isRequired = false,
    this.options,
    required this.borderColor,
    this.value,
    this.errorText,
  });
}

class DynamicFieldForm extends StatefulWidget {
  const DynamicFieldForm({super.key});

  @override
  _DynamicFieldFormState createState() => _DynamicFieldFormState();
}

class _DynamicFieldFormState extends State<DynamicFieldForm> {
  final _formKey = GlobalKey<FormState>();
  List<DynamicFormField> formFields = [];
  Map<String, dynamic> formData = {};
  
  final List<String> fieldTypes = [
    'text',
    'number',
    'dropdown',
    'date',
    'email',
    'phone',
  ];

  final TextEditingController _fieldNameController = TextEditingController();
  String _selectedFieldType = 'text';
  List<String>? _dropdownOptions = [];
  Color _selectedBorderColor = Colors.blue;

  @override
  void dispose() {
    _fieldNameController.dispose();
    super.dispose();
  }

  void _showAddFieldDialog() {
    _fieldNameController.clear();
    _dropdownOptions?.clear();
    _selectedBorderColor = Colors.blue;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Add New Field'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _fieldNameController,
                      decoration: const InputDecoration(
                        labelText: 'Field Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedFieldType,
                      decoration: const InputDecoration(
                        labelText: 'Field Type',
                        border: OutlineInputBorder(),
                      ),
                      items: fieldTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setStateDialog(() {
                          _selectedFieldType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('Border Color: '),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick Border Color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                    selectedPickerTypeColor: _selectedBorderColor,
                                      onColorChanged: (Color color) {
                                        setStateDialog(() {
                                          _selectedBorderColor = color;
                                        });
                                      },
                                      // pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Done'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _selectedBorderColor,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_selectedFieldType == 'dropdown') ...[
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          TextEditingController optionController = TextEditingController();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Add Option'),
                                content: TextField(
                                  controller: optionController,
                                  decoration: const InputDecoration(
                                    labelText: 'Option Text',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (optionController.text.isNotEmpty) {
                                        setStateDialog(() {
                                          _dropdownOptions ??= [];
                                          _dropdownOptions!.add(optionController.text);
                                        });
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Add'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Add Dropdown Option'),
                      ),
                      if (_dropdownOptions != null && _dropdownOptions!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _dropdownOptions!.map((option) {
                            return Chip(
                              label: Text(option),
                              onDeleted: () {
                                setStateDialog(() {
                                  _dropdownOptions!.remove(option);
                                });
                              },
                            );
                          }).toList(),
                        ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_fieldNameController.text.isNotEmpty) {
                      _addNewField(
                        _fieldNameController.text,
                        _selectedFieldType,
                        _dropdownOptions,
                        _selectedBorderColor,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Field'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _addNewField(String fieldName, String fieldType, List<String>? options, Color borderColor) {
    setState(() {
      formFields.add(
        DynamicFormField(
          id: 'field_${formFields.length}',
          label: fieldName,
          type: fieldType,
          options: options,
          isRequired: true,
          borderColor: borderColor,
        ),
      );
    });
  }

  Widget _buildDynamicField(DynamicFormField field) {
    InputDecoration getDecoration() {
      return InputDecoration(
        labelText: field.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: field.borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: field.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: field.borderColor, width: 2),
        ),
      );
    }

    switch (field.type) {
      case 'text':
        return TextFormField(
          decoration: getDecoration(),
          validator: (value) {
            if (field.isRequired && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            return null;
          },
          onChanged: (value) {
            formData[field.id] = value;
          },
        );

      case 'email':
        return TextFormField(
          decoration: getDecoration(),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (field.isRequired && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            if (value != null && value.isNotEmpty && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onChanged: (value) {
            formData[field.id] = value;
          },
        );

      case 'phone':
        return TextFormField(
          decoration: getDecoration(),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
          maxLength: 10,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (field.isRequired && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            return null;
          },
          onChanged: (value) {
            formData[field.id] = value;
          },
        );

      case 'number':
        return TextFormField(
          decoration: getDecoration(),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (field.isRequired && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            if (value != null && value.isNotEmpty) {
              final number = num.tryParse(value);
              if (number == null) {
                return 'Please enter a valid number';
              }
            }
            return null;
          },
          onChanged: (value) {
            formData[field.id] = num.tryParse(value);
          },
        );

      case 'dropdown':
        return DropdownButtonFormField<String>(
          decoration: getDecoration(),
          value: field.value,
          items: field.options?.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option),
            );
          }).toList(),
          validator: (value) {
            if (field.isRequired && value == null) {
              return '${field.label} is required';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              field.value = value;
              formData[field.id] = value;
            });
          },
        );

      case 'date':
        return TextFormField(
          decoration: getDecoration(),
          readOnly: true,
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              setState(() {
                field.value = picked.toString().split(' ')[0];
                formData[field.id] = field.value;
              });
            }
          },
          controller: TextEditingController(text: field.value),
          validator: (value) {
            if (field.isRequired && (value == null || value.isEmpty)) {
              return '${field.label} is required';
            }
            return null;
          },
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...formFields.map((field) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(child: _buildDynamicField(field)),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          formFields.remove(field);
                          formData.remove(field.id);
                        });
                      },
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 20),
              if (formFields.isNotEmpty)
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Form Data: $formData');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form submitted successfully!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddFieldDialog,
        tooltip: 'Add Field',
        child: const Icon(Icons.add),
      ),
    );
  }
}