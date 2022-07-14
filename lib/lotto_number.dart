import 'dart:math';
import 'package:flutter/material.dart';

class LottoNumber extends StatefulWidget {
  const LottoNumber({Key? key}) : super(key: key);

  @override
  State<LottoNumber> createState() => _LottoNumberState();
}

class _LottoNumberState extends State<LottoNumber> {
  List<int> lottoNumber = <int>[];
  bool isLoading = false;
  String waiting = '두구두구';
  String imageUrl = 'https://img.extmovie.com/files/attach/images/135/723/810/078/6aed427bb7947ecefebab48d74483801.gif';

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
                  Text('$lottoNumber', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                Text(waiting, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                Image.network(imageUrl, width: 300, height: 150)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  showLoading();
                  showLottoNumber();
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

  Future showLoading() async {
    setState(() {
      isLoading = true;
      waiting = '두구두구';
      imageUrl = 'https://img.extmovie.com/files/attach/images/135/723/810/078/6aed427bb7947ecefebab48d74483801.gif';
    });
  }

  Future showLottoNumber() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
      lottoNumber.clear();
      var random = Random();
      for (var i = 0; i < 6; i++) {
        lottoNumber.add(random.nextInt(45));
      }
      waiting = '✨ Jackpot! ✨';
      imageUrl = 'https://post-phinf.pstatic.net/MjAyMTA4MTZfMTQ2/MDAxNjI5MDkzNzQyMTcy.jNZi0JM9P7ULkK6c9Uheq-m2yg5axebvD7_9QFBliEgg.UHrfL5tayXWi9EXSGQIOUEP5hfk4K91SWFWRkUjS-Kcg.PNG/20210816_145436.png?type=w1200';
    });
  }
}
