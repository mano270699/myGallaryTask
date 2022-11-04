import 'package:flutter/material.dart';
import 'package:mygellary/core/utils/assets_manager.dart';

class ImageItem extends StatelessWidget {
  ImageItem({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border:
        //     Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).highlightColor,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: Offset(0, 3), // changes position of shadow
        //   )
        // ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.assetNetwork(
          fit: BoxFit.cover,
          placeholder: ImgAssets.placeholder,
          placeholderFit: BoxFit.cover,
          height: 60,
          image: image,
          imageErrorBuilder: (c, o, s) => Image.asset(
            ImgAssets.placeholder,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
