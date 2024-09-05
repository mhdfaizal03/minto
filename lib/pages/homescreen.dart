import 'package:flutter/material.dart';
import 'package:minto/constands/constands.dart';
import 'package:minto/pages/inner_screen.dart';

import '../models/item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TableModel> tables = [
    TableModel(id: '1', name: 'Table 1', isOccupied: false),
    TableModel(id: '2', name: 'Table 2', isOccupied: true),
    TableModel(id: '3', name: 'Table 3', isOccupied: false),
    TableModel(id: '4', name: 'Table 3', isOccupied: false),
    TableModel(id: '5', name: 'Table 4', isOccupied: true),
    TableModel(id: '6', name: 'Table 5', isOccupied: false),
    TableModel(id: '7', name: 'Table 6', isOccupied: true),
    TableModel(id: '8', name: 'Table 6', isOccupied: true),
    TableModel(id: '9', name: 'Table 7', isOccupied: false),
    TableModel(id: '10', name: 'Table 8', isOccupied: false),
    TableModel(id: '11', name: 'Table 9', isOccupied: false),
    TableModel(id: '12', name: 'Table 10', isOccupied: false),
    TableModel(id: '13', name: 'Table 11', isOccupied: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Select your table'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: tables.length,
        itemBuilder: (context, index) {
          final table = tables[index];
          return GestureDetector(
            onTap: () {
              if (!table.isOccupied) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InnerScreen(table: table),
                  ),
                );
              } else {
                message(context,
                    message: 'this table is occupied!', color: Colors.red);
              }
            },
            child: Card(
              color: table.isOccupied ? Colors.red[500] : Colors.green[500],
              elevation: 4.0,
              child: Center(
                child: Text(
                  table.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
