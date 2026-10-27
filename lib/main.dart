import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Food {
  final String name, price, description;
  final IconData icon;
  const Food(this.name, this.price, this.description, this.icon);
}

const foods = [
  Food('Nasi Lemak', 'RM 8.00', 'Coconut rice with sambal, egg, anchovies and peanuts.', Icons.rice_bowl),
  Food('Chicken Burger', 'RM 12.00', 'Grilled chicken patty with lettuce, cheese and sauce.', Icons.lunch_dining),
  Food('Teh Tarik', 'RM 3.50', 'Frothy pulled milk tea, served hot or cold.', Icons.local_cafe),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Menu')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          for (final f in foods)
            Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(f.icon, size: 40),
                title: Text(f.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(f.price),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(food: f)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(food.icon, size: 120)),
            const SizedBox(height: 24),
            Text(food.name, style: Theme.of(context).textTheme.headlineMedium),
            Text(food.price, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text(food.description),
          ],
        ),
      ),
    );
  }
}
