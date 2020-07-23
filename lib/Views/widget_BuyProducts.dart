import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_tech_app1/Services_or_Utility/crudOperationsFile1.dart';
import 'package:health_tech_app1/models/model_productData.dart';

class BuyProduct extends StatefulWidget {
  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {


 Stream productData;
 //Product product = new Product();

@override
void initState()
{
   
   CrudOperationMethods().getCarData().then((value)
   {
         setState(() 
         {
             productData = value;  
         });
   });
  
  //  print(product.price);
  //  print(product.company);

   super.initState();
}


//  Product getProductModelFromDataSnapshot(DocumentSnapshot productData)
//   {
//      //Product product = new Product();
     
//       product.model= productData.data['Model_No'];
//       product.price = productData.data['price'];
//       product.company = productData.data['company'];
     
//       return product;
//   }


   _logOut()
   {
      FirebaseAuth.instance.signOut().then((value)
                                      {
                                        Navigator.of(context).pushReplacementNamed('/landingPage');
                                      })
                                     .catchError((e)
                                     {
                                       print(e);
                                     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Buy Product'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>
        [
        IconButton
         (
           
           icon: Icon(Icons.settings_power,), 
           onPressed: () => _logOut()
         )
        ],
      ),
      body: ListView
       (
        scrollDirection: Axis.vertical,
        children: <Widget>
        [
          SizedBox(height:10.0),
          CarProducts(),
          //SizedBox(height:20.0),
          //RecommendedApps()
        ],
      ),
    );
  }

  Widget CarProducts()
  {
      return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('Car'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: carsRecommendedContainer(),
          ),
        ],
      ),
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
          ),
          Text(
            'MORE',
            style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18.0),
          ),
        ],
      ),
    );
  }


 Widget imageSection(String imageVal, String priceVal,String companyVal) {
    return Container
    (
      width: 90.0,
      height: 150.0,
      margin: EdgeInsets.only(right:15.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new NetworkImage(imageVal),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            priceVal,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            companyVal,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          // Row(children: <Widget>[
          //   Text(
          //   companyVal,
          //   style: TextStyle(
          //       color: Colors.black, fontWeight: FontWeight.bold,),
          // ),
          // Icon(FontAwesomeIcons.solidStar,size: 10.0,),
          // ],)
        ],
      ),
    );
  }

  Widget carsRecommendedContainer()
  {
    if(productData!=null)
    {
       return StreamBuilder
       (
         stream: productData,
         builder: (context,snapshot)
         {
           return snapshot.data == null ? 
           Center(child: CircularProgressIndicator()):
           Container
           (
              height: 160.0,
             child: ListView.builder
             (
               scrollDirection: Axis.horizontal,
               itemCount: snapshot.data.documents.length,
               itemBuilder: (context,index)
               {
                return imageSection
                  (
                   snapshot.data.documents[index].data['image'],
                   snapshot.data.documents[index].data['price'],
                   snapshot.data.documents[index].data['company']
                  );
                
               }
             ),
           );
         }
       );
    }
  }

  
}