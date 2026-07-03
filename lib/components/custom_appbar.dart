import 'package:flutter/material.dart';
import 'package:quiz_in_2/routes/app_routes.dart';

class CustomAppbar extends StatelessWidget {
  final String userName;
  final String imagePath;
  final VoidCallback onLogout;

  const CustomAppbar({
    super.key,
    required this.userName,
    required this.imagePath,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset('assets/logo.png'),
            ),
          ),
      
          Column(
            children: [
              Text(userName),
              TextButton(
                onPressed: onLogout,
                child: const Text('Logout'),
              ),
            ],
          ),
      
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
          ),
        ],
      ),
    );
  }
}