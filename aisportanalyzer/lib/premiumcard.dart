import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PremiumCard extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final double totalOdds;

  PremiumCard({
    required this.title,
    required this.date,
    required this.time,
    required this.totalOdds,
  });

  @override
  _PremiumCardState createState() => _PremiumCardState();
}

class _PremiumCardState extends State<PremiumCard> {
  late Timer _timer;
  late String _formattedCounter;

  @override
  void initState() {
    super.initState();
    _updateCounter(); // Initial update
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateCounter();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateCounter() {
    DateTime endTime =
        DateFormat('yyyy-MM-dd HH:mm').parse('${widget.date} ${widget.time}');
    Duration remainingTime = endTime.difference(DateTime.now());
    _formattedCounter =
        '${remainingTime.inHours.toString().padLeft(2, '0')}.${(remainingTime.inMinutes % 60).toString().padLeft(2, '0')}.${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}';
    setState(() {}); // Trigger a rebuild to update the UI
  }

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient;

    // Define gradients based on the title
    if (widget.title.toLowerCase().contains('silver')) {
      gradient = LinearGradient(
        colors: [Colors.grey[400]!, Colors.grey[700]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (widget.title.toLowerCase().contains('bronze')) {
      gradient = LinearGradient(
        colors: [Colors.brown[300]!, Colors.brown[600]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else if (widget.title.toLowerCase().contains('golden')) {
      gradient = LinearGradient(
        colors: [Colors.yellow[400]!, Colors.yellow[700]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      gradient = LinearGradient(
        colors: [Colors.grey[400]!, Colors.grey[700]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }

    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // First Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Total Odds: ${widget.totalOdds}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromARGB(255, 21, 20, 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your action for the "Check Now" button
                  },
                  child: Text('Check Now'),
                ),
              ],
            ),
            // Second Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Time remaining: $_formattedCounter',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
