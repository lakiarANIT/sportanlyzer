import 'package:aisportanalyzer/predictioncard.dart';
import 'package:aisportanalyzer/premiumcard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AisportAnalyzer Predictions'),
        elevation: 4.0,
      ),
      body: Container(
        color: Colors.lightBlue,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                PremiumPredictionCard(),
                SizedBox(height: 4.0), // Add spacing between cards
                PredictionCard(
                  date: '2022-01-01',
                  time: '14:30',
                  home: 'Manchester United',
                  away: 'Bayern Leverkusoon',
                  pick: 'Both Team to Score',
                  status: 'Won',
                  result: '2-1',
                ),
                SizedBox(height: 4.0), // Add spacing between cards
                PredictionCard(
                  date: '2022-01-02',
                  time: '16:00',
                  home: 'Team C',
                  away: 'Team D',
                  pick: 'Team C',
                  status: 'Lost',
                  result: '1-3',
                ),
                SizedBox(height: 4.0), // Add spacing between cards
                PredictionCard(
                  date: '2022-01-03',
                  time: '18:30',
                  home: 'Team E',
                  away: 'Team F',
                  pick: 'Team E',
                  status: 'Draw',
                  result: '2-2',
                ),
                SizedBox(height: 4.0), // Add spacing between cards
                PremiumCard(
                  title: 'silver Premium',
                  date: '2024-01-07',
                  time: '18:00',
                  totalOdds: 2.5,
                ),
                PremiumCard(
                  title: 'Bronze Premium',
                  date: '2024-01-07',
                  time: '03:00',
                  totalOdds: 2.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PremiumPredictionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 80.0, // Adjusted height
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.only(top: 2.0), // Margin from the app bar
        child: Center(
          child: TextButton(
            onPressed: () {
              // Add your action for the button
            },
            child: Text(
              'Premium Prediction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
