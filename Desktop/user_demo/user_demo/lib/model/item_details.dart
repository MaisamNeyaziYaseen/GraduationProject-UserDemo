class ItemDetails {
  String? uvProtection;
  String? frameColor;
  String? frameColorCode;
  String? lensColor;
  String? lensColorCode;
  String? frameShape;
  String? frameType;
  String? frameMaterial;
  String? frameFinidh;
  String? lensFinish;
  String? frameWidth;
  String? lensWidth;
  String? lensHeight;
  String? noseBridge;
  String? templeLength;

  ItemDetails.fromJson(Map<String, dynamic> json) {
    uvProtection = json['uv_protection'];
    frameColor = json['frame_color'];
    frameColorCode = json['frame_color_code'];
    lensColor = json['lens_color'];
    lensColorCode = json['lens_color_code'];
    frameShape = json['frame_shape'];
    frameType = json['frame_type'];
    frameMaterial = json['frame_material'];
    frameFinidh = json['frame_finish'];
    lensFinish = json['lens_finish'];
    frameWidth = json['frame_width'];
    lensWidth = json['lens_width'];
    lensHeight = json['lens_height'];
    noseBridge = json['nose_bridge'];
    templeLength = json['temple_length'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    if (uvProtection != null) {
      data['uv_protection'] = uvProtection;
    }
    if (frameColor != null) {
      data['frame_color'] = frameColor;
    }
    if (frameColorCode != null) {
      data['frame_color_code'] = frameColorCode;
    }
    if (lensColor != null) {
      data['lens_color'] = lensColor;
    }
    if (lensColorCode != null) {
      data['lens_color_code'] = lensColorCode;
    }
    if (frameShape != null) {
      data['frame_shape'] = frameShape;
    }
    if (frameType != null) {
      data['frame_type'] = frameType;
    }
    if (frameMaterial != null) {
      data['frame_material'] = frameMaterial;
    }
    if (frameFinidh != null) {
      data['frame_finish'] = frameFinidh;
    }
    if (lensFinish != null) {
      data['lens_finish'] = lensFinish;
    }
    if (frameWidth != null) {
      data['frame_width'] = frameWidth;
    }
    if (lensWidth != null) {
      data['lens_width'] = lensWidth;
    }
    if (lensHeight != null) {
      data['lens_height'] = lensHeight;
    }
    if (noseBridge != null) {
      data['nose_bridge'] = noseBridge;
    }
    if (templeLength != null) {
      data['temple_length'] = templeLength;
    }

    return data;
  }
}
