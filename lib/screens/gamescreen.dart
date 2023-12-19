import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/colors/colors.dart';

class GameScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return GameScreenState();
  }
}
class GameScreenState extends State<GameScreen>{
  List<String>displayOX=['','','','','','','','',''];
  List<String>matchindex=[];
  bool Oturn=true;
  String winneris='';
  int Oplayer=0;
  int Xplayer=0;
  bool winnerfound=false;
 
  

 void _tapped(int index){


  setState(() {
    if(Oturn && displayOX[index]==''){
      displayOX[index]='X';
    }else if(!Oturn && displayOX[index]==''){
      displayOX[index]='O';
    }
   Oturn=!Oturn;
   winner();
 
    
  });


 }

int filledbox=0;



 void winner(){
 
  
  //row1
  if(displayOX[0]==displayOX[1]&&
   displayOX[0]==displayOX[2]&&
   displayOX[0]!=''){
    setState(() {
    winneris='player' +displayOX[0]+ 'wins!'; 
    _updatescore(displayOX[0]);
    
    }
    );
    
   
  }//row2
   if(displayOX[3]==displayOX[4]&&
   displayOX[3]==displayOX[5]&&
   displayOX[3]!=''){
    setState(() {
    winneris='player'+displayOX[3]+'win!'; 
    _updatescore(displayOX[3]);
    });
   
  }//row3
   if(displayOX[6]==displayOX[7]&&
   displayOX[6]==displayOX[8]&&
   displayOX[6]!=''){
    setState(() {
    winneris='player'+displayOX[6]+'win!'; 
    _updatescore(displayOX[6]);
    });
   
  }//col1
   if(displayOX[0]==displayOX[3]&&
   displayOX[0]==displayOX[6]&&
   displayOX[0]!=''){
    setState(() {
    winneris='player'+displayOX[0]+'win!'; 
    _updatescore(displayOX[0]);
    });
   
  }//col2
   if(displayOX[1]==displayOX[4]&&
   displayOX[1]==displayOX[7]&&
   displayOX[1]!=''){
    setState(() {
    winneris='player'+displayOX[1]+'win!'; 
    _updatescore(displayOX[1]);
    });
   
  }//col3
   if(displayOX[2]==displayOX[5]&&
   displayOX[2]==displayOX[8]&&
   displayOX[2]!=''){
    setState(() {
    winneris='player'+displayOX[2]+'win!'; 
    _updatescore(displayOX[2]);
    });
   
  }
   if(displayOX[0]==displayOX[4]&&
   displayOX[0]==displayOX[8]&&
   displayOX[0]!=''){
    setState(() {
    winneris='player'+displayOX[0]+'win!'; 
    _updatescore(displayOX[0]);
    });

 }
      if(displayOX[2]==displayOX[4]&&
   displayOX[2]==displayOX[6]&&
   displayOX[2]!=''){
    
    setState(() {
    winneris='player'+displayOX[2]+'win!'; 
    _updatescore(displayOX[2]);
    }
    
    );
 
 }else if(filledbox==9){
  
  winneris='Draw';
 }

 
 
 
 }
 void _updatescore(String winner){
  if(winner=='O'){
    setState(() {
      Oplayer++;
    });
  }else if(winner=='X'){
    setState(() {
      Xplayer++;
    });
  }
   winnerfound=true;
}

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: AppColors.primarycolor,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('player O',
                        style:GoogleFonts.coiny(
                          color:Colors.white ,
                          fontSize: 30
                          
                        ) ,),
                        SizedBox(
                          height: 5,
                        ),
                        Text(Oplayer.toString(),
                         style:GoogleFonts.coiny(
                          color:Colors.white ,
                          fontSize: 20
                          
                        ))
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text('player X',
                         style:GoogleFonts.coiny(
                              color:Colors.white ,
                              fontSize: 30
                              
                            )),
                            SizedBox(height: 5,),
                            Text(Xplayer.toString(),
                             style:GoogleFonts.coiny(
                          color:Colors.white ,
                          fontSize: 20
                          
                        ))
                      ],
                    )
                  ],
                ),
              )
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: 9,
              
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3) , 
                itemBuilder:(ctx,index){
                  return GestureDetector(
                   onTap: () {
                    _tapped(index);
                   },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: AppColors.primarycolor,
                        ),
                        color: AppColors.secondarycolor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Text(displayOX[index],
                        style: GoogleFonts.coiny(color: AppColors.primarycolor,
                        fontSize: 62),),
                      ),
                    ),
                  );
                } ),
              ),
               
                 
              
            ),
            Expanded(
              child: 
            Text(winneris,
            style: GoogleFonts.coiny(
              color: Colors.white,
              fontSize: 40
            ))
            ),
            ElevatedButton.icon(onPressed: (){
             setState(() {
                for(int i=0;i<9;i++){
                
                displayOX[i]='';

              }
                   winneris='';
                  //  matchindex=[];


             });
                   filledbox=0;

            }, icon: Icon(Icons.restart_alt,color: AppColors.primarycolor), label: Text('Restart',
            style: GoogleFonts.coiny(color: AppColors.primarycolor),
            ),
            style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondarycolor
            ) ,)
          ],
        ),
      ),
    ),
   );
    
  }
}