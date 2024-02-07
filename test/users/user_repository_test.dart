// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:tdd_youtube/users/user_model.dart';
// import 'package:tdd_youtube/users/user_repository.dart';


// class MockHTTPClient extends Mock implements Client {}

// void main() {

//   late UserRepository userRepository;
//   late MockHTTPClient mockHttpClient;

//   setUp((){
//     mockHttpClient = MockHTTPClient();
//     userRepository = UserRepository(mockHttpClient);
//   });

//  group('User Repository - ', (){ 
//   group('create users - ', () { 
//     test("given User repository is called when getUser function is called and then user data returned",
//     ()async{
//       //arrange
//       // stubbing
//       when(()=>
//         mockHttpClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))
//       ).thenAnswer((invocation) async{
//         return Response('''
//             {
//               "id" : 1,
//               "name" : "Asta",
//               "username" : "No magic",
//               "email" : "Asta@blackclover.com",
//               "website" : "blackclover.in"
//             }
//           ''', 200);
//       });
//       //act
//      final value= await userRepository.getUser();
//       //assert
//       expect(value, isA<User>());

//     });

//     test("given User repository is called when getUser function is called and then if there is an exception then throw exception",
//      () async{
//       // Arrange
//       // Stubbing
//       when(()async=>mockHttpClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))).thenAnswer(
//         (invocation) async=> Response('{}', 500));
//       // Act
//       final user =  userRepository.getUser();
//       // Assert
//       expect(user, throwsException);

//      });
//   });
//  });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_youtube/users/user_model.dart';
import 'package:tdd_youtube/users/user_repository.dart';


class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group('UserRepository - ', () {
    group('getUser function', () {
      test(
        'given UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned',
        () async {
          // Arrange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async {
            return Response('''
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
            ''', 200);
          });
          // Act
          final user = await userRepository.getUser();
          // Assert
          expect(user, isA<User>());
        },
      );

      test(
        'given UserRepository class when getUser function is called and status code is not 200 then an exception should be thrown',
        ()  {
          // arrange
          when(
            () => mockHTTPClient.get(
              Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
            ),
          ).thenAnswer((invocation) async => Response('{}', 500));
          // act
          final user = userRepository.getUser();
          // assert
          expect(user, throwsException);
        },
      );
    });
  });
}