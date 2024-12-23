import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'dart:io';
import '../components/shared/location_picker.dart';
import '../components/shared/image_picker_section.dart';

class AddPestScreen extends StatefulWidget {
  const AddPestScreen({super.key});

  @override
  State<AddPestScreen> createState() => _AddPestScreenState();
}

class _AddPestScreenState extends State<AddPestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _affectedAreaController = TextEditingController();
  final _notesController = TextEditingController();
  
  String? _selectedSeverity;
  String? _selectedCrop;
  String? _selectedPestType;
  String? _selectedDetectionMethod;
  DateTime? _detectionDate;
  LatLng? _selectedLocation;
  File? _pestImage;

  final List<String> _severityLevels = ['Low', 'Moderate', 'Severe'];
  final List<String> _crops = ['Tomato', 'Lettuce', 'Potato', 'Spinach'];
  final List<String> _pestTypes = ['Insect', 'Fungal', 'Bacterial', 'Viral'];
  final List<String> _detectionMethods = ['Manual', 'Automated (Sensor)', 'Visual Inspection'];

  @override
  void dispose() {
    _nameController.dispose();
    _affectedAreaController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _detectionDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _detectionDate) {
      setState(() {
        _detectionDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pest 🐛'),
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
                          labelText: 'Pest Name',
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
                              value: _selectedSeverity,
                              decoration: const InputDecoration(
                                labelText: 'Severity',
                                border: OutlineInputBorder(),
                              ),
                              items: _severityLevels.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedSeverity = newValue;
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
                            child: DropdownButtonFormField<String>(
                              value: _selectedCrop,
                              decoration: const InputDecoration(
                                labelText: 'Affected Crop',
                                border: OutlineInputBorder(),
                              ),
                              items: _crops.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCrop = newValue;
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
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedPestType,
                        decoration: const InputDecoration(
                          labelText: 'Pest Type',
                          border: OutlineInputBorder(),
                        ),
                        items: _pestTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPestType = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Detection Details Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detection Details',
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
                            labelText: 'Detection Date',
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _detectionDate == null
                                    ? 'Select a date'
                                    : '${_detectionDate!.day}/${_detectionDate!.month}/${_detectionDate!.year}',
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
                              value: _selectedDetectionMethod,
                              decoration: const InputDecoration(
                                labelText: 'Detected By',
                                border: OutlineInputBorder(),
                              ),
                              items: _detectionMethods.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedDetectionMethod = newValue;
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
                              controller: _affectedAreaController,
                              decoration: const InputDecoration(
                                labelText: 'Affected Area',
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
              // Pest Image
              ImagePickerSection(
                title: 'Pest Image',
                onImageSelected: (File image) {
                  setState(() {
                    _pestImage = image;
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
                          // Save pest logic here
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save Pest'),
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
