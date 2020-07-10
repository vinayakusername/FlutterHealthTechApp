import 'package:flutter/material.dart';

class HomeGalleryImageWidget extends StatelessWidget {

  final String imagePath;
  final VoidCallback onImageTap;

  HomeGalleryImageWidget({@required this.imagePath, @required this.onImageTap});

  @override
  Widget build(BuildContext context) {
    
     return Container(
       decoration: BoxDecoration
       (
         boxShadow: 
         [
           BoxShadow
           (
             color: Colors.black,
             offset: Offset(2,2),
             spreadRadius: 2,
             blurRadius: 5
           )
         ],
         borderRadius: BorderRadius.all(Radius.circular(10))
       ),
       child: ClipRRect
       (
         borderRadius: BorderRadius.all(Radius.circular(10)),
         child: Material
         (
           color: Colors.transparent,
           child: Ink.image
           (
             image: AssetImage(imagePath),
             fit: BoxFit.cover,
             child: InkWell
             (
               onTap: (onImageTap),
             ),
           ),
         ),
        
       ),
     );
  }
}