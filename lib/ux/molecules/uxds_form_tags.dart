import 'package:flutter/material.dart';

import '../atoms/uxds_form_input.dart';
import '../atoms/uxds_tags.dart';

class UXDSFormTags extends StatefulWidget {
  final String? helperText;
  final String? labelText;
  final Function(List<String> tags)? onAddedTag;
  final List<String>? tags;

  const UXDSFormTags({
    super.key, 
    this.helperText, 
    this.labelText, 
    this.onAddedTag,
    this.tags
  });

  @override
  State<UXDSFormTags> createState() => _UXDSFormTagsState();
}

class _UXDSFormTagsState extends State<UXDSFormTags> {
  late List<String> tags;
  TextEditingController ctr = TextEditingController();
  FocusNode focusNode1 = FocusNode();

  @override
  void initState() {
    tags = widget.tags ?? [];
    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    ctr.dispose();
    super.dispose();
  }

  void addedTag() {
    if (ctr.value.text.isEmpty) {
      return;
    }
    tags.add(ctr.value.text.trim());
    ctr.clear();
    focusNode1.requestFocus();
    setState(() {});
    if (widget.onAddedTag != null) {
      widget.onAddedTag!(tags);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UXDSFormField(
          keyboardType: TextInputType.text,
          focusNode: focusNode1,
          controller: ctr,
          labelText: widget.labelText,
          helperText: widget.helperText,
          onFieldSubmitted: (_) => addedTag()
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 4,
          runSpacing: 12,
          children: [
            for(int i = 0; i < tags.length; i++)
              UXDSTags(
                tagName: tags[i],
                onPressed: () {
                  tags.removeAt(i);
                  setState(() {});
                }
              )
          ]
        )
      ],
    );
  }
}
