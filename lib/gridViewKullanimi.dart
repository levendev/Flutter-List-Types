import 'package:flutter/material.dart';

class gridViewKullan extends StatelessWidget {
  const gridViewKullan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        backgroundColor: Colors.teal,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return _containerOlustur();
        },
        itemCount: 20,
      ),
    );
  }

  GridView gridView() {
    return GridView.count(
      // GridView.extent'de vardır.Extent'de crossAxisCount yoktur onun yerine maxCrossAxisExtent vardır.Orada da bir elemanın en fazla ne kadar büyük olacağını seçeriz.Bu sayede sığabildiği kadar sığdırır.
      // scrollDirection: Axis.horizontal,   // soldan sağa bir kayma türü yapar
      // reverse: true,   // listedeki elemanların sırasını ters çevirir
      crossAxisCount: 3, // bir satırdaki eleman sayısını belirler
      primary:
          false, // liste aşşağı kaymasa bile kayma efektini kapatıp açmaya yarar
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 10, // yanlarındakilerle olan mesafeyi belirler
      mainAxisSpacing: 30, // aşşağılı yukarılı aradaki mesafeyi belirler
      children: [
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
        _containerOlustur(),
      ],
    );
  }
}

_containerOlustur() {
  return Container(
    alignment: Alignment.center,
    color: Colors.amber,
    child: Text(
      "Selam",
      textAlign: TextAlign.center,
    ),
  );
}
