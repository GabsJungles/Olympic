import 'package:flutter/material.dart';

class FlagPage extends StatefulWidget {
  final String countryCode;
  const FlagPage({Key? key, required this.countryCode}) : super(key: key);

  @override
  State<FlagPage> createState() => _FlagPageState();
}

class _FlagPageState extends State<FlagPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 50,
                image: AssetImage("lib/images/fundo.luzes.gif"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 225,
                    ),
                    Container(
                      height: 330,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("lib/images/flags/${widget.countryCode}.png"))),
                    ),
                    IconButton(
                        icon: const Icon(Icons.arrow_circle_left_rounded),
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]),
            ),
          ),
        ));
  }
}
