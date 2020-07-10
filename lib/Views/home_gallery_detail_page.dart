import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/components/home_gallery_image_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
class HomeGalleryDetailPage extends StatefulWidget {

   final List<String> imagePaths;
   final int currentIndex;
   
   HomeGalleryDetailPage({@required this.imagePaths, @required this.currentIndex});

  @override
  _HomeGalleryDetailPageState createState() => _HomeGalleryDetailPageState();
}

class _HomeGalleryDetailPageState extends State<HomeGalleryDetailPage> {

  int _currentIndex;
  PageController _pageController;

  @override
  void initState()
  {
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage:_currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold
    (
      appBar: AppBar(backgroundColor: Colors.pink,),
      body: _buildContent(),  
    );
    
  }
      
  Widget _buildContent() 
  {
    return Stack
    (
      children:<Widget>
      [
         _buildPhotoViewGallery(),
         _buildIndicator()
      ]
    );
  }
  
  Widget _buildIndicator()
  {
    return Positioned
    (
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      //child: _buildDottedIndicator()
      child: _buildImageCarouselSlider()
    );
  }
  
   Widget _buildImageCarouselSlider()
   {
     return CarouselSlider.builder
     (
       itemCount: widget.imagePaths.length, 
       itemBuilder: (BuildContext context,index)
       {
         return HomeGalleryImageWidget
         (
           imagePath: widget.imagePaths[index], 
           onImageTap: ()=>_pageController.jumpToPage(index)
         );
       },
       height: 100,
       viewportFraction: 0.21,
       enlargeCenterPage: true,
       initialPage: _currentIndex,
     );
   }


   Row _buildDottedIndicator()
   {
     return  Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imagePaths.map<Widget>((String imagePath)=>_buildDot(imagePath)).toList()
      );
   }


  Container _buildDot(String imagePath)
  {
    return Container
      (
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 2.0),
        color: Colors.pink,
        decoration: BoxDecoration
        (
          shape: BoxShape.circle,
          color: _currentIndex == widget.imagePaths.indexOf(imagePath) ? Colors.white : Colors.grey.shade700
        ),
      );
  }

  PhotoViewGallery _buildPhotoViewGallery()
  {
     return PhotoViewGallery.builder
     (
      //To load dynamic images after scroll
       itemCount: widget.imagePaths.length,
       builder: (BuildContext ontext,int index)
       {
         return PhotoViewGalleryPageOptions
         (
           imageProvider: AssetImage(widget.imagePaths[index]),
           minScale: PhotoViewComputedScale.contained * 0.8,
           maxScale: PhotoViewComputedScale.covered * 1.8,
         );
       }, 
      
       enableRotation: true,
       scrollPhysics: const BouncingScrollPhysics(),
       //scrollDirection: Axis.vertical,
       pageController: _pageController,
       //To load images from internet
       loadingBuilder: (BuildContext context,ImageChunkEvent event)
       {
         return Center(child: CircularProgressIndicator());
       },
       onPageChanged: (index)
       {
            setState(() 
            {
              _currentIndex = index;  
            });
       },
     );


    //  return PhotoView
    //  (
    //    // It is used to provider image from assets
    //    imageProvider: AssetImage( widget.imagePaths[widget.currentIndex]),
    //    //It is mini scale to shrink the image
    //    minScale: PhotoViewComputedScale.contained * 0.8,
    //    //It is used to provide max zoom out to the image
    //    maxScale: PhotoViewComputedScale.covered * 1.8,
    //    //this attribute is used to rotate the image
    //    enableRotation: true,
    //    backgroundDecoration: BoxDecoration(color:Colors.red),
    //  );
  }
}