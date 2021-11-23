import 'package:flutter/material.dart';
import 'package:loan_app/core/core.dart';
import 'package:loan_app/features/user_profile/presentation/widgets/widgets.dart';

class AverageLoanAmountCard extends StatelessWidget {
  const AverageLoanAmountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Average Loan Amount',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const StatDivider(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: Formatter.formatMoney(44884.46),
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextSpan(
                    text: ' RWF',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'The average is the total loan amount you have taken divided'
                ' with the total number of loans.',
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 10,
                    ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}