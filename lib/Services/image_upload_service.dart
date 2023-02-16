// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import '../Constants/api_urls.dart';

// class ImageUploadService {
//   late File uploadimage;

//   Future<bool> upload(String token) async {
//     bool success = false;
//     http.StreamedResponse response = await uploadPlantImage(uploadimage, token);
//     if (response.statusCode == 200) {
//       Map map = jsonDecode(await response.stream.bytesToString());
//       String message = map["message"];
//       success = true;
//     }
//     return success;
//   }

//   Future<http.StreamedResponse> uploadPlantImage(
//       PickedFile? data, String token) async {
//     http.MultipartRequest request = http.MultipartRequest(
//         'POST', Uri.parse(ApiUrls.baseURL + ApiUrls.uploadPlantImage));
//     request.headers.addAll(<String, String>{'Authorization': 'Bearer $token'});
//     if (data != null) {
//       File _file = File(data.path);
//       request.files.add(http.MultipartFile(
//           'image', _file.readAsBytes().asStream(), _file.lengthSync(),
//           filename: _file.path.split('/').last));
//     }
//     http.StreamedResponse response = await request.send();
//     return response;
//   }
//   //   try{
//   //     List<int> imageBytes = uploadimage.readAsBytesSync();
//   //     String baseimage = base64Encode(imageBytes);
//   //     var response = await http.post(
//   //             new Uri.http(ApiUrls.baseURL, ApiUrls.uploadPlantImage),
//   //             body: {
//   //                'image': baseimage,
//   //             },
//   //             headers: {'Authorization': 'Bearer $token',
//   //     }
//   //     );
//   //     if(response.statusCode == 200){
//   //        var jsondata = json.decode(response.body);
//   //        if(jsondata["error"]){
//   //            print(jsondata["msg"]);
//   //        }else{
//   //            print("Upload successful");
//   //        }
//   //     }else{
//   //       print("Error during connection to server");
//   //     }
//   //   }catch(e){
//   //      print("Error during converting to Base64");
//   //   }
//   // }
// }
