import 'package:delivery/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

// Simple data model for an order
class Order {
  final String storeName;
  final String storeAddress;
  final String userName;
  final String userAddress;
  final String price;
  final String currency;
  final String userAvatarUrl; // URL for user avatar
  final bool isStoreIconText; // If true, use text, else use icon for store
  final String? storeIconText;
  final IconData? storeIconData;

  Order({
    required this.storeName,
    required this.storeAddress,
    required this.userName,
    required this.userAddress,
    required this.price,
    required this.currency,
    required this.userAvatarUrl,
    this.isStoreIconText = false,
    this.storeIconText,
    this.storeIconData,
  });
}



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // For bottom navigation bar

  // Sample data - replace with actual data source
  final List<Order> _orders = List.generate(
    3, // Create 3 identical orders for demonstration
        (index) => Order(
      storeName: ' store',
      storeAddress: '20th st, Sheikh Zayed, Giza',
      userName: 'Nour mohamed',
      userAddress: '20th st, Sheikh Zayed, Giza',
      price: '3000',
      currency: 'EGP',
      userAvatarUrl: 'https://via.placeholder.com/150/FFC0CB/000000?Text=User', // Placeholder image
      isStoreIconText: true,
      storeIconText: '',
      storeIconData: Icons.local_florist, // Fallback icon if text is not used
    ),
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation to different screens here
    // For now, it just changes the selected tab
  }

  // static const Color ColorManager.primaryColor = Color(0xFFE91E63); // Define your pink color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OrderCard(order: _orders[index], primaryColor: ColorManager.primaryColor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Ensures labels are always visible
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTopBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        ' rider',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: ColorManager.primaryColor,
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final Color primaryColor;

  const OrderCard({super.key, required this.order, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'order',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSectionTitle('Pickup address'),
            const SizedBox(height: 8),
            _buildAddressInfo(
              isStore: true,
              iconWidget: CircleAvatar(
                  radius: 20,
                  backgroundColor: primaryColor.withOpacity(0.15), // Lighter pink for store icon bg
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_florist, size: 16, color: primaryColor),
                      Text(
                        order.storeIconText ?? 'Store',
                        style: TextStyle(fontSize: 6, color: primaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
              ),
              name: order.storeName,
              address: order.storeAddress,
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('User address'),
            const SizedBox(height: 8),
            _buildAddressInfo(
              isStore: false,
              iconWidget: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(order.userAvatarUrl),
                onBackgroundImageError: (_, __) {}, // Handle error if image fails
                child: order.userAvatarUrl.isEmpty
                    ? const Icon(Icons.person, size: 20, color: Colors.grey)
                    : null,
              ),
              name: order.userName,
              address: order.userAddress,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '${order.currency} ${order.price}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Expanded(
                  flex: 2, // Give buttons more space
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle reject
                      print('Order Rejected');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor, side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Reject'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle accept
                      print('Order Accepted');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Accept'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
    );
  }

  Widget _buildAddressInfo({
    required Widget iconWidget,
    required String name,
    required String address,
    required bool isStore,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            )
          ]
      ),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        address,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}