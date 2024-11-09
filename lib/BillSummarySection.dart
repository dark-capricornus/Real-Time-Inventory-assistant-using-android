import 'package:flutter/material.dart';

class BillSummarySection extends StatefulWidget {
  @override
  _BillSummarySectionState createState() => _BillSummarySectionState();
}

class _BillSummarySectionState extends State<BillSummarySection> {
  final TextEditingController nameController = TextEditingController();
  final Map<String, Map<String, double>> categories = {
    'Fruits': {
      'Apple': 10.0,
      'Orange': 8.0,
      'Banana': 5.0,
    },
    'Vegetables': {
      'Tomato': 3.0,
      'Potato': 2.0,
      'Carrot': 4.0,
    },
  };

  List<Map<String, dynamic>> products = [];
  String? selectedCategory;
  String? selectedProduct;

  void addProductEntry() {
    if (selectedCategory != null && selectedProduct != null) {
      setState(() {
        products.add({
          'category': selectedCategory,
          'product': selectedProduct,
          'quantityController': TextEditingController(text: '0'),
        });
        selectedProduct = null;
      });
    }
  }

  double calculateTotalBill() {
    double total = 0.0;
    for (var product in products) {
      String? category = product['category'];
      String? productName = product['product'];
      int quantity = int.tryParse(product['quantityController'].text) ?? 0;
      if (category != null &&
          productName != null &&
          categories[category]![productName] != null) {
        total += categories[category]![productName]! * quantity;
      }
    }
    return total;
  }

  void selectCategory() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView(
        children: categories.keys.map((category) {
          return ListTile(
            title: Text(category),
            onTap: () {
              setState(() {
                selectedCategory = category;
                selectedProduct = null;
              });
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  void selectProduct() {
    if (selectedCategory != null) {
      showModalBottomSheet(
        context: context,
        builder: (context) => ListView(
          children: categories[selectedCategory]!.keys.map((product) {
            return ListTile(
              title: Text(product),
              onTap: () {
                setState(() {
                  selectedProduct = product;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bill Summary Section')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter User Name'),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Select Category'),
              subtitle: Text(selectedCategory ?? 'No category selected'),
              onTap: selectCategory,
              trailing: Icon(Icons.arrow_drop_down),
            ),
            if (selectedCategory != null)
              ListTile(
                title: Text('Select Product'),
                subtitle: Text(selectedProduct ?? 'No product selected'),
                onTap: selectProduct,
                trailing: Icon(Icons.arrow_drop_down),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProductEntry,
              child: Text('Add Product'),
            ),
            for (var i = 0; i < products.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product ${i + 1}'),
                  Text('Category: ${products[i]['category']}'),
                  Text('Product: ${products[i]['product']}'),
                  Row(
                    children: [
                      Text('Quantity:'),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          int quantity = int.tryParse(
                                  products[i]['quantityController'].text) ??
                              0;
                          if (quantity > 0) {
                            setState(() {
                              products[i]['quantityController'].text =
                                  (quantity - 1).toString();
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: 50,
                        child: TextField(
                          controller: products[i]['quantityController'],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          int quantity = int.tryParse(
                                  products[i]['quantityController'].text) ??
                              0;
                          setState(() {
                            products[i]['quantityController'].text =
                                (quantity + 1).toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            SizedBox(height: 20),
            Text('Total Bill: \$${calculateTotalBill().toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
