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
           // .frame(width:120, height:80)
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
            .padding(.init(top: 10, leading: 90, bottom: 10, trailing: 90))
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(color)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    @State private var box1 = "      "
    @State private var box2 = "      "
    @State private var box3 = "      "
    @State private var box4 = "      "
    @State private var box5 = "      "
    @State private var box6 = "      "
    @State private var count: Int = 0
    
    @State private var buttonText = "Press This"

    
    
    var body: some View {
        
        
        
        VStack{
            
            Button(action: {
                // Action to perform
            }) {
                HStack {
                    Image(systemName: "rectangle.grid.1x2.fill")
                    Text("Button with Image")
                }
        
            }
            .buttonStyle(NavigationButtonStyle(color: .purple))

            
            Text("Count: \(count)")
            Button(action: {
                count += 1
                buttonText = "X"
            }) {
                Text("\(buttonText)")
            }
            .buttonStyle(DynamicButtonStyle())
            .frame(width:220, height:180)
            .background(Color.pink)


            
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
