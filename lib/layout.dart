import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:restaurant_service/screens/orders.dart';
import 'package:restaurant_service/screens/manage.dart';

// A StatefulWidget that provides the main layout structure for the restaurant app
// This widget manages bottom navigation between Orders and Manage screens
// with customizable initial tab selection
class LayoutApp extends StatefulWidget {
  // The initial tab index to display when the app starts
  // Defaults to 0 (Orders tab) if not specified
  final int initialIndex;

  const LayoutApp({super.key, this.initialIndex = 0});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

// State class for the LayoutApp widget
// Handles navigation state and tab switching functionality
class _LayoutAppState extends State<LayoutApp> {
  // Current selected tab index
  // Used to determine which page to display and which nav item is active
  late int _index;

  // List of pages/screens corresponding to each navigation tab
  // Index 0: Orders screen - for managing customer orders
  // Index 1: Manage screen - for managing restaurant data/settings
  final List<Widget> _pages = [
    Orders(), // Orders management screen
    Manage(), // Restaurant management screen
  ];

  // Initialize the widget state with the provided initial index
  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex; // Set starting tab from constructor parameter
  }

  // Builds the main layout with bottom navigation
  // Returns a Scaffold containing the selected page and navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Display the currently selected page based on index
      body: _pages[_index],

      // Bottom navigation bar with two tabs
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index, // Highlight the current tab

        // Handle tab selection changes
        onDestinationSelected: (value) {
          setState(() {
            _index = value; // Update current index and rebuild UI
          });
        },

        // Navigation destinations/tabs
        destinations: [
          // Orders tab - first destination (index 0)
          NavigationDestination(
              // Dynamic icon based on selection state
              icon: Icon(_index == 0
                  ? Iconsax.shopping_bag // Filled icon when selected
                  : Iconsax
                      .shopping_bag_copy), // Outline icon when not selected
              label: 'Orders'),

          // Manage tab - second destination (index 1)
          NavigationDestination(
              // Dynamic icon based on selection state
              icon: Icon(_index == 1
                  ? Iconsax.edit // Filled icon when selected
                  : Iconsax.edit_2), // Outline icon when not selected
              label: 'Manage')
        ],
      ),
    );
  }
}
