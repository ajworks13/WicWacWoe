//
//  ContentView.swift
//  WicWacWoe
//
//  Created by Macbook on 10/30/25.
//

import SwiftUI

struct DynamicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.red : Color.blue)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}


struct NavigationButtonStyle: ButtonStyle {
    init(color: Color = .blue) {
        self.color = color
    }
    let color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.init(top: 20, leading: 30, bottom: 20, trailing: 30))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
                    
    }
}



struct ColorSquare: View {
    let color: Color
    
    var body: some View {
        color
        .frame(width: 110, height: 100)
    }
}


struct ContentView: View {
    
    @State var box1 = " "
    @State private var box2 = " "
    @State private var box3 = " "
    @State private var box4 = " "
    @State private var box5 = " "
    @State private var box6 = " "
    @State private var box7 = " "
    @State private var box8 = " "
    @State private var box9 = " "

    @State private var countForTurns: Int = 0
    
    @State private var buttonText = "Press This"
    

    func takingTurns() -> String{
        countForTurns += 1
        
        if(countForTurns % 2 == 0){
            return "O"

        }else{
            return "X"
        }
        
        
    }
    
    func referee(b1: String,
                 b2: String,
                 b3: String,
                 b4: String,
                 b5: String,
                 b6: String,
                 b7: String,
                 b8: String,
                 b9: String
    ){
        
        
        var row1 = [b1,b2,b3]
        var row2 = [b4,b5,b6]
        var row3 = [b7,b8,b9]
        
        if(row1[0] == "X"){
            box2 = "P"
        }
        
    }
    
    
    var body: some View {
        let _ = print("hi")

        
        Grid{
            GridRow{// ---------            GRID 1
                
//                ForEach(0..<3){ _ in
//                    ColorSquare(color: .pink)
        
              //  }
//                .frame(width:80, height:90)
//                .border(Color.blue, width: 4)
                
                // create local prviate immutable variable for selected options between X or O.
                
                Button(action: {
                    // Action to perform
                    // box1 = "X"
                
                    box1 = takingTurns()
                    referee(answers: box1)
                    
//                    if(box1.contains("O")){
//                        button.is
//                    }
                    
                    let box1Imut = box1
                    #if DEBUG
                    print(box1Imut)
                    #endif

                }) {
                    HStack {
                        Text("\(box1)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)

                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box1 == "O" || box1 == "X" ? true : false)
                

                
                //-------------------------------------------------------------
                
                Button(action: {
                    // Action to perform
                    box2 = takingTurns()

                }) {
                    HStack {
                        Text("\(box2)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box2 == "O" || box2 == "X" ? true : false)

                
                //-------------------------------------------------------------
                
                Button(action: {
                    // Action to perform
                    box3 = takingTurns()

                }) {
                    HStack {
                        Text("\(box3)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box3 == "O" || box3 == "X" ? true : false)



            }
            
            GridRow{// ------------               GRID 2
                
                Button(action: {
                    // Action to perform
                    box4 = takingTurns()

                }) {
                    HStack {
                        Text("\(box4)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box4 == "O" || box4 == "X" ? true : false)

                
                
                
                
                Button(action: {
                    // Action to perform
                    box5 = takingTurns()

                }) {
                    HStack {
                        Text("\(box5)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box5 == "O" || box5 == "X" ? true : false)

                
                
                
                
                Button(action: {
                    // Action to perform
                    box6 = takingTurns()

                }) {
                    HStack {
                        Text("\(box6)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box6 == "O" || box6 == "X" ? true : false)

            }


            GridRow{ // -------------            GRID 3
                
                Button(action: {
                    // Action to perform
                    box7 = takingTurns()

                }) {
                    HStack {
                        Text("\(box7)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box7 == "O" || box7 == "X" ? true : false)

                
                
                
                Button(action: {
                    // Action to perform
                    box8 = takingTurns()

                }) {
                    HStack {
                        Text("\(box8)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box8 == "O" || box8 == "X" ? true : false)

                
                
                
                
                Button(action: {
                    // Action to perform
                    box9 = takingTurns()

                }) {
                    HStack {
                        Text("\(box9)")
                            .font(.custom("biggestText", size: 110))
                            .border(Color.red, width: 4)
                            .frame(width:80, height:90)


                    }
            
                }
                .buttonStyle(NavigationButtonStyle(color: .purple))
               // .frame(maxWidth: 90)
                .border(Color.orange, width: 4)
                .fixedSize()
                .disabled(box9 == "O" || box9 == "X" ? true : false)

            }
        }
        
            
        
        //--------------------------------------------------------------
        
        HStack{
            
            
            Button(action: {
                // Action to perform
                box1 = "X"

            }) {
                HStack {
                    Text("\(box1)")
                        .font(.custom("biggestText", size: 110))
                        .border(Color.red, width: 4)
                        .frame(width:80, height:90)


                }
        
            }
            .buttonStyle(NavigationButtonStyle(color: .purple))
           // .frame(maxWidth: 90)
            .border(Color.orange, width: 4)
            .fixedSize()
            
            //------------------------------------------------
            
            Button(action: {
                // Action to perform
                box2 = "X"

            }) {
                HStack {
                    Text("\(box2)")
                        .font(.custom("biggestText", size: 110))
                        .border(Color.red, width: 4)
                        .frame(width:80, height:90)


                }
        
            }
            .buttonStyle(NavigationButtonStyle(color: .purple))
           // .frame(maxWidth: 90)
            .border(Color.orange, width: 4)
            .fixedSize()
            
            //-------------------------------------------------
            
            Button(action: {
                // Action to perform
                box1 = "X"

            }) {
                HStack {
                    Text("\(box1)")
                        .font(.custom("biggestText", size: 110))
                        .border(Color.red, width: 4)
                        .frame(width:80, height:90)


                }
        
            }
            .buttonStyle(NavigationButtonStyle(color: .purple))
           // .frame(maxWidth: 90)
            .border(Color.orange, width: 4)
            .fixedSize()
            
            //------------------------------------------------
            
            Button(action: {
                // Action to perform
                box1 = "X"

            }) {
                HStack {
                    Text("\(box1)")
                        .font(.custom("biggestText", size: 110))
                        .border(Color.red, width: 4)
                        .frame(width:80, height:90)


                }
        
            }
            .buttonStyle(NavigationButtonStyle(color: .purple))
           // .frame(maxWidth: 90)
            .border(Color.orange, width: 4)
            .fixedSize()

            
//            Text("Count: \(count)")
//            Button(action: {
//                count += 1
//                buttonText = "x"
//            }) {
//                Text("\(buttonText)")
//            }
//            .buttonStyle(DynamicButtonStyle())
//            .frame(width:220, height:180)
//            .background(Color.pink)


            
            
        }
        .frame(maxWidth: 360, maxHeight: 500)
        .border(Color.blue, width: 4)
        


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
