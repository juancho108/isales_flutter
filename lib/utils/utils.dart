import 'dart:convert';

import 'package:sprintf/sprintf.dart';
import "package:intl/intl.dart";

String normalizeToXML(String text) {
  if (text == null) return text;

  text = text.replaceAll("\\&amp;", "&");
  text = text.replaceAll("\\&lt;", "<");
  text = text.replaceAll("\\&gt;", ">");
  text = text.replaceAll("\\&quot;", "\"");
  return text;
}

String betterEncode(String text) {
  String key = "BettersoftSistemasdeinformacaoLda";
  String result = "";

  List<int> encodeLogin = utf8.encode(text);
  List<int> encodeKey = utf8.encode(key);
  // List<String> encodeStr = []..length = encodeLogin.length;
  // List<String> encodeStr = List(encodeLogin.length); //antes
  List<String> encodeStr =
      List<String>.filled(encodeLogin.length, '', growable: true);
  // encodeStr.length = encodeLogin.length;

  var f = new NumberFormat("000", "en_US");
  for (int i = 0; i < encodeLogin.length; i++) {
    int bitResult = (encodeLogin[i] ^ encodeKey[encodeKey.length - 1]);

    ///
    encodeStr[i] = f.format(
        bitResult); //NumberFormat("#", "en_US").toString(); //NumberFormat.compact().format(bitResult); //sprintf("%03d", bitResult);
  }

  for (int i = 0; i < encodeLogin.length; i++) result += encodeStr[i];

  return result;
}
