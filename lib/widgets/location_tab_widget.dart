import 'package:flutter/material.dart';
import 'package:weatherapp/scripts/location.dart' as location;


// TODO: When the user clicks the Get From Location button:
// Besides setting the active location (which it is already doing)
// Add that location to a saved locations list (you'll need to create this)
// Display the saved locations in a new widget below the get from GPS button
// make the saved location widgets onTap()-able, so the user can tap a previously saved location, 
// setting the location based on that
//

class LocationHistoryWidget extends StatelessWidget {
  const LocationHistoryWidget({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 500.0,
      child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 50,
              child: const Center(child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                  children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Text("New York, New York 10007", style: TextStyle(fontWeight: FontWeight.bold)),
              ],)),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ]
        )
    );
  }
}

class LocationTabWidget extends StatefulWidget {
  const LocationTabWidget({
    super.key,
    required Function setLocation,
    required location.Location? activeLocation
  }) : _setLocation = setLocation, _location = activeLocation;

  final Function _setLocation;
  final location.Location? _location;

  @override
  State<LocationTabWidget> createState() => _LocationTabWidgetState();
}

class _LocationTabWidgetState extends State<LocationTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationDisplayWidget(activeLocation: widget._location),
        LoctionInputWidget(setLocation: widget._setLocation),
        ElevatedButton(onPressed: ()=>{widget._setLocation()},child: const Text("Get From GPS")),
        SizedBox(height: 20),
        LocationHistoryWidget()
      ],
    );
  }
}

class LocationDisplayWidget extends StatelessWidget {
  const LocationDisplayWidget({
    super.key,
    required location.Location? activeLocation
  }) : _location = activeLocation;

  final location.Location? _location;

  @override
  Widget build(BuildContext context) {
    return Text(_location != null ? "${_location.city}, ${_location.state} ${_location.zip}" : "No Location Set");
  }
}

class LoctionInputWidget extends StatefulWidget {
  const LoctionInputWidget({
    super.key,
    required Function setLocation
  }) : _setLocation = setLocation;

  final Function _setLocation;

  @override
  State<LoctionInputWidget> createState() => _LoctionInputWidgetState();
}

class _LoctionInputWidgetState extends State<LoctionInputWidget> {

  // values
  String _city = "";
  String _state = "";
  String _zip = "";

  // controllers
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipController;

  // initialize Controllers
  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _zipController = TextEditingController();

  }

  // update functions
  void _updateCity(TextEditingController controller){
    setState(() {
      _city = controller.text;
    });
  }

    void _updateState(TextEditingController controller){
    setState(() {
      _state = controller.text;
    });
  }

    void _updateZip(TextEditingController controller){
    setState(() {
      _zip = controller.text;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              LocationTextWidget(width: 100, text: "city", controller: _cityController, updateText: _updateCity),
              LocationTextWidget(width: 75, text: "state", controller: _stateController, updateText: _updateState),
              LocationTextWidget(width: 100, text: "zip", controller: _zipController, updateText: _updateZip),
            ],
          ),
          ElevatedButton(onPressed: () {widget._setLocation([_city, _state, _zip]);}, child: Text("Get From Address"))
        ],
      ),
    );
  }
}

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
    required double width,
    required String text,
    required TextEditingController controller,
    required Function updateText
  }): _width = width, _text = text, _controller = controller, _updateText = updateText;

  final double _width;
  final String _text;
  final TextEditingController _controller;
  final Function _updateText;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: TextField(
        controller: _controller,
        onChanged: (value) => {_updateText(_controller)},
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: _text
      )),
    );
  }
}