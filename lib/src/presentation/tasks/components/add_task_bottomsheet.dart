// ignore_for_file: prefer_const_constructors
// TODO: remove above ignore and put consts wherever needed
import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  bool addDescription = false;
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskTitleController,
                  onChanged: (value) => setState(() {}),
                  decoration: InputDecoration(border: InputBorder.none, hintText: 'New task'),
                ),
                addDescription
                    ? Flexible(
                        child: TextField(
                          controller: taskDescriptionController,
                          onChanged: (value) => setState(() {}),
                          maxLines: null,
                          style: Theme.of(context).textTheme.labelMedium,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Description',
                            isDense: true,
                          ),
                        ),
                      )
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            taskDescriptionController.clear();
                            setState(() => addDescription = !addDescription);
                          },
                          icon: Icon(Icons.text_snippet_rounded),
                        ),
                        IconButton(
                          onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          ),
                          icon: Icon(Icons.date_range),
                        ),
                        IconButton(
                          onPressed: () => setState(() => isStarred = !isStarred),
                          icon: Icon(isStarred ? Icons.star_rounded : Icons.star_border_rounded),
                        ),
                      ],
                    ),
                    TextButton(
                      style: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize))),
                      onPressed: taskTitleController.text.isNotEmpty ? () {} : null,
                      child: Text('Save'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
