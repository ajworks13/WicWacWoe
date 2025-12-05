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
    @State private var box2 = "      "
    @State private var box3 = "      "
    @State private var box4 = "      "
    @State private var box5 = "      "
    @State private var box6 = "      "
    @State private var count: Int = 0
    
    @State private var buttonText = "Press This"

    
    
    var body: some View {
        
        Grid{
            GridRow{
                
//                ForEach(0..<3){ _ in
//                    ColorSquare(color: .pink)
        
              //  }
//                .frame(width:80, height:90)
//                .border(Color.blue, width: 4)
                
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
                
                //-------------------------------------------------------------
                
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


            }
            
            //--------------------------------------------
            GridRow{
                
                ForEach(0..<3){ _ in
                    ColorSquare(color: .pink)
                    
                }
            }
            //-------------------------------------------
            GridRow{
                
                ForEach(0..<3){ _ in
                    ColorSquare(color: .pink)
                    
                }
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
