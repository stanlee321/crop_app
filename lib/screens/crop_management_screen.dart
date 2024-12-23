import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/crop_management/filters_section.dart';
import '../components/crop_management/crop_list_section.dart';
import '../components/crop_management/crop_actions_section.dart';

class CropManagementScreen extends StatelessWidget {
  const CropManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Management 🌱'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              FiltersSection(),
              SizedBox(height: 16),
              CropListSection(),
              SizedBox(height: 16),
              CropActionsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
