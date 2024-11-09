import 'package:flutter/material.dart';

class InventoryStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventory Status")),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text("Overall status"),
              subtitle: Text("View overall inventory status"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OverallStatus()),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.category),
              title: Text("Low Stock"),
              subtitle: Text("Manage low stock items"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LowStock()),
              ),
              trailing: Icon(Icons.warning,
                  color: Colors.red), // Warning icon for indication
            ),
          ),
        ],
      ),
    );
  }
}

// Define OverallStatus screen
class OverallStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Overall Status")),
      body: Center(child: Text("You will manage overall status here")),
    );
  }
}

// Define LowStock screen
class LowStock extends StatelessWidget {
  // Sample inventory data with low stock indication
  final List<Map<String, dynamic>> inventoryData = [
    {"name": "Product A", "stock": 10},
    {"name": "Product B", "stock": 3}, // Low stock
    {"name": "Product C", "stock": 0}, // Out of stock
    {"name": "Product D", "stock": 7},
    {"name": "Product E", "stock": 1}, // Low stock
  ];

  // Threshold for low stock indication
  final int lowStockThreshold = 5;

  @override
  Widget build(BuildContext context) {
    // Filter items with low stock
    final lowStockItems = inventoryData
        .where((item) => item['stock'] <= lowStockThreshold)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Low Stock")),
      body: ListView.builder(
        itemCount: inventoryData.length,
        itemBuilder: (context, index) {
          final item = inventoryData[index];
          bool isLowStock = item['stock'] <= lowStockThreshold;

          return Card(
            color: isLowStock
                ? Colors.red.shade50
                : Colors.white, // Red background for low stock items
            child: ListTile(
              leading: Icon(Icons.category,
                  color: isLowStock ? Colors.red : Colors.grey),
              title: Text(item["name"]),
              subtitle: Text("Stock: ${item["stock"]}"),
              trailing:
                  isLowStock ? Icon(Icons.warning, color: Colors.red) : null,
            ),
          );
        },
      ),
      floatingActionButton: lowStockItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                // Show an alert or navigate to the specific low stock items if needed
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Low Stock Alert"),
                    content: Text("Some items have low stock. Please check!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              label: Text("Low Stock Alert"),
              icon: Icon(Icons.warning),
              backgroundColor: Colors.red,
            )
          : null,
    );
  }
}
