import 'package:flutter/material.dart';

class ScrollVieww extends StatelessWidget {
  const ScrollVieww({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // listView ve gridViewi aynı anda içinde barındırabilen yapıdır
        slivers: [
          // sliver ile içine bir şeyler ekleriz
          SliverAppBar(
            pinned:
                true, // aşşağı kaydırdığımızda appbar kapansa bile appbarın title'ının görünüp görünmeyeceğini belirler
            // appbar koyabiliriz lakin buraya appbar koyarsak materialApp'a koymamalıyız
            title: Text("Custom Scroll View"),
            backgroundColor: Colors.red,
            expandedHeight:
                200, // kaç pixel sonra appbarın yukarıya gideceğini belirler
            floating:
                false, // aşşağı kaydırıp appbarı kaybettikten sonra yukarı kaydırdığımızda appbarın geri gelip gelmeyeceğini belirler
            flexibleSpace: FlexibleSpaceBar(
              centerTitle:
                  true, // başlığı ortaya alınıp alınmayacağını belirler
              title: Text(
                  "Başlık"), // ortaya animasyonlu bir başlık ekler lakin aşşağı kaydırdığımız zaman sliverAppBar'ın title'ı ile çakışır
              background: Image.asset(
                // spacebara resim ekleyebiliriz
                "assets/z.jfif",
                fit: BoxFit.fill,
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                containerOlusturucu(100),
                containerOlusturucu(200),
                containerOlusturucu(300),
                containerOlusturucu(400),
                containerOlusturucu(500),
                containerOlusturucu(600),
                containerOlusturucu(700),
                containerOlusturucu(800),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container containerOlusturucu(int renk) {
    return Container(
      color: Colors.teal[renk],
      width: 150,
      height: 150,
      child: Text("Merhaba", textAlign: TextAlign.center),
      alignment: Alignment.center,
    );
  }
}
