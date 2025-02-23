

  import 'package:flutter/services.dart' show rootBundle;
  import 'dart:convert';
import 'package:test_slidable/models/surah.dart';

class Quranservice {

 static Future <List<Surah>> loadQuran() async{


  String jsonString = await rootBundle.loadString('assets/quran.json');
  
  return parsquaran(jsonString);


}

} 