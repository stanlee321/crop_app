import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/inventory/inventory_overview_section.dart';
import '../components/inventory/inventory_filters_section.dart';
import '../components/inventory/inventory_list_section.dart';
import '../components/inventory/inventory_actions_section.dart';
import '../components/inventory/inventory_alerts_section.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory 📦'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              InventoryOverviewSection(),
              SizedBox(height: 16),
              InventoryFiltersSection(),
              SizedBox(height: 16),
              InventoryListSection(),
              SizedBox(height: 16),
              InventoryActionsSection(),
              SizedBox(height: 16),
              InventoryAlertsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
} 
