import 'package:test/test.dart';
import 'package:ciyu_api/ciyu_api.dart';


/// tests for MeetControllerApi
void main() {
  final instance = CiyuApi().getMeetControllerApi();

  group(MeetControllerApi, () {
    //Future createMeet(CreateMeetDto createMeetDto) async
    test('test createMeet', () async {
      // TODO
    });

    //Future createMeets(CreateMeetsDto createMeetsDto) async
    test('test createMeets', () async {
      // TODO
    });

    //Future<BuiltList<MeetDto>> getMeets(String wordId) async
    test('test getMeets', () async {
      // TODO
    });

  });
}
