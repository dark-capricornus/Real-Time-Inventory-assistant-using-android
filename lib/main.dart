import 'package:flutter/material.dart';
import 'package:inventory_manager/BillSummarySection.dart';
import 'package:inventory_manager/settings_screen.dart';
import 'Masters.dart';
import 'inventory_status.dart';
import 'account_tracker.dart';
// Import the BillSection file
import 'orders.dart';
import 'purchase_orders.dart';
import 'marketAnalysis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory Manager Dashboard')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Yuvan Shankar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'mckenzie@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.dashboard, 'Dashboard', () {
              Navigator.pop(context);
              setState(() {});
            }),
            _buildDrawerItem(Icons.list, 'Masters', () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Masters()));
            }),
            _buildDrawerItem(Icons.inventory_2, 'Inventory Status', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InventoryStatus()));
            }),
            _buildDrawerItem(Icons.track_changes, 'Account Tracker', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountTracker()));
            }),
            _buildDrawerItem(Icons.receipt, 'Bill Section', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BillSummarySection()));
            }),
            _buildDrawerItem(Icons.shopping_cart, 'Orders', () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Orders()));
            }),
            _buildDrawerItem(Icons.shopping_bag, 'Purchase Orders', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PurchaseOrders()));
            }),
            _buildDrawerItem(Icons.settings, 'Settings', () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            }),
          ],
        ),
      ),
      body: _buildFullScreenDashboard(),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildFullScreenDashboard() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              _buildDashboardCard("Sales", Icons.attach_money, Colors.blue),
              _buildDashboardCard(
                  "Collection", Icons.account_balance, Colors.green),
              _buildDashboardCard(
                  "Stock Status", Icons.inventory, Colors.orange),
              _buildDashboardCard("Expense", Icons.money_off, Colors.red),
            ],
          ),
        ),
        _buildMarketAnalysisButton(),
      ],
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          print("Tapped on $title card");
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarketAnalysisButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarketAnalysis()),
          );
        },
        child: Center(
          child: Text(
            'Market Analysis',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
