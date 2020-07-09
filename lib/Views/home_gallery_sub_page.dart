import 'dart:convert';
import 'package:flutter/material.dart';


class HomeGallerySubPage extends StatefulWidget {
  @override
  _HomeGallerySubPageState createState() => _HomeGallerySubPageState();
}

class _HomeGallerySubPageState extends State<HomeGallerySubPage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder
    (
      future: _loadImagePaths(context),
      builder: (BuildContext context,AsyncSnapshot<List<String>> imagePathsSnapshot)
      {
        if(imagePathsSnapshot.connectionState==ConnectionState.done && 
        imagePathsSnapshot.hasData)
        {
          return _buildContent(imagePathsSnapshot.data);
        }
        return Center(child: CircularProgressIndicator());
      },
      
    );
  }

  GridView _buildContent(List<String>imagePaths)
  {
     return GridView.count
     (
       crossAxisCount: 3,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
       padding: const EdgeInsets.all(10.0),
       children: imagePaths
                 .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
                 .toList()
     );
  }
   
   Future<List<String>> _loadImagePaths(BuildContext context) async {
    final String manifestContentJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContentJson);

    return manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();
  }
   

   Image _buildImageWidget(String imagePath)
   {
     return Image.asset
     (
       imagePath,
       fit: BoxFit.cover
     );
   }
}