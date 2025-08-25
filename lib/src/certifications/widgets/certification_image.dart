import 'package:app/common_lib.dart';
import 'package:app/core/theme/theme_lib.dart';
import 'package:flutter/material.dart';

class CertificationImage extends StatefulWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;
  const CertificationImage({super.key, required this.imageUrl, this.borderRadius});

  @override
  State<CertificationImage> createState() => _CertificationImageState();
}

class _CertificationImageState extends State<CertificationImage> {
  bool _imageLoaded = false;
  bool _imageError = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (widget.imageUrl.isEmpty) {
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: ConstantColors.primaryGradient(direction: ConstantColors.vertical).withOpacity(.4),
          borderRadius: widget.borderRadius ?? BorderSize.extraSmallRadius,
        ),
        child: Icon(Icons.verified, color: colorScheme.primary),
      );
    }

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: _imageLoaded && !_imageError
            ? null
            : ConstantColors.primaryGradient(direction: ConstantColors.vertical).withOpacity(.4),
        borderRadius: widget.borderRadius ?? BorderSize.extraSmallRadius,
      ),
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderSize.extraSmallRadius,
        child: Stack(
          children: [
            // Network Image
            Image.network(
              widget.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  // Image loaded successfully
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted && !_imageLoaded) {
                      setState(() {
                        _imageLoaded = true;
                        _imageError = false;
                      });
                    }
                  });
                  return child;
                }
                // Show loading indicator
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.primary,
                    value: loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // Handle image load error
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && !_imageError) {
                    setState(() {
                      _imageError = true;
                      _imageLoaded = false;
                    });
                  }
                });
                return Center(
                  child: Icon(Icons.image_not_supported_outlined, color: colorScheme.primary, size: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
