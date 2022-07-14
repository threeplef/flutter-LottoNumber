import 'package:async_test/future_lotto_number.dart';
import 'package:async_test/future_exam.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LottoNumber(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카운터'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
