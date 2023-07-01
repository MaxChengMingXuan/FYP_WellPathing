import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellpathing/views/screens/activityscreen.dart';
// import '../../../../models/user.dart';
import '../../../../models/result.dart';
// import 'testscreen.dart';

class ResultScreen extends StatefulWidget {
  // final User user;
  final Result result;
  const ResultScreen(
      {super.key
      // , required this.user
      ,
      required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late double screenHeight, screenWidth, resWidth;
  bool isPositive = true;
  bool isNegative = true;
  bool isSentiasa = false;

  @override
  void initState() {
    super.initState();
    if (widget.result.sskmsentiasa == "1" &&
        widget.result.sskmlevel == "positive") {
      isSentiasa = true;
    } else {
      isSentiasa = false;
    }
    if (widget.result.sskmlevel == "negative") {
      isPositive = false;
      isNegative = true;
    } else {
      isPositive = true;
      isNegative = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Result"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Visibility(
                    visible: isPositive,
                    child: SizedBox(
                        // width: screenWidth * 0.3,
                        height: screenWidth * 0.3,
                        child: Image.asset("assets/images/positive.png")),
                  ),
                  Visibility(
                    visible: isNegative,
                    child: SizedBox(
                        // width: screenWidth * 0.3,
                        height: screenWidth * 0.3,
                        child: Image.asset("assets/images/care.png")),
                  ),
                  // SizedBox(
                  //     // width: screenWidth * 0.3,
                  //     height: screenWidth * 0.3,
                  //     child: Image.asset("assets/images/care.png")),
                  Text('Your score is ${widget.result.sskmscore}',
                      style: TextStyle(fontSize: screenWidth * 0.05)),
                  // Text('Your status is ${widget.result.sskmlevel}',
                  //     style: TextStyle(fontSize: screenWidth * 0.05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your status is ${widget.result.sskmlevel}',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: screenWidth * 0.05)),
                      Visibility(
                        visible: !isPositive,
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Advice",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07)),
                                  content: Text(
                                      "You are advised to seek help from a professional who can provide support and guidance. Talk to someone you trust and take care of yourself. Recovery is possible.",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: isPositive,
                        child: IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Congratulation",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07)),
                                  content: Text(
                                      "Congratulations on taking care of your mental health! Glad to hear that you’re in good mental health and prioritizing your well-being. If you ever need someone to talk to or want to learn more about ways to improve your mental health, don’t hesitate to reach out.",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  Visibility(
                    visible: isSentiasa,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Alert',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                color: Colors.red)),
                        IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hint",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.07)),
                                  content: Text(
                                      "Although your mental results are positive, it is still recommended that you meet with a professional to get help. It is always a good idea to seek professional advice when dealing with mental health issues.",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.7,
                      child:
                          Chart(widgetList: [widget], result: widget.result)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.08),
              child: SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                child: ElevatedButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: screenWidth * 0.05)),
                  onPressed: () {
                    // Store data into database and pop the result screen
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Chart extends StatefulWidget {
  final Result result;
  final List<Widget> widgetList;
  Chart({required this.widgetList, required this.result});

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 48,
      ),
      series: <ChartSeries>[
        ColumnSeries<ResultsData, String>(
            dataSource: <ResultsData>[
              ResultsData(
                  'SSKM Score', double.parse(widget.result.sskmscore ?? '0')),
              // ResultsData('SSKM Score', 5),
            ],
            xValueMapper: (ResultsData scores, _) => scores.status,
            yValueMapper: (ResultsData scores, _) => scores.scores,
            color: widget.result.sskmscore != null &&
                    double.parse(widget.result.sskmscore ?? '0') > 14
                ? Colors.red
                : Colors.blue)
      ],
    );
  }
}

class ResultsData {
  final String status;
  final double scores;

  ResultsData(this.status, this.scores);
}
