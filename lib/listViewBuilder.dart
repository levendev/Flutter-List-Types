import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewBuilderr extends StatelessWidget {
  ListViewBuilderr({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) =>
        Ogrenci(index + 1, "Ögrenci ${index + 1}", "Öğrenci ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View Builder"),
          backgroundColor: Colors.blue,
        ),
        // body: ListView.builder(    // builder
        body: ListView.separated(
          // seperated'ın builderdan tek farkı içine seperatorBuilder da almasıdır
          // listViewBuilder ekranda görünenleri yükler diğerlerini yüklemez bu sayede bellek dostu olmayı sağlar
          itemBuilder: (BuildContext context, index) {
            // context girmeliyiz index ise itemCount daki uzunluğa kadar sıfırdan başlayarak gider
            var ogr = tumOgrenciler[index];
            return Card(
              color:
                  index % 2 == 0 ? Colors.red : Colors.teal.withOpacity(0.50),
              child: ListTile(
                onLongPress: () {
                  _alertDialogIslemleri(context, tumOgrenciler[index]);
                },
                onTap: () {
                  // onTap ListView'in tıklanma metodudur
                  print("${index + 1}. tıklandı.");
                  if (index % 2 == 0) {
                    EasyLoading.instance.backgroundColor = Colors.blue;
                  } else {
                    EasyLoading.instance.backgroundColor = Colors.teal;
                  }
                  EasyLoading.showToast(
                    "Tıklandı.",
                    duration: Duration(seconds: 5),
                    dismissOnTap: true,
                    toastPosition: EasyLoadingToastPosition.bottom,
                  ); // easyLoading hazır bir pakettir bunu pub dev sitesinden bulduk ve gerekli importları pubspec.yaml dosyasına ve return MaterialApp'ın içerisine gerçekleştirdik
                },
                title: Text(ogr.ad),
                subtitle: Text(ogr.soyad),
                leading: CircleAvatar(
                  child: Text(ogr.id.toString()),
                ),
              ),
            );
          },
          itemCount: tumOgrenciler.length,
          separatorBuilder: (context, index) {
            // seperatorBuilder her oluşan elemandan sonra bir şey build eder
            if ((index + 1) % 4 == 0) {
              return Divider(
                thickness: 2,
                color: Colors.black,
              );
            } else {
              return SizedBox(); // sizedBox boş bir şeydir
            }
          },
        ));
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (ogr) => ListTile(
              title: Text(ogr.ad),
              subtitle: Text(ogr.soyad),
              leading: CircleAvatar(
                child: Text(ogr.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }
}

void _alertDialogIslemleri(BuildContext myContext, Ogrenci ogr) {
  showDialog(
    // showDialog bir context bekler.Aldığı contextin üzerine dialog penceresi çıkartır.Builder ile çıkartacağı pencereyi build ederiz.
    context: myContext,
    builder: (context) {
      return AlertDialog(
        // içinde uyarı dialoğuna uygun hazır yapılar barındıran bir widgettır
        title: Text(ogr.toString()),
        content: SingleChildScrollView(
          child: Text("asd" * 3000),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                  context); // tıklandığı zaman context olan sayfaya navigator ile geçilmesini sağlar
            },
            child: Text("Hayır"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Evet"),
          ),
        ],
      );
    },
  );
}

class Ogrenci {
  final int id;
  final String ad;
  final String soyad;

  Ogrenci(this.id, this.ad, this.soyad);

  @override
  String toString() {
    return "Ad: $ad Soyad: $soyad";
  }
}
