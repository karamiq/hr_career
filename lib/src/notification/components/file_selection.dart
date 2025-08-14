import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../../../common_lib.dart';

class FileSelection extends StatefulWidget {
  const FileSelection({
    required this.onFileSelected,
    super.key,
    required this.text,
    this.allowedExtensions,
    this.fileType = FileType.any,
  });

  final String text;
  final void Function(File file) onFileSelected;
  final List<String>? allowedExtensions;
  final FileType fileType;

  @override
  State<FileSelection> createState() => _FileSelectionState();
}

class _FileSelectionState extends State<FileSelection> {
  File? _selectedFile;

  void _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: widget.fileType,
        allowedExtensions: widget.allowedExtensions,
        allowMultiple: false,
      );

      if (result != null) {
        File pickedFile = File(result.files.single.path!);
        setState(() => _selectedFile = pickedFile);
        widget.onFileSelected(_selectedFile!);
      } else {
        // User canceled the picker
        return;
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  String _getFileExtension(String filePath) {
    return filePath.split('.').last.toLowerCase();
  }

  IconData _getFileIcon(String extension) {
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
        return Icons.text_snippet;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.archive;
      case 'mp3':
      case 'wav':
      case 'flac':
        return Icons.audio_file;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.video_file;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }

  Widget _buildFilePreview() {
    if (_selectedFile == null) return Container();

    String fileName = _selectedFile!.path.split('/').last;
    String extension = _getFileExtension(fileName);

    // For images, show preview
    if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension)) {
      return GestureDetector(
        onTap: _pickFile,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderSize.smallRadius,
          child: Image.file(_selectedFile!, width: double.infinity, fit: BoxFit.cover),
        ),
      );
    }

    // For other files, show file info
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderSize.smallRadius,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(_getFileIcon(extension), size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: Insets.small),
            Text(
              fileName,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // const SizedBox(height: Insets.extraSmall),
            // Text(
            //   extension.toUpperCase(),
            //   style: TextStyle(
            //     color: Theme.of(context).colorScheme.primary,
            //     fontSize: 12,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: _pickFile,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderSize.smallRadius,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/upload_file.svg', color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: Insets.small),
            Text(widget.text, style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
            SizedBox(height: Insets.small),
            Text(context.l10n.browse, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            SizedBox(height: Insets.extraSmall),
            Container(height: 1.5, width: 50, color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );

    if (_selectedFile != null) {
      content = _buildFilePreview();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderSize.smallRadius,
        border: DashedBorder.all(dashLength: Insets.small, color: context.colorScheme.secondary),
      ),
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
