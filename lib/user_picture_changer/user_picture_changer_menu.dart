import 'package:flutter/material.dart';

class UserPictureChangerMenu extends StatelessWidget {
  final Function onCameraChange;
  final Function onGalleryChange;
  final Function onPictureRemove;

  const UserPictureChangerMenu({
    Key key,
    this.onCameraChange,
    this.onGalleryChange,
    this.onPictureRemove,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if (onCameraChange != null)
          ListTile(
            title: Text('Câmera'),
            leading: Icon(Icons.camera_alt),
            onTap: () async {
              try {
                Navigator.pop(context);
                await onCameraChange();
              } on Exception catch (e) {
                print(e);
              }
            },
          ),
        if (onGalleryChange != null)
          ListTile(
            title: Text('Galeria de Fotos'),
            leading: Icon(Icons.photo_album),
            onTap: () async {
              try {
                Navigator.pop(context);
                await onGalleryChange();
              } on Exception catch (e) {
                print(e);
              }
            },
          ),
        if (onPictureRemove != null)
          ListTile(
            title: Text('Remover Foto atual'),
            leading: Icon(Icons.delete_forever),
            onTap: () async {
              try {
                Navigator.pop(context);
                await onPictureRemove();
              } on Exception catch (e) {
                print(e);
              }
            },
          )
      ],
    );
  }
}
