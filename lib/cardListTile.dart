import 'package:flutter/material.dart';

class cardAndListeTile extends StatelessWidget {
  const cardAndListeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card List Tile"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ListViewKullanimi(),
      ),
    );
  }

  ListView ListViewKullanimi() {
    // listView'ın singleChildScrollView'dan farkı child yerine children almasıdır bu yüzden farklı yapıları tek seferde kullanabiliriz
    return ListView(
      children: [
        Column(
          children: [
            tekListe(),
            tekListe(),
            tekListe(),
            tekListe(),
            tekListe(),
            tekListe(),
            tekListe(),
            tekListe(),
          ],
        ),
        Text("ASD"),
        ElevatedButton(onPressed: () {}, child: Icon(Icons.add))
      ],
    );
  }

  SingleChildScrollView singleChildScrollViewKullanimi() {
    return SingleChildScrollView(
      // ekrandan taşan liste yapısını aşşağı kaydırılabilir yaptık
      child: Column(
        children: [
          tekListe(),
          tekListe(),
          tekListe(),
          tekListe(),
          tekListe(),
          tekListe(),
          tekListe(),
          tekListe(),
        ],
      ),
    );
  }

  Column tekListe() {
    return Column(children: [
      Card(
        // card hazır bir yapıdır
        color: Colors.red.shade300,
        shadowColor: Colors.black, // carda gölge vs. ekleyebiliriz
        elevation: 10, // gölgenin ne kadar uzakta olacağını belirler
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)), // köşelerden radius ekler
        child: ListTile(
          leading: CircleAvatar(
            // leading başa bir şeyler ekler
            child: Icon(Icons
                .add), // eklediğimiz iconu CircleAvatar yuvarlak içerisine alır
          ),
          title: Text("Üst yazı"),
          subtitle: Text("Alt yazı"),
          trailing: Icon(Icons.home_filled), // trailing sona bir şeyler ekler
        ),
      ),
      Divider(
        // düz çizgi çeker
        color: Colors.black,
        endIndent: 20, // sondan kaç birim kesileceğini belirler
        indent: 20, // baştan kaç birin kesileceğini belirler
        thickness: 5, // çizginin kalınlığını belirler
        height: 50,
      ),
    ]);
  }
}
