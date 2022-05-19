import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FlagDatas {
  final List flagDatas;

  FlagDatas(this.flagDatas);
}

class FlagData {
  final String id;
  final String countryName;

  FlagData(this.id, this.countryName);

  factory FlagData.fromJson(Map<String, dynamic> json) {
    return FlagData(
      json['id'],
      json['countryName'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id': this.id, 'countryname': this.countryName};
}
