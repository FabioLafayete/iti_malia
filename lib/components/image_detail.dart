import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:iti_malia/features/Design/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as ShareFile;
import 'loading_overlay.dart';

class DetailImage extends StatefulWidget {
  final String image;
  DetailImage({Key key, this.image});

  @override
  _DetailImageState createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {

  Color orange = DesignColors.orange();

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(size),
      backgroundColor: Color(0xFFF5F8FA),
      body: this._buildImage(),
    );
  }

  Widget _buildImage() {
    return Container(
      child: PhotoView(
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: 3.0,
        basePosition: Alignment.center,
        imageProvider: NetworkImage(widget.image),
      ),
    );
  }

  Widget _appBar(Size size){
    return AppBar(
      backgroundColor: orange,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo_branco_appbar.png',
        width: size.width * 0.38,
        color: Colors.white,
      ),
      actions: [
        IconButton(
            icon: Icon(
                Icons.share,
                size: size.width * 0.07,
                color: Colors.white
            ),
          onPressed: () => _onTapShare(context),
        )
      ],
    );
  }

  void _onTapShare(BuildContext context) async {

    LoadingOverlay loading = LoadingOverlay(context);
    await loading.show();

    try {
      Response response = await get(widget.image);

      await ShareFile.Share.file(
        'Iti Malia',
        _getFile(),
        response.bodyBytes,
        'application/jpg',
      );
    } catch (e) {
      print(e);
    } finally {
      await loading.hide();
    }
  }

  String _getFile(){
    String name;
    int index = widget.image.length - 1;
    bool out = false;

    while(!out){
      if(widget.image[index] == '/'){
        if(name == null){
          name = widget.image.substring(index+1, widget.image.length);
          out = true;
        }
      }
      index --;
    }
    return '/Iti Malia_' + name.replaceAll('%20', ' ');
  }

  @override
  void dispose() {
    super.dispose();

    //reset orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
