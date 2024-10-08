import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';

class ProfileScreen extends StatefulWidget {
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(child: Text('Home Page')),
      const Center(child: Text('Messages Page')),
      const Center(child: Text('Label Page')),
      _buildProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: pages[actualIndex],
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}


Widget _buildProfilePage(){
  return const Column(
    children: [
      ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
          ),
          title: Text('Amanda Doe'),
          subtitle: Text('amanda@gmail.com'),
        ),
    ],
  );
}