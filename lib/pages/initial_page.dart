import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympic/pages/home_page.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InitalPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 90,
                image: AssetImage("lib/images/plano.de.fundo.gif"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 360,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Finding World',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.frederickaTheGreat().fontFamily,
                      fontSize: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                          decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        hintText: '',
                      ))),
                  const SizedBox(
                    height: 5,
                  ),
                  IconButton(
                      icon: const Icon(Icons.airplanemode_active_rounded),
                      iconSize: 60,
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      })
                ]),
          ),
        ));
  }
}
