import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class NetworkPage extends StatefulWidget {
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  TextEditingController editingController = TextEditingController();
  IjkMediaController mediaController = IjkMediaController();

  @override
  void initState() {
    super.initState();
    editingController.text =
        "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_30mb.mp4";
  }

  @override
  void dispose() {
    editingController.dispose();
    mediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("播放网络资源"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: editingController,
                ),
              ),
              FlatButton(
                child: Text("播放"),
                onPressed: _playInput,
              ),
            ],
          ),
          Container(
            height: 400,
            child: IjkPlayer(
              mediaController: mediaController,
            ),
          ),
        ],
      ),
    );
  }

  void _playInput() async {
    var text = editingController.text;
    await mediaController.setNetworkDataSource(text, autoPlay: true);
  }
}