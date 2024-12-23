import 'package:flutter/material.dart';

class CalendarGridSection extends StatelessWidget {
  const CalendarGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'December 2023',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            _buildCalendarHeader(),
            _buildCalendarGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) => 
        Expanded(
          child: Center(
            child: Text(
              day,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    return Column(
      children: [
        _buildWeekRow(['', '', '', '1', '2', '3', '']),
        _buildWeekRow(['4', '5', '6', '7', '8', '9', '10']),
        _buildWeekRow(['11', '12', '13', '14', '15', '16', '17']),
        _buildWeekRow(['18', '19', '20', '21', '22', '23', '24']),
        _buildWeekRow(['25', '26', '27', '28', '29', '30', '31']),
      ],
    );
  }

  Widget _buildWeekRow(List<String> days) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: days.map((day) => 
          Expanded(
            child: Center(
              child: day.isEmpty 
                ? const Text('')
                : InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Text(day),
                    ),
                  ),
            ),
          ),
        ).toList(),
      ),
    );
  }
} 
