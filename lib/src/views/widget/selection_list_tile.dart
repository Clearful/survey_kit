import 'package:flutter/material.dart';

class SelectionListTile extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;

  const SelectionListTile({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 14.0),
    //       child: ListTile(
    //         title: Text(
    //           text,
    //           style: Theme.of(context).textTheme.headlineSmall?.copyWith(
    //                 color: isSelected
    //                     ? Theme.of(context).primaryColor
    //                     : Theme.of(context).textTheme.headlineSmall?.color,
    //               ),
    //         ),
    //         trailing: isSelected
    //             ? Icon(
    //                 Icons.check,
    //                 size: 32,
    //                 color: isSelected
    //                     ? Theme.of(context).primaryColor
    //                     : Colors.black,
    //               )
    //             : Container(
    //                 width: 32,
    //                 height: 32,
    //               ),
    //         onTap: () => onTap.call(),
    //       ),
    //     ),
    //     Divider(
    //       color: Colors.grey,
    //     ),
    //   ],
    // );
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: GestureDetector(
        onTap: () => onTap.call(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).dividerColor,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                ),
              ),
              isSelected
                  ? Icon(
                      Icons.check_circle,
                      color: Theme.of(context).chipTheme.selectedColor,
                    )
                  : Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.surface,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
