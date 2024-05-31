import 'package:flutter/material.dart';

class gesture extends StatelessWidget {
  const gesture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector"),
        backgroundColor: Colors.teal,
      ),
      body: GestureDetector(
        // child'ına tıklanma fonksiyonları sağlar
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ),
        onTap: () => print("Tıklandı"),
        onDoubleTap: () => print("İki kez tıklandı"),
        onLongPress: () => print("Basılı tutuldu"),
        onHorizontalDragStart: (e) => print(
            "İptal edildi $e"), // basılı tutup başka bir yere kaydırarak iptal ettiğimizde çalışır bize basılı tutulan konumu parametre olarak gönderdiği için onu almamız gerekir fonksiyonu çağırırken
      ),
    );
  }
}
