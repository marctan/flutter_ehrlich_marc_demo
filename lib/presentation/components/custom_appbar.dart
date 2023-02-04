import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.showLogout,
    this.onClick,
  });

  final String title;
  final bool showLogout;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/weather_logo.png',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            if (showLogout)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: onClick,
                child: Text(
                  Label.logout,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
          ],
        ),
        const Divider(
          thickness: 0.9,
          color: Colors.black,
          height: 1,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
