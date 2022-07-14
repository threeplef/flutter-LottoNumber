import 'package:flutter/material.dart';

class FutureExam extends StatelessWidget {
  const FutureExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future 연습'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('연습1'),
              // 코드량 많아지면 async await 처리할 수 있는 함수로 만들어서 프린트
              onPressed: () async {
                print('click!');
                // exam1_2().then((value) => print(value));
                String result = await exam1_3();
                print(result);
              },
            ),
            ElevatedButton(
              child: const Text('연습2'),
              onPressed: () async {
                for (int i = 0; i < 3; i++) {
                  await Future.delayed(const Duration(seconds: 1));
                  print('hello');
                }
              },
            ),
            ElevatedButton(
              child: const Text('연습3'),
              onPressed: () => exam3(),
            ),
            ElevatedButton(
              child: const Text('연습4'),
              onPressed: () async {
                for (int i = 5; i > 0; i--) {
                  print(i);
                  await Future.delayed(const Duration(seconds: 1));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future exam1() async {
    var delay = Future.delayed(const Duration(seconds: 3));
    delay.then((value) => print('Hello'));
  }

  // 과한 느낌이 있어서 세번째 방법을 더 많이 씀
  // 2,3번 방법은 안에서 함수 안에서 then 사용
  // 코드량 많아지면 async await 처리할 수 있는 함수로 만들어서 프린트
  Future<String> exam1_2() async {
    await Future.delayed(const Duration(seconds: 3));
    var data = await Future.value('Hello');
    return data;
  }

  Future<String> exam1_3() async {
    await Future.delayed(const Duration(seconds: 3));
    return 'Hello';
  }

  Future exam3() async {
    print('다운로드 시작');
    await Future.delayed(const Duration(seconds: 1));
    print('초기화 중...');
    await Future.delayed(const Duration(seconds: 1));
    print('핵심파일 로드 중...');
    await Future.delayed(const Duration(seconds: 3));
    print('다운로드 완료!');
  }
}
