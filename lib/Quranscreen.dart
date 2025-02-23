import 'package:flutter/material.dart';
import 'models/surah.dart';
import 'data/Quranservice.dart';
import 'models/ListTitle.dart';
class Quranscreen extends StatefulWidget {
  const Quranscreen({super.key});

  @override
  State<Quranscreen> createState() => _QuranscreenState();
}

class _QuranscreenState extends State<Quranscreen> {
  late Future<List<Surah>> futursuarh;

  @override
  void initState() {
    super.initState();
    futursuarh = Quranservice.loadQuran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("القران الكريم", textAlign: TextAlign.center)),
      body: FutureBuilder<List<Surah>>(
        future: futursuarh,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Surah> suarhs = snapshot.data!;
return ListView.builder(
  itemCount: suarhs.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(suarhs[index].englishName),
      subtitle: Text(suarhs[index].name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailScreen(surah: suarhs[index]),
          ),
        );
      },
    );
  },
);


        },
      ),
    );
  }
}
