
import 'package:flutter/material.dart';



void main(){

  runApp( const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext contex){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('title')
          ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: .spaceEvenly,

            children: <Widget>[
              Spacer(),
              Text('Single choice calendar'),
              SingleChoice(),
              SizedBox(height: 20),

              Text('Multiple choice'),
              MultipleChoice(),
              Spacer(),
            ],
          )
        )
      )
    );
  }
  
}


enum Calendar { day, week, month, year}


class SingleChoice extends StatefulWidget{

  const SingleChoice({
    super.key,
  });

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}


class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = .week;

  @override
  Widget build(BuildContext context){

    return SegmentedButton<Calendar>(

      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day)
        ),

        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week)
        ),

        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month)
        ),

        ButtonSegment<Calendar>(
          value: Calendar.year,
          label: Text('Year'),
          icon: Icon(Icons.calendar_today)
        )
      ],

      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection){

        setState( (){


          calendarView = newSelection.first;
        });
      }
    );
  }

}


enum Sizes {extraSmall, small, medium, large, extraLarge}

class MultipleChoice extends StatefulWidget{

  const MultipleChoice({
    super.key,
  });

  @override
  State<MultipleChoice> createState() => _StateMultipleChoice();
}

class _StateMultipleChoice extends State<MultipleChoice> {

  Set<Sizes> selection = <Sizes>{Sizes.extraSmall, Sizes.extraLarge};


  @override
  Widget build(BuildContext context){

    return SegmentedButton<Sizes>(
      segments : const <ButtonSegment<Sizes>>[

        ButtonSegment<Sizes>(
          value: Sizes.extraSmall,
          label: Text('XS')
        ),

        ButtonSegment<Sizes>(
          value: Sizes.small,
          label: Text('S')
        ),

        ButtonSegment<Sizes>(
          value: Sizes.medium,
          label: Text('M'),
        ),

        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),

        ButtonSegment<Sizes>(
          value:Sizes.extraLarge,
          label: Text('XL'),
        )
      ],
      
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection){
        setState( (){

          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,


    ); 
  }


}