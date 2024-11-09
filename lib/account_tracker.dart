import 'package:flutter/material.dart';

class AccountTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account Tracker")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.shopping_cart), // Icon for Spot Sales
            title: Text("Spot Sales"),
            subtitle: Text("Manage spot sales data"),
            onTap: () =>
                _navigateWithAnimation(context, SpotSales(), "slideRight"),
          ),
          ListTile(
            leading: Icon(Icons.credit_card), // Icon for Credit
            title: Text("Credit"),
            subtitle: Text("Manage credit data"),
            onTap: () => _navigateWithAnimation(context, Credit(), "slideUp"),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet), // Icon for Collection
            title: Text("Collection"),
            subtitle: Text("Manage collection data"),
            onTap: () => _navigateWithAnimation(context, Collection(), "fade"),
          ),
          ListTile(
            leading: Icon(Icons.book), // Icon for Ledger
            title: Text("Ledger"),
            subtitle: Text("Manage ledger data"),
            onTap: () => _navigateWithAnimation(context, Ledger(), "slideLeft"),
          ),
        ],
      ),
    );
  }

  // Custom function for animated navigation with different animations
  void _navigateWithAnimation(
      BuildContext context, Widget page, String animationType) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (animationType) {
            case "slideRight":
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut)),
                child: child,
              );
            case "slideUp":
              return SlideTransition(
                position: Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut)),
                child: child,
              );
            case "fade":
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            case "slideLeft":
              return SlideTransition(
                position: Tween(begin: Offset(-1.0, 0.0), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: animation, curve: Curves.easeInOut)),
                child: child,
              );
            default:
              return child;
          }
        },
      ),
    );
  }
}

// Subsection screens with sample data

class SpotSales extends StatelessWidget {
  final List<Map<String, String>> salesData = [
    {"item": "Laptop", "amount": "\$1200", "date": "2024-01-15"},
    {"item": "Smartphone", "amount": "\$800", "date": "2024-01-14"},
    {"item": "Headphones", "amount": "\$150", "date": "2024-01-13"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Spot Sales")),
      body: ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.blue),
            title: Text(salesData[index]["item"]!),
            subtitle: Text("Amount: ${salesData[index]["amount"]!}"),
            trailing: Text(salesData[index]["date"]!),
          );
        },
      ),
    );
  }
}

class Credit extends StatelessWidget {
  final List<Map<String, String>> creditData = [
    {"customer": "John Doe", "creditAmount": "\$500", "dueDate": "2024-02-15"},
    {
      "customer": "Jane Smith",
      "creditAmount": "\$300",
      "dueDate": "2024-02-10"
    },
    {
      "customer": "Mike Johnson",
      "creditAmount": "\$100",
      "dueDate": "2024-01-25"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Credit")),
      body: ListView.builder(
        itemCount: creditData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.credit_card, color: Colors.green),
            title: Text(creditData[index]["customer"]!),
            subtitle:
                Text("Credit Amount: ${creditData[index]["creditAmount"]!}"),
            trailing: Text("Due: ${creditData[index]["dueDate"]!}"),
          );
        },
      ),
    );
  }
}

class Collection extends StatelessWidget {
  final List<Map<String, String>> collectionData = [
    {"collectionDate": "2024-01-20", "amountCollected": "\$2000"},
    {"collectionDate": "2024-01-15", "amountCollected": "\$1500"},
    {"collectionDate": "2024-01-10", "amountCollected": "\$1000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collection")),
      body: ListView.builder(
        itemCount: collectionData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.purple),
            title: Text("Date: ${collectionData[index]["collectionDate"]!}"),
            subtitle: Text(
                "Amount Collected: ${collectionData[index]["amountCollected"]!}"),
          );
        },
      ),
    );
  }
}

class Ledger extends StatelessWidget {
  final List<Map<String, String>> ledgerData = [
    {"entry": "Opening Balance", "amount": "\$5000", "date": "2024-01-01"},
    {"entry": "Sales Entry", "amount": "\$1500", "date": "2024-01-10"},
    {"entry": "Purchase Entry", "amount": "-\$1000", "date": "2024-01-15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ledger")),
      body: ListView.builder(
        itemCount: ledgerData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.book, color: Colors.orange),
            title: Text(ledgerData[index]["entry"]!),
            subtitle: Text("Amount: ${ledgerData[index]["amount"]!}"),
            trailing: Text(ledgerData[index]["date"]!),
          );
        },
      ),
    );
  }
}
