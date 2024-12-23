import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/sectors_screen.dart';
import '../screens/crop_management_screen.dart';
import '../screens/pest_management_screen.dart';
import '../screens/fertilizer_management_screen.dart';
import '../screens/inventory_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/reports_screen.dart';
import '../screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Farm Management',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Dashboard and Sectors
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Sectors'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SectorsScreen()),
              );
            },
          ),
          const Divider(),
          // Crop and Resource Management
          ListTile(
            leading: const Icon(Icons.agriculture),
            title: const Text('Crop Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CropManagementScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Pest Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PestManagementScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Fertilizer Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FertilizerManagementScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Inventory'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InventoryScreen()),
              );
            },
          ),
          const Divider(),
          // Planning and Analytics
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Reports and Analytics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReportsScreen()),
              );
            },
          ),
          const Divider(),
          // Settings
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Implement logout functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
} 
