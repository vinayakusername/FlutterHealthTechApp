import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/home_gallery_detail_page.dart';
import 'package:health_tech_app1/components/home_gallery_image_widget.dart';


class HomeGallerySubPage extends StatefulWidget {
  @override
  _HomeGallerySubPageState createState() => _HomeGallerySubPageState();
}

class _HomeGallerySubPageState extends State<HomeGallerySubPage> {
  // @override
  // Widget build(BuildContext context) {

  //   return FutureBuilder
  //   (
  //     future: _loadImagePaths(context),
  //     builder: (BuildContext context,AsyncSnapshot<List<String>> imagePathsSnapshot)
  //     {
  //       if(imagePathsSnapshot.connectionState==ConnectionState.done && 
  //       imagePathsSnapshot.hasData)
  //       {
  //         return _buildContent(imagePathsSnapshot.data);
  //       }
  //       return Center(child: CircularProgressIndicator());
  //     },
      
  //   );
  // }

// Build Method for CustomScrollView with Slivers(SliverGrid)
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
          return CustomScrollView(
            slivers:<Widget>
            [ 
              SliverPadding
              (
                padding:const EdgeInsets.all(10), 
                sliver: _buildContent(imagePathsSnapshot.data)
              )
            ]
            );
        }
        return Center(child: CircularProgressIndicator());
      },
      
    );
  }


SliverGrid _buildContent(List<String>imagePaths)
  {
     return SliverGrid 
     (
       
       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
       (
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
       ),
       delegate: SliverChildBuilderDelegate
       (
         (BuildContext context,int index)
         {
           return HomeGalleryImageWidget
           (
             imagePath: imagePaths[index],
             onImageTap: ()=> Navigator.push
             (
               context, 
               _createGalleryDetailRoute(imagePaths,index)
             ),
           );
         },
         childCount:imagePaths.length,
       ),
      
     );
  }

   MaterialPageRoute _createGalleryDetailRoute(List<String> imagePaths,int index)
   {
       return MaterialPageRoute
       (
         builder: (context) => HomeGalleryDetailPage
         (
           imagePaths: imagePaths,
           currentIndex: index,
         )
       );
   }

  // GridView _buildContent(List<String>imagePaths)
  // {
  //    return GridView.custom  
  //    (
       
  //      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
  //      (
  //         maxCrossAxisExtent: 150,
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //      ),
  //      padding: const EdgeInsets.all(10.0),
  //      childrenDelegate: SliverChildBuilderDelegate
  //      (
  //        (BuildContext context,int index)
  //        {
  //          return _buildImageWidget(imagePaths[index]);
  //        },
  //        childCount:imagePaths.length,
  //      ),
      
  //    );
  // }

  //   GridView _buildContent(List<String>imagePaths)
  // {
  //    return GridView.custom  
  //    (
       
  //      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
  //      (
  //         maxCrossAxisExtent: 150,
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //      ),
  //      padding: const EdgeInsets.all(10.0),
  //      childrenDelegate: SliverChildListDelegate
  //      (
  //        imagePaths
  //                .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
  //                .toList()
  //      ),
      
  //    );
  // }

//  GridView _buildContent(List<String>imagePaths)
//   {
//      return GridView.builder 
//      (
//        itemCount:imagePaths.length ,
//        itemBuilder: (BuildContext context,int index)
//        {
//          return _buildImageWidget(imagePaths[index]);
//        },
//        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
//        (
//           maxCrossAxisExtent: 150,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//        ),
//        padding: const EdgeInsets.all(10.0),
      
//      );
//   }

  //  GridView _buildContent(List<String>imagePaths)
  // {
  //    return GridView
  //    (
  //      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
  //      (
  //         crossAxisCount: 3,
  //         //maxCrossAxisExtent: 150,
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //      ),
  //      padding: const EdgeInsets.all(10.0),
  //      //It is List of Image paths
  //      children: imagePaths
  //                .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
  //                .toList()
  //    );
  // }
   

  // GridView _buildContent(List<String>imagePaths)
  // {
  //    return GridView
  //    (
  //      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent
  //      (
  //         maxCrossAxisExtent: 150,
  //         mainAxisSpacing: 10,
  //         crossAxisSpacing: 10,
  //      ),
  //      padding: const EdgeInsets.all(10.0),
  //      //It is List of Image paths
  //      children: imagePaths
  //                .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
  //                .toList()
  //    );
  // }
  

 /*  
   // It will change the size of the items according to space and rotation
   GridView _buildContent(List<String>imagePaths)
  {
     return GridView.extent
     (
       maxCrossAxisExtent: 150,
       //scrollDirection: Axis.horizontal,
       //crossAxisCount: 3,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
       padding: const EdgeInsets.all(10.0),
       //It is List of Image paths
       children: imagePaths
                 .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
                 .toList()
     );
  }
  */
/*
// It is Simple grid view
  GridView _buildContent(List<String>imagePaths)
  {
     return GridView.count
     (
       //scrollDirection: Axis.horizontal,
       crossAxisCount: 3,
       mainAxisSpacing: 10,
       crossAxisSpacing: 10,
       padding: const EdgeInsets.all(10.0),
       //It is List of Image paths
       children: imagePaths
                 .map<Widget>((String imagePath) =>_buildImageWidget(imagePath))
                 .toList()
     );
  }
  */ 
   Future<List<String>> _loadImagePaths(BuildContext context) async {
    final String manifestContentJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContentJson);

    return manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();
  }
  
}