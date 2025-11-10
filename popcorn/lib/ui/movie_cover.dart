import 'package:flutter/cupertino.dart';

class MovieCover extends StatelessWidget {
  final String? path;
  final String placeholder;
  final double? height;
  final double? width;

  const MovieCover({
    super.key,
    required this.path,
    required this.placeholder,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final placeHolder = Image.asset(
      placeholder,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
    if (path != null) {
      return FadeInImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        image: NetworkImage(path!),
        placeholder: AssetImage(placeholder),
        imageErrorBuilder: (_, _, _) {
          return placeHolder;
        },
      );
    } else {
      return placeHolder;
    }
  }
}
