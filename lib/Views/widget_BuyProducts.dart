import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Services_or_Utility/crudOperationsFile1.dart';
import 'package:health_tech_app1/models/model_productData.dart';

class BuyProduct extends StatefulWidget {
  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {


 Stream productData;
 Product product = new Product();

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
  
   print(product.price);
   print(product.company);

   super.initState();
}


 Product getProductModelFromDataSnapshot(DocumentSnapshot productData)
  {
     //Product product = new Product();
     
      product.model= productData.data['Model_No'];
      product.price = productData.data['price'];
      product.company = productData.data['company'];
     
      return product;
  }


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
      body: _scrollContainerList(),  
    );
  }

  Widget _scrollContainerList()
  {
      return SingleChildScrollView
      (
        child: Column
        (
          children: <Widget>
          [
            Container
            (
              padding: const EdgeInsets.all(10.0),
              child: Text('Cars'),
            ),
            SizedBox(height:5.0),
            _buildCarList()

          ],
        ),
      );
  }

  Widget _buildCarList()
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
           ListView.builder
           (
             scrollDirection: Axis.horizontal,
             itemCount: snapshot.data.documents.length,
             itemBuilder: (context,index)
             {
               return _buildCard
               (
                 getProductModelFromDataSnapshot(snapshot.data.documents[index])
               );
             }
           );
         }
       );
    }
  }

  Widget _buildCard(Product productModel)
  {
      return Container
      (
        width: 200,
        height: 200,
       child: Card(
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0),
         ),
        color: Colors.pink,
        elevation: 10,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>
        [
          Text(
                productModel.model  ,
                style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
              ),
            SizedBox(height: 5,),
            Text(
                 productModel.price,
                 style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                ),
            SizedBox(height: 5,),
            Text(
                  productModel.company,
                  style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                )
        ],
      ),
    ),
      );
  }
}