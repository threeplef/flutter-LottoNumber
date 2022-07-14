import 'dart:math';

import 'package:flutter/material.dart';

class LottoNumber extends StatefulWidget {
  const LottoNumber({Key? key}) : super(key: key);

  @override
  State<LottoNumber> createState() => _LottoNumberState();
}

class _LottoNumberState extends State<LottoNumber> {
  var rnd = Random();
  List<int> lottonumber = <int>[];
  String waiting = '두구두구';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Center(
          child: Text('LOTTO',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                '🍀',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            Column(
              children: [
                if (isLoading && waiting == '두구두구')
                  const CircularProgressIndicator()
                else
                  Text('$lottonumber', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  Text(waiting, style: const TextStyle(fontSize: 20))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  showLottoNumber();
                  showLoading();
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text('행운의 번호 추첨', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLottoNumber() async {
    setState(() {
      isLoading = true;
      waiting = '두구두구';
    });
  }

  Future showLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
      lottonumber.clear();
      var rng = Random();
      for (var i = 0; i < 6; i++) {
        lottonumber.add(rng.nextInt(45));
      }
      waiting = '✨ Jackpot! ✨';
    });
  }
}
