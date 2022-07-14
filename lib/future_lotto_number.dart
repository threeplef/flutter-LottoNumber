import 'dart:math';

import 'package:flutter/material.dart';

class LottoNumber extends StatefulWidget {
  const LottoNumber({Key? key}) : super(key: key);

  @override
  State<LottoNumber> createState() => _LottoNumberState();
}

class _LottoNumberState extends State<LottoNumber> {
  var rnd = Random();
  List<int> randomnumber = <int>[] ;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('복권 번호 추첨기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '행운의 번호 🍀',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Column(
              children: [
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  Text('$randomnumber')
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showLottoNumber();
                showLoading();
              },
              child: Text('번호 추첨'),
            ),
          ],
        ),
      ),
    );
  }

  void showLottoNumber() async {
    setState(() {
      isLoading = true;
    });
  }

  Future showLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
      randomnumber.clear();
      var rng = Random();
      for (var i = 0; i < 6; i++) {
        randomnumber.add(rng.nextInt(45));
      }
    });
  }
}