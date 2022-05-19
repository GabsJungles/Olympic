import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympic/models/flag.data.dart';
import 'package:http/http.dart';
import 'package:olympic/pages/flag.page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get http => null;

  get json => null;

  Future<List<FlagData>> getFlagDatas() async {
    const url = 'https://flagcdn.com/en/codes.json';

    var response = await Dio().get<String>(url);
    Map<String, dynamic> dados = jsonDecode(response.data!);

    List<String> countryCodes = [];
    List<String> countryNames = [];

    for (final key in dados.keys) {
      countryCodes.add(key);
    }

    for (final value in dados.values) {
      countryNames.add(value);
    }

    if (countryNames.isEmpty || countryCodes.isEmpty) {
      print("DEU RUIM");
    }

    List<FlagData> flagDatas = [];

    for (var i = 0; i < countryNames.length; i++) {
      flagDatas.add(FlagData(countryCodes[i], countryNames[i]));
    }

    return flagDatas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<FlagData>>(
            future: getFlagDatas(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF190B1E),
                                Color(0xFF3E1C4A),
                                Color(0xFF883EA3)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(18.0)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18.0),
                          onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FlagPage(countryCode: snapshot.data![index].id,)));
                          },
                          child: ListTile(
                              leading: Text(
                                (snapshot.data![index].id),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.indieFlower().fontFamily),
                              ),
                              title: Text((snapshot.data![index].countryName),
                                  style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.indieFlower()
                                          .fontFamily))),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
