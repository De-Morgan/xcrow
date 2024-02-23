import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/search_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Transaction History',
          centerTitle: true,
        ),
        body: PaddedContainer(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const SearchWidget(),
              const SizedBox(height: 16),
              ...histories.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _HistoryTile(history: e),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({super.key, required this.history});

  final _History history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42),
          child: Text(
            history.date,
            style: context.bodySmall,
          ),
        ),
        const Divider(),
        Row(
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  color: history.background,
                  shape: BoxShape.circle,
                  border: Border.all(color: history.border, width: 3.5)),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.name,
                      ),
                      Text(
                        history.time,
                        style: context.bodySmall,
                      ),
                    ],
                  ),
                  Spacer(),
                  Text('-N20,000.00')
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

const histories = [
  _History(
      date: '19 Feb 2024',
      name: 'Ojorumi John ',
      time: '08:33PM',
      border: Color(0xffA6A1A1),
      background: Color(0xff3F5E9A),
      isNegative: true,
      amount: 20000),
  _History(
      date: '19 Feb 2024',
      name: 'Uche Micheal Moses',
      time: '08:33PM',
      border: Color(0xffFDE48A),
      background: Color(0xffFF9900),
      amount: 120000),
  _History(
      date: '19 Feb 2024',
      name: 'Ojorumi John ',
      time: '08:33PM',
      border: Color(0xffFBADE0),
      background: Color(0xffF01EA8),
      isNegative: true,
      amount: 20000),
  _History(
      date: '19 Feb 2024',
      name: 'Uche Micheal Moses',
      time: '08:33PM',
      border: Color(0xff92FA92),
      background: Color(0xff1FBF55),
      amount: 120000),
];

class _History {
  final String name, date, time;
  final Color background, border;
  final num amount;
  final bool isNegative;

  const _History(
      {required this.name,
      required this.date,
      required this.time,
      required this.background,
      this.isNegative = false,
      required this.amount,
      required this.border});
}
