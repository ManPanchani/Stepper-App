import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepperDemo(),
    ),
  );
}

class StepperDemo extends StatefulWidget {
  final String title = "Stepper Demo";

  @override
  StepperDemoState createState() => StepperDemoState();
}

class StepperDemoState extends State<StepperDemo> {
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: const Text("SignUp"),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.approval),
              hintText: "Full Name",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.mail),
              hintText: "Email ID",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Conform Password",
            ),
          ),
        ],
      ),
      isActive: true,
    ),
    Step(
      title: Text("Step 2"),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.approval),
              hintText: "User Name",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Password",
            ),
          ),
        ],
      ),
      isActive: true,
    ),
    const Step(
      title: Text("Step 3"),
      content: Text("WellCome To Stepper App..."),
      state: StepState.complete,
      isActive: true,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: const Text(
          "Stepper App",
        ),
        backgroundColor: Colors.red,
      ),
      // Body
      body: Stepper(

        currentStep: current_step,
        steps: steps,
        // type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            current_step = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (current_step < steps.length - 1) {
              current_step = current_step + 1;
            } else {
              current_step = 0;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (current_step > 0) {
              current_step = current_step - 1;
            } else {
              current_step = 0;
            }
          });
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Stepper_App(),
//     ),
//   );
// }
//
// class Stepper_App extends StatefulWidget {
//   const Stepper_App({Key? key}) : super(key: key);
//
//   @override
//   State<Stepper_App> createState() => _Stepper_AppState();
// }
//
// class _Stepper_AppState extends State<Stepper_App> {
//   int currentStep = 0;
//
//   continued() {
//     currentStep < 2 ? setState(() => currentStep += 1) : null;
//   }
//
//   cancel() {
//     currentStep > 0 ? setState(() => currentStep -= 1) : null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Stepper App",
//         ),
//         backgroundColor: Colors.red,
//         centerTitle: true,
//       ),
//       body: Stepper(
//         currentStep: currentStep,
//         onStepContinue: () {
//           setState(() {
//             continued() {
//               currentStep < 2 ? setState(() => currentStep += 1) : null;
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             cancel() {
//               currentStep > 0 ? setState(() => currentStep -= 1) : null;
//             }
//           });
//         },
//         steps: [
//           Step(
//             title: const Text('Account'),
//             content: Column(
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Email Address'),
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Password'),
//                 ),
//               ],
//             ),
//           ),
//           Step(
//             title: const Text('Address'),
//             content: Column(
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Home Address'),
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Postcode'),
//                 ),
//               ],
//             ),
//             isActive: currentStep >= 0,
//             state: currentStep >= 1 ? StepState.complete : StepState.disabled,
//           ),
//         ],
//       ),
//     );
//   }
// }
