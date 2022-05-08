import 'package:flutter/material.dart';
import 'Pages/de_code.dart';
import 'Pages/en_code.dart';

void main() {
  return runApp(const MorseCodeUi());
}

class MorseCodeUi extends StatefulWidget {
  const MorseCodeUi({Key? key}) : super(key: key);

  @override
  State<MorseCodeUi> createState() => _MorseCodeUiState();
}

class _MorseCodeUiState extends State<MorseCodeUi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Morse Code"),
          centerTitle: true,
          // backgroundColor: Color.fromARGB(31, 255, 255, 255),
        ),
        body: const Home(),
      ),
      routes: {
        "/encode": (context) => const EncodePage(),
        "/decode": (context) => const DecodePage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      margin: const EdgeInsets.all(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/encode");
              },
              child: const Text("Encode to Morse code"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 40,
              child: ElevatedButton(
                child: const Text("Decode Morse code"),
                onPressed: () {
                  Navigator.pushNamed(context, "/decode");
                },
              ))
        ],
      ),
    );
  }
}
