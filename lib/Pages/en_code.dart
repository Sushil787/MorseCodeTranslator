import 'package:flutter/material.dart';
import 'encoding.dart';
import 'package:flutter/services.dart';

class EncodePage extends StatefulWidget {
  const EncodePage({Key? key}) : super(key: key);

  @override
  State<EncodePage> createState() => _EncodePageState();
}

class _EncodePageState extends State<EncodePage> {
  String encodingValue = "";
  String encoded = "";
  TextEditingController txt2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(children: [
        Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Corresponding morse Code is: \n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 200,
                child: Text(
                  encoded,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: "Type the word here"),
                maxLines: null,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                onChanged: (value) {
                  setState(() {
                    encodingValue = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        encoded = encodedString(encodingValue);
                      });
                    },
                    child: const Text("Encode"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: encoded));
                      },
                      child: const Text("Copy to clipboard"))
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
