import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'countries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int totalAttempted = 0;
bool showAnswer = false;
double _percentage = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            totalAttempted = 0;
            _percentage = 0;
          });
        },
        child: const Text('Reset'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Score ${_percentage.toStringAsFixed(0)} / Quize no $totalAttempted'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: 300,
              child: Card(
                elevation: 20,
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !showAnswer ? 'Capital:' : 'Country:',
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      !showAnswer
                          ? countries[totalAttempted]['city']!
                          : countries[totalAttempted]['country']!,
                      style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
              width: 150,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showAnswer = !showAnswer;
                      });
                    },
                    child: Text('show ${showAnswer ? 'Answer' : 'Question'}')),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (totalAttempted < countries.length - 1) {
                        _percentage++;
                        totalAttempted++;
                      }
                    });
                  },
                  child: const Text('correct')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (totalAttempted < countries.length - 1) {
                        totalAttempted++;
                        _percentage++;
                      }
                    });
                  },
                  child: const Text('wrong')),
            ],
          ),
          Slider(
            value: _percentage,
            max: countries.length - 1,
            divisions: 8,
            onChanged: ((value) {
              setState(() {
                _percentage = value;
              });
            }),
          ),
        ],
      ),
    );
  }
}
