import 'package:flutter/material.dart';

class CommonField extends StatelessWidget {
  final String title;
  final String? hint;
  final bool dropDown;

  const CommonField(
      {Key? key, required this.title, this.hint, this.dropDown = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 8,
          ),
          dropDown
              ? DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  value: 'India',
                  items: [
                    DropdownMenuItem(
                      value: 'India',
                      child: Text(
                        'India',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Germany',
                      child: Text(
                        'Germany',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                )
              : TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: hint,
                  ),
                ),
        ],
      ),
    );
  }
}
