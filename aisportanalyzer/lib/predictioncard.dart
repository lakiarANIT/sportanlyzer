import 'package:flutter/material.dart';

class PredictionCard extends StatelessWidget {
  final String date;
  final String time;
  final String home;
  final String away;
  final String pick;
  final String status;
  final String result;

  PredictionCard({
    required this.date,
    required this.time,
    required this.home,
    required this.away,
    required this.pick,
    required this.status,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDCE8FA), Color(0xFFAED3F2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildRow(date, time, fontSize: 20.0),
            const SizedBox(height: 12.0),
            _buildRow(home, result.split('-')[0]),
            const SizedBox(height: 8.0),
            _buildRow(away, result.split('-')[1]),
            const SizedBox(height: 12.0),
            _buildPick(pick, status),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String leftText, String rightText, {double fontSize = 16.0}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.black87,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPick(String pickText, String statusText) {
    Color statusColor;
    switch (statusText.toLowerCase()) {
      case 'won':
        statusColor = Colors.green;
        break;
      case 'lost':
        statusColor = Colors.red;
        break;
      case 'not started':
        statusColor = Colors.yellow;
        break;
      default:
        statusColor = Colors.black87;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pick:',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black87,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white),
          ),
          child: Text(
            pickText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color.fromARGB(255, 86, 74, 218),
            ),
          ),
        ),
        Text(
          statusText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}
