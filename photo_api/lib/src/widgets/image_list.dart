import 'package:flutter/material.dart';
import '../model/image_Model.dart';

class ImageList extends StatelessWidget{

final List<ImageModel> images;

 ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: images.length,
      itemBuilder: (context, int index){
        return Container(padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: <Widget>[
            Image.network(images[index].url), 
            Text(images[index].title)
          ],
        ));
      },
      );
  }
  
} 