import 'package:my_site/resources/images/images.dart';

import '../../model/project_model.dart';
import '../../model/tech_item.dart';

class TechData {
  static const List<TechItem> list = [
    TechItem('flutter', ProjectAssetImages.flutterColorImage,
        ProjectAssetImages.flutterDisabledImage),
    TechItem('firebase', ProjectAssetImages.firebaseColorImage,
        ProjectAssetImages.firebaseDisabledImage)
  ];
}

class ProjectData {
  static const List<Project> _list = [
    Project('Android', ProjectAssetImages.androidIcon, 'android projects'),
    Project('firebase', ProjectAssetImages.androidIcon, 'firebase projects')
  ];

  Future<List<Project>> get list async => Future.delayed(
        const Duration(seconds: 2),
        () => _list,
      );
}

class SuccessData {
  static const List<Project> _list = [
    Project("Firebase Project", ProjectAssetImages.firebaseColorImage,
        " a firebase project"),
    Project("Flutter Project", ProjectAssetImages.flutterColorImage,
        "a flutter application sdsa adas  asdas d asd sd dad sad asd sa das das da ssd as dasd as das das da das das as das das das das das das dasd awd aefasnfvafkabekb kj kb b h")
  ];

  Future<List<Project>> get list async =>
      Future.delayed(const Duration(seconds: 5), () => _list);
}
