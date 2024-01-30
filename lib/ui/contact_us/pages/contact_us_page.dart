import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const TopAppBarWidget(
          title: 'Contact Us',
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            const AppListTile(
              leadingSvg: SvgPath.message,
              title: 'Send a message',
              subtitle: 'Write to us and we will get back to you',
            ),
            const AppListTile(
              leadingSvg: SvgPath.chat,
              title: 'Live chat',
              subtitle: 'Chat with our friendly team',
            ),
            const AppListTile(
              leadingSvg: SvgPath.conversation,
              title: 'FAQ’s',
              subtitle: "Help yourself with already answered question",
            ),
            const AppListTile(
              leadingSvg: SvgPath.review,
              title: 'Review',
              subtitle: 'Tell us about your experience',
            ),
            const AppListTile(
              leadingSvg: SvgPath.phone,
              title: '0903 -113-287',
              subtitle: 'We are available to speak with  you',
            ),
            const Spacer(
              flex: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Connect with Us on Social Media',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 6),
                  const Row(
                    children: [
                      SvgWidget(
                        svgPath: SvgPath.youtube,
                      ),
                      SizedBox(width: 16),
                      SvgWidget(
                        svgPath: SvgPath.instagram,
                      ),
                      SizedBox(width: 16),
                      SvgWidget(
                        svgPath: SvgPath.facebook,
                      ),
                      SizedBox(width: 16),
                      SvgWidget(
                        svgPath: SvgPath.whatsapp,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
