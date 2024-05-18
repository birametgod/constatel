/*import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class CarSideDetectionScreen extends StatefulWidget {
  const CarSideDetectionScreen({Key? key}) : super(key: key);

  @override
  _CarSideDetectionScreenState createState() =>
      _CarSideDetectionScreenState();
}

class _CarSideDetectionScreenState extends State<CarSideDetectionScreen> {
  late Interpreter _interpreter;
  bool _isModelLoaded = false;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Load the TensorFlow Lite model
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/car_side_detection_model.tflite');
      setState(() {
        _isModelLoaded = true;
      });
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  @override
  void dispose() {
    _interpreter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Side Detection'),
      ),
      body: Center(
        child: _isModelLoaded
            ? ElevatedButton(
          onPressed: () {
            detectCarSide();
          },
          child: Text('Detect Car Side'),
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  Future<void> detectCarSide() async {
    try {
      // Capture an image from the gallery or camera
      final image = await _imagePicker.getImage(source: ImageSource.gallery);
      if (image == null) return;

      // Read the image file and convert it to a byte list
      final bytes = await image.readAsBytes();
      final imageInput = img.decodeImage(Uint8List.fromList(bytes));

      // Preprocess the image and convert it to a tensor
      final inputImage = Image.resizeImage(imageInput, 224, 224);
      final inputTensor = TensorImage.fromImage(inputImage);

      // Perform inference on the input tensor
      final outputTensor = await _interpreter.run(inputTensor);

      // Process the output tensor to determine the car side detected
      // Example:
      // final side = processOutput(outputTensor);

    } catch (e) {
      print('Error detecting car side: $e');
    }
  }

// Process the output tensor to determine the car side detected
// Add your logic here to determine the car side
// For example, you can analyze the output tensor values to determine the side
// of the car detected.
}
*/