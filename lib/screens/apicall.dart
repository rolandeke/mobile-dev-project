import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:interview/screens/Confirmation.dart';
import 'package:interview/screens/order.dart';

Map mapResponse = {};
List dataResponse = [];

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  Future apicall() async {
    http.Response response;

    response = await http
        .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        dataResponse = mapResponse["categories"];
      });
    }
  }

  @override
  void initState() {
    apicall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('EAT HEALTHY'),
        actions: const [
          Icon(Icons.notifications),
          Padding(padding: EdgeInsets.only(right: 20.0))
        ],
      ),
      body: mapResponse == null
          ? Container()
          : SingleChildScrollView(
            child: Column(
                children: <Widget>[
                const   SizedBox(
                    height: 20,
                  ),
                 const  Text(
                    'Random Meals',
                    style: TextStyle(),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(children: <Widget>[
                        const    SizedBox(height: 20,),
          
                            Card(
                              child: ListTile(
                                title: Text(dataResponse[index]['strCategory']),
                                leading: Image.network(dataResponse[index]['strCategoryThumb']),
                              ),
                            )
                            ,
                            
                            
                            
                          ]),
                        );
                      },
                      itemCount: dataResponse ==null?0: dataResponse.length,
                    ),
                     Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                   style:  TextButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.teal, disabledForegroundColor: Colors.grey.withOpacity(0.38),
    ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) =>const Order() ));
                  },
                   child:  const Text(
                    'Place Order',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    
                    
                  ),
                 
                )
                ),
                ],
              ),
          ),
    );
  }
}
