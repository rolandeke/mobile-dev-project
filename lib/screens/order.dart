import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:interview/screens/Confirmation.dart';
import 'package:interview/screens/order.dart';

Map mapResponse = {};
List dataResponse = [];

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Future apicall() async {
    http.Response response;

    response = await http.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));

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
        body: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text('Place Order'),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) {
            //     return DropdownButton(
            //         items: dataResponse[index]['strCategory'],
            //         icon: const Icon(Icons.keyboard_arrow_down),
            //         onChanged: (String? newValue) {
            //           setState(() {
            //             dataResponse[index]['strCategory'][0] = newValue!;
            //           });
            //         });
            //   },
            //   itemCount: dataResponse == null ? 0 : dataResponse.length,
            // ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text('Address'),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    fillColor: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text('Phone Number'),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    fillColor: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text('Deliver Note'),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    fillColor: Colors.blue),
              ),
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
                    'Confirm Order',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    
                    
                  ),
                 
                )
                ),
          ],
        ));
  }
}
