import 'package:flutter/material.dart';

class MarketAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market Analysis")),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.show_chart, color: Colors.blue),
              title: Text("Yearly Prediction"),
              subtitle: Text("Analyze yearly trends and forecasts"),
              onTap: () =>
                  _navigateWithAnimation(context, YearlyPredictionScreen()),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.green),
              title: Text("Individual Customer Performance"),
              subtitle:
                  Text("Evaluate individual customer performance metrics"),
              onTap: () =>
                  _navigateWithAnimation(context, CustomerPerformanceScreen()),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.sentiment_satisfied, color: Colors.orange),
              title: Text("Product Satisfaction"),
              subtitle: Text("Analyze product satisfaction and feedback"),
              onTap: () =>
                  _navigateWithAnimation(context, ProductSatisfactionScreen()),
            ),
          ),
        ],
      ),
    );
  }

  // Custom function for animated navigation
  void _navigateWithAnimation(BuildContext context, Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide in from the right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}

// Subsection screens defined within the same file

class YearlyPredictionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yearly Prediction")),
      body: Center(child: Text("Analyze yearly trends and forecasts here")),
    );
  }
}

class CustomerPerformanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Individual Customer Performance")),
      body: Center(
          child: Text("Evaluate individual customer performance metrics here")),
    );
  }
}

class ProductSatisfactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Satisfaction")),
      body:
          Center(child: Text("Analyze product satisfaction and feedback here")),
    );
  }
}
