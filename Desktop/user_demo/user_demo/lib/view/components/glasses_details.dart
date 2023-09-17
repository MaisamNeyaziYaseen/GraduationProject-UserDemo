import 'package:flutter/material.dart';
import 'package:user_demo/utils/ui_constants.dart';

class GlassesDetails extends StatefulWidget {
  Map<String, dynamic> item;
  GlassesDetails({super.key, required this.item});

  @override
  State<GlassesDetails> createState() => _GlassesDetailsState(item: item);
}

class _GlassesDetailsState extends State<GlassesDetails> {
  Map<String, dynamic> item;

  _GlassesDetailsState({required this.item});

  Widget _buildDetailsWidgets(String lensesType) {
    switch (lensesType) {
      case "Prescription":
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: UiConstants.sndColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Left Eye - OS"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sphere: ${item['left_lens']['os_sphere']}"),
                        Text("Sphere: ${item['left_lens']['os_cylinder']}"),
                        Text("Sphere: ${item['left_lens']['os_axis']}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: UiConstants.sndColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Right Eye - OD"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sphere: ${item['right_lens']['od_sphere']}"),
                        Text("Sphere: ${item['right_lens']['od_cylinder']}"),
                        Text("Sphere: ${item['right_lens']['od_axis']}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: UiConstants.sndColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    title: Text("PD - Popularity Distance"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Left Eye PD: ${item['left_lens']['left_pd']}"),
                        Text("Right Eye PD: ${item['right_lens']['right_pd']}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      case "Reading Lenses":
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: UiConstants.sndColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                title: Text("Magnification Strength"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Left Lens Magnification Strength: ${item['left_lens']['ms']}"),
                    Text(
                        "Right Lens Magnification Strength: ${item['right_lens']['ms']}"),
                  ],
                ),
              )
            ],
          ),
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Text("Item Details"),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text("ID"),
                subtitle: Text("${item['product_id'].toJson()}"),
              ),
              ListTile(
                title: Text("Lenses Type"),
                subtitle: Text(item['lenses_type']),
              ),
              _buildDetailsWidgets(item['lenses_type']),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: UiConstants.mainColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lenses Price"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("${item['lenses_price']}JD"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
