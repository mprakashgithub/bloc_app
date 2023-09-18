// import 'package:blocapiyt/logic/bloc/counter_bloc.dart';
// import 'package:blocapiyt/logic/bloc/counter_event.dart';
// import 'package:blocapiyt/logic/bloc/counter_state.dart';
// import 'package:blocapiyt/presentation/screens/call_method.dart';
import 'package:bloc_app/logic/bloc/counter_bloc.dart';
import 'package:bloc_app/logic/bloc/counter_event.dart';
import 'package:bloc_app/logic/bloc/counter_state.dart';
import 'package:bloc_app/presentation/screens/call_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          // if (state.copyWith() == 5) {
          //   print("Line 23");
          // }
          if (state == NavigateScreenState(state.counterVal)) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CallMethod()));
          }
        },
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Counter"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name: "),
                      Text("Counter value: ${state.counterVal}"),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            color: Color.fromARGB(255, 49, 233, 156),
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(DecreaseCounterEvent(countVal: 0));
                            },
                            child: Text("-"),
                          ),
                          MaterialButton(
                            color: Colors.purple,
                            onPressed: () {
                              BlocProvider.of<CounterBloc>(context)
                                  .add(IncreaseCounterEvent(countVal: 0));
                            },
                            child: Text("+"),
                          )
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'What do people call you?',
                            labelText: 'Name *',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          onChanged: (val) {
                            print("On changed: $val");
                            BlocProvider.of<CounterBloc>(context)
                                .add(ChangeNameEvent(name: val));
                          },
                          validator: (String? value) {
                            return value!.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          // BlocProvider.of<CounterBloc>(context)
                          //     .add(ChangeNameEvent(
                          //       name:
                          //     ));
                        },
                        child: Text("Change name"),
                      ),
                      SizedBox(height: 50),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(NavigateToCallScreenEvent());
                        },
                        child: Text("Go to callMethod screen"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
