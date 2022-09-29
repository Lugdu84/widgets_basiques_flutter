import 'package:flutter/material.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("Size : $size");
    print("platform : $platform");
    return Scaffold(
        appBar: AppBar(
          title: Text("Les widgets basiques"),
          toolbarHeight: 40,
          leading: Icon(Icons.favorite_border),
          actions: [Icon(Icons.handshake), Icon(Icons.border_clear_rounded)],
          elevation: 7.5,
        ),
        body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            // margin: EdgeInsets.all(10),
            // padding: EdgeInsets.only(top: 150),
            child: Center(
                child: Card(
                    elevation: 7.5,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Test de la colonne"),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              fromAsset(
                                  name: "images/beach.jpg",
                                  height: 200,
                                  width: size.width),
                              Padding(
                                  padding: const EdgeInsets.only(top: 160),
                                  child: profilImage(imageName: "profil.jpg")),
                              Text("Un autre élément")
                            ],
                          ),
                          Divider(
                            color: Colors.red,
                            height: 10,
                            thickness: 1,
                          ),
                          Container(
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            color: Colors.teal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                profilImage(imageName: "beach.jpg"),
                                // fromAsset(name: "images/beach.jpg"),
                                Expanded(
                                    child: simpleText(
                                        "Texte dans une row qui s'étend, et qui prend toute la place"))
                              ],
                            ),
                          ),
                          fromNetwork(
                              "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg",
                              size),
                          spanDemo()
                        ],
                      ),
                    )))));
  }

  CircleAvatar profilImage({required String imageName, double radius = 40}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blueAccent,
      foregroundImage: AssetImage("images/$imageName"),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic),
      textAlign: TextAlign.start,
    );
  }

  Text spanDemo() {
    return const Text.rich(TextSpan(
        text: "Salut les codeurs",
        style: TextStyle(color: Colors.blue),
        children: [
          TextSpan(
              text: "Text second style", style: TextStyle(color: Colors.green)),
          TextSpan(
              text: "A l'infini et au delà",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
        ]));
  }

  Icon myIcon(Size size) {
    return Icon(
      Icons.favorite,
      size: size.width / 10,
      color: Colors.amberAccent,
      semanticLabel: "For the favorite",
    );
  }

  Image fromNetwork(String path, Size size) {
    return Image.network(
      path,
      height: 150,
      width: size.width / 2,
      fit: BoxFit.contain,
    );
  }

  Image fromAsset(
      {required String name, double width = 80, double height = 80}) {
    return Image.asset(
      "images/beach.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
