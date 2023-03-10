import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/presentation/components/alert_dialog.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.showLogout,
    this.isLoading = false,
    this.showUrl = false,
    this.url,
    this.onClick,
    this.showBottomSpace = true,
    this.showBackButton = false,
  });

  final String title;
  final Uri? url;
  final bool showLogout;
  final VoidCallback? onClick;
  final bool isLoading;
  final bool showUrl;
  final bool showBottomSpace;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (showBackButton)
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                ),
              ),
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
                onPressed: isLoading
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: ((context) => CustomAlertDialog(
                                title: 'Logout?',
                                content: 'Are you sure you want to logout?',
                                onPressed: onClick!,
                              )),
                        );
                      },
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
        if (showBottomSpace)
          const SizedBox(
            height: 30,
          ),
      ],
    );
  }
}
