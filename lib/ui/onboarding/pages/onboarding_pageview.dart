import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/image_path.dart';

class OnboardingPageView extends HookWidget {
  const OnboardingPageView({super.key});

  static const blackColor = Color(0xff141313);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final pagePosition = useState(0);
    int pageValue() => pagePosition.value;
    void changePagePosition() {
      pagePosition.value = pageController.page?.toInt() ?? 0;
    }

    useEffect(() {
      pageController.addListener(changePagePosition);
      return () => pageController.removeListener(changePagePosition);
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              _OnboardingPage(
                imgPath: ImagePath.onboard1,
                title: "Spend globally with our Dollar card",
                description:
                    "Spend freely with a debit card that makes your international payments easier ",
              ),
              _OnboardingPage(
                imgPath: ImagePath.onboard2,
                title: "Instantly convert between currencies",
                description:
                    "Swap currencies with no hidden fees at the best market rates.",
              ),
              _OnboardingPage(
                imgPath: ImagePath.onboard3,
                title: "Receive your payment faster",
                description:
                    "Open a Xcrow account to send and receive your payment in seconds.",
              )
            ],
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blackColor),
                        color:
                            pageValue() == 0 ? blackColor : Colors.transparent),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blackColor),
                        color:
                            pageValue() == 1 ? blackColor : Colors.transparent),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: blackColor),
                        color:
                            pageValue() == 2 ? blackColor : Colors.transparent),
                  ),
                ],
              )),
          if (pageValue() > 1.5)
            Positioned(
                top: 80,
                right: 10,
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return GestureDetector(
                      onTap: ref.read(authProvider.notifier).onboardCompleted,
                      child: child,
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(color: blackColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: blackColor,
                      ),
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imgPath;

  const _OnboardingPage(
      {Key? key, this.title = '', this.description = '', this.imgPath = ''})
      : super(key: key);
  static const bigStyle = TextStyle(
      color: Color(0xff000000),
      fontFamily: FontFamily.light,
      fontSize: 45,
      height: 50 / 45,
      fontWeight: FontWeight.w200);
  static const smallStyle = TextStyle(
      color: Color(0xff000000),
      fontFamily: FontFamily.light,
      fontSize: 18,
      fontWeight: FontWeight.w200);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: bigStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: smallStyle,
            ),
            const SizedBox(height: 80),
          ],
        )
      ],
    );
  }
}
