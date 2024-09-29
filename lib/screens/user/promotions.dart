import 'package:flutter/material.dart';

class PromotionsPage extends StatefulWidget {
  @override
  _PromotionsPageState createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  // List to hold promotions
  List<String> promotions = [
    'Boutique - Fashion & Accessories',
    'Bakery - Fresh Baked Goods',
    'Home Foods - Delicious Home-Cooked Meals',
    'Home Tuitions - Personalized Learning',
  ];

  // Method to add a new promotion
  void _addPromotion(String promotion) {
    setState(() {
      promotions.add(promotion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Promotions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // List of promotions
            Expanded(
              child: ListView.builder(
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(promotions[index]),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // You can handle navigation or actions for each promotion here
                      },
                    ),
                  );
                },
              ),
            ),
            // Promote your business button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final newPromotion = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPromotionPage(),
                    ),
                  );

                  // If a new promotion is returned, add it to the list
                  if (newPromotion != null && newPromotion is String) {
                    _addPromotion(newPromotion);
                  }
                },
                child: Text('Promote Your Business'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page to add promotions
class AddPromotionPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Promotion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Promotion Details',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text); // Return the entered promotion
              },
              child: Text('Add Promotion'),
            ),
          ],
        ),
      ),
    );
  }
}