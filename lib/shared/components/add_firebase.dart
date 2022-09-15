import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/watch_list_model.dart';
import 'package:movies_app/shared/components/components.dart';
import 'package:movies_app/shared/network/firebase_function.dart';

class AddFirebase {
  static void addToFirebase(
    BuildContext context,
      {String? backdropPath,
      num? id,
      String? overview,
      String? releaseDate,
      String? title,
      bool? video,
      num? voteAverage}) {
    WatchListModel movie = WatchListModel(
      backdropPath: backdropPath,
      id: id,
      overview: overview,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
    );
    showLoading(context, 'Loading....');
    FirebaseFunction.addMovie(movie).then((value) {
      showMessage(
        context,
        'Add Succefuly',
        'ok',
        () {
          Navigator.pop(context);
        },
      );
     hideLoading(context);
    }).onError((error, _) {
      print(error);
    });
  }
}
