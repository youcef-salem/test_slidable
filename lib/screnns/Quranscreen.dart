import 'package:flutter/material.dart';
import 'package:test_slidable/screnns/surahscreen.dart';
import '../models/surah.dart';
import '../data/Quranservice.dart';
import '../models/ListTitle.dart';

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
      appBar: AppBar(
        title: Text("القران الكريم"),
        backgroundColor: Colors.cyanAccent,
        centerTitle:true,
      ),
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
              return Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:  Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                       

                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        suarhs[index].name,
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      ),
                      Text(
                        suarhs[index].number.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurahDetailScreen(surah: suarhs[index]),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
