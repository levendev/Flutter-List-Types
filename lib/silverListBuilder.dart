import 'dart:math';

import 'package:flutter/material.dart';

class Silverlistbuilder extends StatelessWidget {
  const Silverlistbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Sliver App Bar"),
            backgroundColor: Colors.red,
            expandedHeight: 200,
          ),
          /*      SliverList(
            delegate: SliverChildListDelegate(
              _sabitListeOlustur(),
            ),
          ),
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _dinamikListeOlustur(index),
                childCount: 10),
          ),
          SliverFixedExtentList(
              // sliverFixedExtentList ile hem SliverChildListDelegate kullanarak listeyi verip eleman kullanabiliriz hem de SliverChildBuilderDelegate ile builder kullanabiliriz
              delegate: SliverChildListDelegate(_sabitListeOlustur()),
              itemExtent: 100), // itemExtent itemlerin büyüklüğünü belirler
          SliverFixedExtentList(
            // SliverFixedExtentList normal SliverList'ten daha performansı çalışır
            delegate: SliverChildBuilderDelegate(
                (context, index) => _dinamikListeOlustur(index),
                childCount: 10),
            itemExtent: 100,
          ),  */
          SliverGrid(
            delegate: SliverChildListDelegate(_sabitListeOlustur()),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    200), // her satırdaki elemanların max uzunluğunu belirler
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _dinamikListeOlustur(index),
                childCount: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5), // bir satırda kaç eleman olacağını belirler
          ),
          SliverGrid.builder(
            // bu şekilde .builder .extent ve .count kullanabiliriz
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) => _dinamikListeOlustur(index),
            itemCount: 50,
          )
        ],
      ),
    );
  }
}

List<Widget> _sabitListeOlustur() {
  return [
    Container(
      color: Colors.red,
      child: Text("MERHABA"),
    ),
    Container(
      color: Colors.orange,
      child: Text("MERHABA"),
    ),
    Container(
      color: Colors.teal,
      child: Text("MERHABA"),
    ),
    Container(
      color: Colors.green,
      child: Text("MERHABA"),
    ),
    Container(
      color: Colors.blue,
      child: Text("MERHABA"),
    ),
  ];
}

Widget _dinamikListeOlustur(int index) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "${index + 1}. dinamik liste.",
      textAlign: TextAlign.center,
    ),
    color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255)),
    width: 200,
    height: 200,
  );
}
