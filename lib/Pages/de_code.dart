import 'package:flutter/material.dart';
import 'decoding.dart';
import 'package:flutter/services.dart';

class DecodePage extends StatefulWidget {
  const DecodePage({Key? key}) : super(key: key);

  @override
  State<DecodePage> createState() => _DecodePageState();
}

class _DecodePageState extends State<DecodePage> {
  String decodingValue = "";
  String decoded = "";
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
                "Write space after each morse code letter \nCorresponding String is: \n",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 200,
                child: Text(
                  decoded,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                decoration:
                    const InputDecoration(hintText: "Type morse code here"),
                maxLines: null,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                onChanged: (value) {
                  setState(() {
                    decodingValue = value;
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
                        decoded = decodeString(decodingValue);
                      });
                    },
                    child: const Text("Decode"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: decoded));
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
