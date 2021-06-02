I have been working on flutter since very long and used BuildContext almost everywhere:

The Build method

@override

  Widget build(BuildContext context) {

}

MediaQuery.of(context)

Builder Widget

Scaffold.of(context).showSnackBar(

                    new SnackBar(content: Text("MeshCookie"))

                );

Almost everywhere in the application BuildContext is referred to. But have you asked yourself WHAT IS BuildContext?

What is BuildContext?

The BuildContext is the handle/pointer to the location of the particular widget in the widget tree. Note that every widget you create has its own BuildContext, and as a matter of fact, every widget should have its own BuildContext for them to locate themselves in the widget tree or reach out to the nearest ancestor widget.

For instance, consider the following image, here every Widget ( MaterialApp > Scaffold > Center > Builder1 > Builder2 > ElevatedButton ) has its own BuildContext and also have access to the parent BuildContext.


BuildContext Diagram
The Widget tree is just a representation of the configuration of the widget. Flutter Framework creates an Element tree from the information available in the Widget Tree and inflates the Element object with the Widget.

A very important point to note here is that the widgets are chained, so If Builder2 has a child ElevatedButton, then ElevatedButton will also have access to the context of Builder1:

Let’s understand the importance of context in the widget tree by an example code.

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context1) {

    return MaterialApp(

      title: 'BuildContext Demo',

      home: Scaffold(

        body: Center(

          child: Builder(

            builder: (context2) => Builder(

              builder: (context3) => ElevatedButton(

                  onPressed: () {

                    Scaffold.of(context3).showSnackBar(

                        new SnackBar(content: Text("MeshCookie")));

                  },

                  child: Text("Open Snackbar")),

            ),

          ),

        ), // This trailing comma makes auto-formatting nicer for build methods.

      ),

    );

  }

}

Note: Only one Builder widget is enough to provide the required context.

Here notice that I have renamed the context parameters ( context1, context2, context3 ) for sake of understanding. The above code would not have worked if the Builder widgets were absent. The build() function here returns a BuildContext which is different than the Build Context passed to it as a parameter and as a result, the Scaffold required by context in Scaffold.of(context) will not find Scaffold in the Element Tree and will give following error:

Why the Nested Builder Worked?

As can be seen, context3 is used to build snackbar even though Sccafold is available in context2, it still works with context3. This is because the BuildContext is nested for child objects. The main purpose of BuildContext is to help provide a method to reach the nearest ancestor widgets. the framework while searching for the nearest Scaffold for a given BuildContext goes to the nearest ancestor widget by traversing using the BuildContext and uses the context as per the nearest Scaffold found.
This is a little confusing initially but will start making sense as you start using it further.

So if you want to have a section of your app with a different Theme, you can simply achieve that by wrapping that section in a Builder and providing a Theme in the local BuildContext.