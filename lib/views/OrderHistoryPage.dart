import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderHistoryPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {"orderNumber": "ORD123", "date": "2025-01-10", "status": "Delivered"},
    {"orderNumber": "ORD124", "date": "2025-01-15", "status": "Pending"},
    {"orderNumber": "ORD125", "date": "2025-01-20", "status": "Cancelled"},
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            contentPadding: EdgeInsets.all(16),
            title: Text('Order #${order['orderNumber']}'),
            subtitle: Text('Date: ${order['date']}'),
            trailing: Chip(
              label: Text(order['status'] ?? 'N/A'),
              backgroundColor: _getStatusColor(order['status']),
            ),
            onTap: () {
              // You can navigate to a detailed order page if needed
            },
          ),
        );
      },
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case "Delivered":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
