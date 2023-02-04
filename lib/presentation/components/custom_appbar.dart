import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.showLogout,
    this.isLoading = false,
    this.showUrl = false,
    this.url,
    this.onClick,
  });

  final String title;
  final Uri? url;
  final bool showLogout;
  final VoidCallback? onClick;
  final bool isLoading;
  final bool showUrl;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  if (showUrl)
                    InkWell(
                      onTap: () async => await launchUrl(url!),
                      child: Text(
                        'Github Profile',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.blue),
                      ),
                    ),
                ],
              ),
            ),
            if (showLogout)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: isLoading ? null : onClick,
                child: isLoading
                    ? const SizedBox(
                        height: 23,
                        width: 23,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Text(
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
