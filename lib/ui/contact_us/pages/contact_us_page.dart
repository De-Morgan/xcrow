import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaddedContainer(
        horizontalPadding: 16,
        child: Scaffold(
          appBar: TopAppBarWidget(
            title: 'Contact Us',
          ),
          body: Column(
            children: [
              const SizedBox(height: 8),
              AppListTile(
                leadingSvg: SvgPath.message,
                title: 'Send a message',
                subtitle: 'Write to us and we will get back to you',
              ),
              AppListTile(
                leadingSvg: SvgPath.chat,
                title: 'Live chat',
                subtitle: 'Chat with our friendly team',
              ),
              AppListTile(
                leadingSvg: SvgPath.conversation,
                title: 'FAQ’s',
                subtitle: "Help yourself with already answered question",
              ),
              AppListTile(
                leadingSvg: SvgPath.review,
                title: 'Review',
                subtitle: 'Tell us about your experience',
              ),
              AppListTile(
                leadingSvg: SvgPath.phone,
                title: '0903 -113-287',
                subtitle: 'We are available to speak with  you',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
