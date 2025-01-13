import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance/domain/models/attachment.dart';
import 'package:personal_finance/ui/core/themes/colors.dart';
import 'package:personal_finance/ui/new_expense/view_models/new_expense_viewmodel.dart';

class Attachments extends StatefulWidget {
  final NewExpenseViewModel viewModel;

  const Attachments({
    super.key,
    required this.viewModel,
  });

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Tooltip(
            message: 'Receipts, vouchers, etc.',
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple1,
              ),
              onPressed: _openFilePicker,
              child: const Row(
                children: [
                  Text('Add attachments'),
                  Spacer(),
                  Icon(
                    Icons.attach_file,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          ...widget.viewModel.attachments.map(
            (Attachment attachment) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          spacing: 2,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Tooltip(
                                message: attachment.fileName,
                                child: Text(
                                  attachment.fileName,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text("${attachment.fileSize} bytes"),
                            ),
                          ],
                        ),
                        Tooltip(
                          message: attachment.filePath,
                          child: Text(
                            attachment.filePath,
                            style: Theme.of(context).textTheme.labelSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => _removeAttachment(attachment),
                    icon: const Icon(Icons.close),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.single;
      var attachment = Attachment(
        file.name,
        file.path!,
        file.size,
        DateTime.now(),
      );

      setState(() {
        widget.viewModel.attachments.add(attachment);
      });
    }
  }

  void _removeAttachment(Attachment attachment) {
    setState(() {
      widget.viewModel.attachments.remove(attachment);
    });
  }
}
