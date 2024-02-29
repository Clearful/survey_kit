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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              isSelected
                  ? Icon(Icons.check_circle, color: Colors.white)
                  : Icon(Icons.check_circle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
