import 'package:flutter/material.dart';
import 'package:fluttercommonwidgets/user_picture_changer/user_picture_changer_menu.dart';
import 'package:fluttercommonwidgets/user_avatar/user_avatar.dart';

class UserPictureChanger extends StatefulWidget {
  final Icon icon;
  final Function onCameraChange;
  final Function onGalleryChange;
  final Function onPictureRemove;

  const UserPictureChanger({
    Key key,
    this.icon = const Icon(Icons.camera_alt),
    this.onCameraChange,
    this.onGalleryChange,
    this.onPictureRemove,
  }) : super(key: key);

  @override
  _UserPictureChangerState createState() => _UserPictureChangerState();
}

class _UserPictureChangerState extends State<UserPictureChanger> {
  bool isLoading = false;
  Future<void> loadCallback(Function callback) async {
    setState(() {
      isLoading = true;
    });
    await callback();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FittedBox(
            child: UserAvatar(),
          ),
        ),
        if (widget.onCameraChange != null ||
            widget.onGalleryChange != null ||
            widget.onPictureRemove != null)
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: FractionallySizedBox(
              widthFactor: 1 / 3,
              heightFactor: 1 / 3,
              child: FloatingActionButton(
                  heroTag: 'userpicturechangerhero',
                  onPressed: isLoading
                      ? null
                      : () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Material(
                                color: Colors.white,
                                child: SafeArea(
                                  child: UserPictureChangerMenu(
                                    onCameraChange:
                                        widget.onCameraChange != null
                                            ? () async {
                                                await loadCallback(
                                                    widget.onCameraChange);
                                              }
                                            : null,
                                    onGalleryChange:
                                        widget.onGalleryChange != null
                                            ? () async {
                                                await loadCallback(
                                                    widget.onGalleryChange);
                                              }
                                            : null,
                                    onPictureRemove:
                                        widget.onPictureRemove != null
                                            ? () async {
                                                await loadCallback(
                                                    widget.onPictureRemove);
                                              }
                                            : null,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                  child: isLoading
                      ? Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          ),
                        )
                      : widget.icon),
            ),
          )
      ],
    );
  }
}
