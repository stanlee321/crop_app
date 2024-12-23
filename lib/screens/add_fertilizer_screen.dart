import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'dart:io';
import '../components/shared/location_picker.dart';
import '../components/shared/image_picker_section.dart';

class AddFertilizerScreen extends StatefulWidget {
  const AddFertilizerScreen({super.key});

  @override
  State<AddFertilizerScreen> createState() => _AddFertilizerScreenState();
}

class _AddFertilizerScreenState extends State<AddFertilizerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _targetAreaController = TextEditingController();
  final _notesController = TextEditingController();
  
  String? _selectedType;
  String? _selectedMethod;
  String? _selectedFrequency;
  DateTime? _applicationDate;
  LatLng? _selectedLocation;
  File? _fertilizerImage;

  final List<String> _types = ['Organic', 'Chemical', 'Liquid'];
  final List<String> _methods = ['Manual', 'Automated', 'Drip'];
  final List<String> _frequencies = ['One-time', 'Weekly', 'Monthly'];

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _targetAreaController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _applicationDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _applicationDate) {
      setState(() {
        _applicationDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Fertilizer 💧'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Information Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Basic Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Fertilizer Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedType,
                              decoration: const InputDecoration(
                                labelText: 'Type',
                                border: OutlineInputBorder(),
                              ),
                              items: _types.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedType = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _quantityController,
                              decoration: const InputDecoration(
                                labelText: 'Quantity (kg/L)',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                if (double.tryParse(value) == null || double.parse(value) <= 0) {
                                  return 'Invalid number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedMethod,
                        decoration: const InputDecoration(
                          labelText: 'Application Method',
                          border: OutlineInputBorder(),
                        ),
                        items: _methods.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedMethod = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Application Details Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Application Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Application Date',
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _applicationDate == null
                                    ? 'Select a date'
                                    : '${_applicationDate!.day}/${_applicationDate!.month}/${_applicationDate!.year}',
                              ),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedFrequency,
                              decoration: const InputDecoration(
                                labelText: 'Frequency',
                                border: OutlineInputBorder(),
                              ),
                              items: _frequencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedFrequency = newValue;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextFormField(
                              controller: _targetAreaController,
                              decoration: const InputDecoration(
                                labelText: 'Target Area',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _notesController,
                        decoration: const InputDecoration(
                          labelText: 'Notes',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Location Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LocationPicker(
                        initialLocation: _selectedLocation,
                        onLocationSelected: (location) {
                          setState(() {
                            _selectedLocation = location;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Fertilizer Image
              ImagePickerSection(
                title: 'Fertilizer Image',
                onImageSelected: (File image) {
                  setState(() {
                    _fertilizerImage = image;
                  });
                },
              ),
              const SizedBox(height: 24),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Save fertilizer logic here
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save Fertilizer'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel),
                      label: const Text('Cancel'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
