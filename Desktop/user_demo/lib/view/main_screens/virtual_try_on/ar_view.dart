import 'dart:convert';
import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:user_demo/model/item.dart';
import 'package:user_demo/model/product.dart';

class ArView extends StatefulWidget {
  Item item;
  ArView({super.key, required this.item});

  @override
  State<ArView> createState() => _ArViewState(item: item);
}

class _ArViewState extends State<ArView> with AutomaticKeepAliveClientMixin {
  DeepArController _deepArController = DeepArController();
  bool _isInitialized = false;
  String version = '';
  bool _isFaceMask = false;
  bool _isFilter = false;
  Object? ex;

  Item item;

  _ArViewState({required this.item});

  final List<String> _effectsList = [
    "assets/effects/glasses_effect.deepar",
  ];
  int _effectIndex = -1;

  final String _assetEffectsPath = 'assets/effects/';

  @override
  void initState() {
    super.initState();
    //initialize controller
    initController();
  }

  @override
  void didChangeDependencies() {
    // _initEffects();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _destroyController();

    super.dispose();
  }

  void _destroyController() async {
    await _deepArController.destroy();
  }

  void initController() async {
    _isInitialized = await _deepArController.initialize(
        androidLicenseKey:
            "2c1c3f4aeaae0de71ad56e175cc582bc58f9074f03c5f010fc56a5bb1802e30d0655ef91c9d8cf41",
        iosLicenseKey:
            "7a02e588ec0d16ab24d552e527bc73b89b71c4053d61abf36e6adaa832e0b96938783aba68a312d8");

    setState(() {});
  }

  /// Get all deepar effects from assets
  ///
  Future<List<String>> _getEffectsFromAssets(BuildContext context) async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final filePaths = manifestMap.keys
        .where((path) => path.startsWith(_assetEffectsPath))
        .toList();
    return filePaths;
  }

  /// Add effects which are rendered via DeepAR sdk
  void _initEffects() {
    // Either get all effects
    _getEffectsFromAssets(context).then((values) {
      _effectsList.clear();
      _effectsList.addAll(values);
    });
  }

  /// Get next effect
  String _getNextEffect() {
    _effectIndex < _effectsList.length ? _effectIndex++ : _effectIndex = 0;
    return _effectsList[_effectIndex];
  }

  /// Get previous effect
  String _getPrevEffect() {
    _effectIndex > 0 ? _effectIndex-- : _effectIndex = _effectsList.length;
    return _effectsList[_effectIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("deep ar flutter test"),
      ),
      body: Stack(
        children: [
          _isInitialized
              ? DeepArPreview(_deepArController)
              : const Center(
                  child: Text("Loading..."),
                ),
          _topMediaOptions(),
          _bottomMediaOptions(),
        ],
      ),
    );
  }

  // flip, face mask, filter, flash
  Positioned _topMediaOptions() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                _deepArController.flipCamera();
              },
              iconSize: 50,
              color: Colors.white70,
              icon: const Icon(Icons.cameraswitch))
        ],
      ),
    );
  }

  // prev, record, screenshot, next
  /// Sample option which can be performed
  Positioned _bottomMediaOptions() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                _deepArController.switchEffect(item.modelUrl);
              },
              child: Text(
                "Start now",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
