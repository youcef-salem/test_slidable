import 'dart:convert';

// Class for individual Ayah (Verse)
class Ayah {
  final int number;
  final String text;

  Ayah({required this.number, required this.text});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(number: json['number'], text: json['text']);
  }
}

// Class for Surah (Chapter)
class Surah {
  final int number;
  final String name;
  final String englishName;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.ayahs,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahsList = json['ayahs'] as List;
    List<Ayah> ayahObjects =
        ayahsList.map((ayah) => Ayah.fromJson(ayah)).toList();

    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      ayahs: ayahObjects,
    );
  }
}

// Function to parse JSON into a list of Surahs
List<Surah> parsquaran(String jsonstring) {
  final parsed = json.decode(jsonstring)['data']['surahs'] as List;

  return parsed.map<Surah>((json) => Surah.fromJson(json)).toList();
}
