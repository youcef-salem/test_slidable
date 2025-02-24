import 'package:flutter/material.dart';
import 'package:test_slidable/models/surah.dart';

class SurahDetailScreen extends StatelessWidget {
  final Surah surah;
  const SurahDetailScreen({super.key, required this.surah});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.englishName)),
      body: ListView.builder(
        itemCount: surah.ayahs.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(surah.ayahs[index].text));
        },
      ),
    );
  }
}
