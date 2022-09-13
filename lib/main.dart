import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      color: Colors.yellow,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => HomePage();
}

class HomePage extends State<MyHomePage> {
  int _counter = 0;

  void decrementa() {
    setState(() {
      _counter--;
      print('Decrementa');
    });
  }

  void incrementa() {
    setState(() {
      _counter++;
      print('Incrementa');
    });
   }

  bool get isEmpty => _counter == 0;
  bool get isFull => _counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/restaurante.jpg'),
                fit:  BoxFit.cover,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  isFull ? 'Lotado!!' : ' Pode entrar.',
                  style: TextStyle(
                    fontSize: 40,
                    color: isFull ? Colors.redAccent : Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
              const Padding(
                padding: EdgeInsets.all(40),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  '$_counter',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.all(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrementa,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.grey : Colors.white,
                        fixedSize: const Size(110, 110),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: isFull ? null : incrementa,
                    style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.grey : Colors.white,
                      fixedSize: const Size(110, 110),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
