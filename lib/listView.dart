import 'package:flutter/material.dart';

class listViewKullanimi extends StatelessWidget {
  listViewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    // istediğimiz uzunlukta liste oluşturmamızı sağlar
    500,
    (index) => Ogrenci(
        index + 1, "Öğrenci adı ${index + 1}", "Öğrenci Soyadı ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        // column ile listView kullanırken hata alırız çünkü listView sonsuz size ister ama olmaz.Bu yüzden listView'i expanded yaparak kalan alanı listViewe vererek bu sorunu çözebiliriz
        // shrinkWrap: true,    // shrinkWrap sayesinde listView içeriği kadar yer kaplar.True yapmazsak normalde listView içeriği tüm ekranı kapsamasa bile tüm ekranı kapsar.
        children: tumOgrenciler
            .map(
              (Ogrenci ogr) => ListTile(
                title: Text(ogr.ad),
                subtitle: Text(ogr.soyad),
                leading: CircleAvatar(
                  child: Text(ogr.id.toString()),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Ogrenci {
  final int id;
  final String ad;
  final String soyad;

  Ogrenci(this.id, this.ad, this.soyad);
}
