import 'package:flutter/material.dart';

class PurchaseOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Purchase Orders")),
      body: Center(
          child: Text(
              "Create and track purchase orders for inventory restocking")),
    );
  }
}
