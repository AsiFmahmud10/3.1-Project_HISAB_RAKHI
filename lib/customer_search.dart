import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hisab_khata/drawer.dart';
import 'package:hive/hive.dart';
import 'package:hisab_khata/home.dart';

import 'db.dart';

List<Customer> customerDetails = [];

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  late var customerData = Hive.box('customerData');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //customerData.add(Customer(customerName: "Sehedi", customerPhone: '01721'));

    print('run');
    var customer = customerData.values.toList();
    customerDetails = new List<Customer>.from(customer);

    print(customerDetails.length);

    print('-------');
    //print(customerDetails[12].key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Search Customer")),
          backgroundColor: Colors.blueGrey[800],
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomerSearch());
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        drawer: Draer(),

        body: ListView.builder(
          itemCount: customerDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(
                    //customerDetails.elementAt(index),
                    customerDetails[index].customerName),
                subtitle: Text('Due Balance :'+ customerDetails[index].dueBalance.toString()),
                onTap: () {
                  //showResults(context)
                  /*
                 Navigator.pushReplacementNamed(context, '/customerDetails',
                      arguments: {
                        'customer_id': customerDetails[index].key,
                        'customerName': customerDetails[index].customerName

                        //ModalRoute.of(context)?.settings.arguments;
                      });*/

                  Navigator.pushReplacementNamed(context, '/customerInfo',
                      arguments: {
                        'customer_id': customerDetails[index].key,
                        'customerName': customerDetails[index].customerName

                        //ModalRoute.of(context)?.settings.arguments;
                      });

                }
                );
            Divider(
              thickness: 30,
              color: Colors.blueGrey,
            );
          },
        )
        );
  }
}

class CustomerSearch extends SearchDelegate<Customer> {
  @override

  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.navigate_before),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listItems = query.isEmpty
        ? customerDetails
        : customerDetails
            .where((element) => element.customerName
                .toLowerCase()
                .startsWith(query.toLowerCase().toString()))
            .toList();

    return listItems.isEmpty
        ? Center(child: Text("No Data Found!"))
        : ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 15.00, right: 15.00),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 40,
                        ),
                        title: Text(listItems[index].customerName),
                        subtitle: Text(
                            "Due Balance : "+ listItems[index].dueBalance.toString()),
                        onTap: () {
                          showResults(context);
                          Navigator.pushReplacementNamed(context, '/addReport',
                              arguments: {
                                'customer_id': listItems[index].key,
                                'customerName': listItems[index].customerName

                                //ModalRoute.of(context)?.settings.arguments;
                              });
                        },
                      ),

                    ],

                  ));
            });
  }
}
