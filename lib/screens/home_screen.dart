import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/home/overview_section.dart';
import '../components/home/quick_actions_section.dart';
import '../components/home/recent_activities_section.dart';
import '../components/home/statistics_section.dart';
import 'qr_scanner_screen.dart';
import 'qr_generator_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home 🏠'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children:  [
              OverviewSection(),
              SizedBox(height: 16),
              QuickActionsSection(),
              SizedBox(height: 16),
              RecentActivitiesSection(),
              SizedBox(height: 16),
              StatisticsSection(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.qr_code_scanner),
                      title: const Text('Scan QR Code'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRScannerScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.qr_code),
                      title: const Text('Generate QR Code'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QRGeneratorScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'QR Code Options',
        child: const Icon(Icons.qr_code),
      ),
    );
  }
} 
