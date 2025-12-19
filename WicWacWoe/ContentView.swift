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

    
struct CustomAlert: View{
    var body:some View{
        VStack(alignment: .leading) {
            
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .foregroundColor(Color.red)
                    .frame(width: 30,height: 30)
                
                Text("Alert !")
                    .fontWeight(.bold)
                    .font(.title)
                    .font(.title)
                
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            Text("Something went Wrong... Try Again.")
                .font(.subheadline)
                .padding(30)
            
        }
        .background(Color.white)
        .cornerRadius(20)
        
    }
}


struct ColorSquare: View {
    let color: Color
    
    var body: some View {
        color
        .frame(width: 110, height: 100)
    }
}

struct Popup<Content: View>: View {

    @Binding var isPresented: Bool
    let content: Content
    let dismissOnTapOutside: Bool

    private let buttonSize: CGFloat = 24

    var body: some View {

        ZStack {

            Rectangle()
                .fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if dismissOnTapOutside {
                        withAnimation {
                            isPresented = false
                        }
                    }
                }

            content
                .frame(
                    width: UIScreen.main.bounds.size.width - 100, height: 300)
                .padding()
                .padding(.top, buttonSize)
                .background(.white)
                .cornerRadius(12)
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        withAnimation {
                            isPresented = false
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                    })
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundStyle(Color.gray.opacity(0.7))
                    .padding(.all, 8)
                }
        }
        .ignoresSafeArea(.all)
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height,
            alignment: .center
        )
    }
        
}

extension Popup {

    init(isPresented: Binding<Bool>,
         dismissOnTapOutside: Bool = true,
         @ViewBuilder _ content: () -> Content) {
        _isPresented = isPresented
        self.dismissOnTapOutside = dismissOnTapOutside
        self.content = content()
    }
}


struct ContentView: View {
    
    @State private var box1 = " "
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
    
    @State private var show = false
    
    @State private var showingPopover = false
    
    @State private var presentPopup = false
    
    

    func takingTurns() -> String{
        countForTurns += 1
        
        if(countForTurns % 2 == 0){
            return "O"

        }else{
            return "X"
        }
        
        
    }
    
    func winnerPopUp() -> some View{
        ZStack{
            
            
            VStack{
                Text("Winner")
            }
            
        }
        
    }

    
    func referee(b1: String = "",
                 b2: String = "",
                 b3: String = "",
                 b4: String = "",
                 b5: String = "",
                 b6: String = "",
                 b7: String = "",
                 b8: String = "",
                 b9: String = ""
    ){
        
        
        var row1 = [b1,b2,b3]
        var row2 = [b4,b5,b6]
        var row3 = [b7,b8,b9]
        
                
        if(row1[0] == "X"){
            box2 = "P"
            
            let _ = self.winnerPopUp()
            presentPopup = true

            var body: some View {
                    ZStack {
                        Button {
                            withAnimation(.linear(duration: 0.3)) {
                                presentPopup = true
                            }
                        } label: {
                            Text("Present Pop-up Dialog")
                        }
                        if presentPopup {
                            Popup(isPresented: $presentPopup) {
                                Text("something")
                            }
                        }
                    }
                }
            //-----------------------------------------------
            
        }
        
    }
    
    
    var body: some View {
        let _ = print("hi")
      //  winnerPopUp()
        
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
                    referee(b1: box1)
                    
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
