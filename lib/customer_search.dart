import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//import 'package:hisab_khata/SearchItems.dart';

import 'db.dart';

List<Customer> customerDetails = [] ;

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
      var customer =  customerData.values.toList();
      customerDetails= new List<Customer>.from(customer);;
      print(customerDetails.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search Customer")),
        backgroundColor: Color.fromARGB(255, 11, 168, 230),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: StudentSearch());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 11, 168, 230),
        child: ListView(
          children: [
            DrawerHeader(
              child: (Container(
                child: const Center(
                  child: Text(
                    'Hisab Rakhi',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                //color: Color.fromARGB(255, 7, 145, 214),
              )),
            ),
            Divider(
              thickness: 4.0,
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.person),
              title: const Text(
                'Customer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.report),
              title: const Text(
                'Report',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(Icons.settings),
              title: const Text(
                'Setting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        label: const Text('ADD'),
        icon: const Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 11, 168, 230),
      ),
    );
  }
}

class StudentSearch extends SearchDelegate<Customer> {
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
                            "Due Blance : ${(listItems[index].dueBalance.toString())}"),
                        onTap: () {
                          showResults(context);
                        },
                      ),
                      Divider(),
                    ],
                  ));
            });
  }
}
