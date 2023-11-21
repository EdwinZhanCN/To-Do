//
//  NoItemsView.swift
//  ToDo
//
//  Created by 詹子昊 on 11/20/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? create some tasks!")
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.indigo : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 40 : 50)
                .shadow(
                    color: animate ? Color.indigo.opacity(0.7) :
                            Color.accentColor.opacity(0.7),
                    radius: 10,x:0, y: animate ? 10 : 5)
                .scaleEffect(animate ? 1.03 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    ///use navigation stack
    NavigationView{
        NoItemsView()
            .navigationTitle("Title")
    }
}
