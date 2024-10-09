import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter_application_1/DesignSystem/shared/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int actualIndex = 3;

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
        titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 30,
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
  return Column(
    children: [
      const ListTile(
          leading: CircleAvatar(
            radius: 35.0,
            backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
          ),
          title: Text(
            'Amanda Doe',
            style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
          subtitle: Text(
            'amanda@gmail.com',
            style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
        ),

      const SizedBox(height: 10,),

      _buildFunctionItem("Edit name"),
      _buildFunctionItem("Shipping Info"),
      _buildFunctionItem("Notification"),
      _buildFunctionItem("Terms E Condition"),

      const SizedBox(height: 10,),

      _buildLogoutButton()

    ],
  );
}

Widget _buildFunctionItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: paragraph1Regular),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }

Widget _buildLogoutButton () {
  return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LinkedLabel.instantiate(
              viewModel: LinkedLabelViewModel(
                fullText: "logout",
                linkedText: "logout",
                onLinkTap: () {
                  
                },
              ),
            ),
          ],
        ),
      );
}