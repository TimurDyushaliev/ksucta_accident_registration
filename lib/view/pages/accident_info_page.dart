import 'package:accident_registration/models/accident_model.dart';
import 'package:accident_registration/resource/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

const _fieldsLength = 6;

class AccidentInfoPage extends StatelessWidget {
  const AccidentInfoPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  final AccidentModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(model.fullName),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              _fieldsLength,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTextRow(index)[0],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(_getTextRow(index)[1]),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final rowTexts =
                List.generate(_fieldsLength, (index) => _getTextRow(index));
            var text = '';
            for (final rowText in rowTexts) {
              text += '${rowText[0]}: ${rowText[1]}\n';
            }
            Share.share(text);
          },
          child: const Icon(Icons.share),
        ));
  }

  List<String> _getTextRow(int index) {
    switch (index) {
      case 0:
        return [StringResource.register.fullName, model.fullName];
      case 1:
        return [StringResource.register.address, model.address];
      case 2:
        return [StringResource.register.dateTime, model.dateTime.split('.')[0]];
      case 3:
        return [StringResource.register.vehicle, model.vehicle];
      case 4:
        return [StringResource.register.vehicleNumber, model.vehicleNumber];
      case 5:
        return [StringResource.register.vehicleBrand, model.vehicleBrand];
      default:
        throw Exception('Invalid index: $index');
    }
  }
}
