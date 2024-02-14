import 'package:flutter/material.dart';
import 'package:istanbule/features/Utils/them.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  Widget _buildLanguageTile(BuildContext context, String language) {
    IconData iconData;

    // Assign appropriate icons based on the language
    switch (language.toLowerCase()) {
      case 'arabic':
        iconData = Icons.language;
        break;
      case 'english':
        iconData = Icons.language;
        break;
      case 'russian':
        iconData = Icons.language;
        break;
      default:
        iconData = Icons.language;
        break;
    }

    return ListTile(
      leading: Icon(iconData),
      title: Text(language),
      onTap: () {
        // Handle the language selection here
        print('Selected language: $language');
        // You can optionally close the ExpansionTile after selection
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              color: AppColors.textColorWhiteBold,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            child: ExpansionTile(
              title: Text('Data'),
              children: [
                _buildLanguageTile(context, 'Arabic'),
                _buildLanguageTile(context, 'English'),
                _buildLanguageTile(context, 'Russian'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
