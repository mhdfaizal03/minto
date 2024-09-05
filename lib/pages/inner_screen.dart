// lib/screens/order_screen.dart
import 'package:flutter/material.dart';
import 'package:minto/constands/constands.dart';
import 'package:minto/models/item_model.dart';

class InnerScreen extends StatefulWidget {
  final TableModel table;

  InnerScreen({required this.table});

  @override
  _InnerScreenState createState() => _InnerScreenState();
}

class _InnerScreenState extends State<InnerScreen> {
  final List<MenuModel> menuItems = [
    MenuModel(id: '1', name: 'Pizza', price: 350),
    MenuModel(id: '2', name: 'Burger', price: 60),
    MenuModel(id: '3', name: 'Pasta', price: 99),
    MenuModel(id: '4', name: 'Noodles', price: 110),
    MenuModel(id: '5', name: 'Shawarma', price: 110),
    MenuModel(id: '6', name: 'Chicken Biriyani', price: 150),
  ];

  final List<MenuModel> _selectedItems = [];

  void _addItem(MenuModel item) {
    setState(() {
      _selectedItems.add(item);
    });
  }

  void _placeOrder() {
    if (_selectedItems.isEmpty) {
      message(context,
          message: 'please select items from the menu', color: Colors.red);
    } else {
      message(context,
          message: 'Order placed for ${widget.table.name}',
          color: Colors.green);
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(widget.table.name),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: ActionButton(
                        onpressed: () => _addItem(item), actionTitle: 'Add'));
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: ActionButton(
                onpressed: _selectedItems.isEmpty ? _placeOrder : _goTo,
                actionTitle: 'Continue',
              )),
        ],
      ),
    );
  }

  Future _goTo() async {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Confirm your order:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Expanded(
                  child: _selectedItems.isEmpty
                      ? Center(
                          child: Text('no items selected'),
                        )
                      : ListView.builder(
                          itemCount: _selectedItems.length,
                          itemBuilder: (context, index) {
                            final item = _selectedItems[index];
                            return ListTile(
                              title: Text(item.name),
                              subtitle:
                                  Text('\Rs.${item.price.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedItems.remove(item);
                                    });
                                  },
                                  icon: Icon(Icons.delete)),
                            );
                          },
                        ),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ActionButton(
                      onpressed: _placeOrder,
                      actionTitle: 'Place order',
                    )),
              ],
            ),
          );
        });
  }
}
