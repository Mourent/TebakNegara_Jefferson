//
//  ContentView.swift
//  TestW04
//
//  Created by Christian on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    @State private var angkaRandom = Int.random(in: 0...9)
    @State private var counter = 0
    @State private var simpanAngka: [Int] = []
    @State private var simpanJawaban:[Bool] = []
    @State private var showAlert = false
    @State private var trueCount:Int = 0
    @State private var finalScore:Int = 0
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack{
                Text("Pilih Bendera dari Negara : ")
                    .foregroundStyle(.black)
                Text(asean[angkaRandom])
                    .foregroundStyle(.black)
            }
        }
        
        HStack{
            Spacer()
            VStack{
                ForEach(0..<5) { number in
                    Button {
                        if number == angkaRandom{
                            simpanJawaban.append(true)
                        }
                        else{
                            simpanJawaban.append(false)
                        }
                        counter+=1
                        if counter == 10{
                            self.trueCount = simpanJawaban.filter { $0 == true }.count
                            self.finalScore = trueCount*10
                            showAlert = true
                        }
                        else {
                            gantiAngkaRandom()
                        }
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Your Final Score Is \n \(finalScore)"),
                            message: Text("Your correct answer was \(trueCount)/10"),
                            primaryButton: .default(
                                Text("Try Again"),
                                action: {
                                    resetApp()
                                }
                            ),
                            secondaryButton: .destructive(
                                Text("Exit"),
                                action: {
                                    exit(0)
                                }
                            )
                        )
                    }
                }
            }
            Spacer()
            VStack{
                ForEach(5..<10) { number in
                    Button {
                        if number == angkaRandom{
                            simpanJawaban.append(true)
                        }
                        else{
                            simpanJawaban.append(false)
                        }
                        counter+=1
                        if counter == 10{
                            self.trueCount = simpanJawaban.filter { $0 == true }.count
                            self.finalScore = trueCount*10
                            showAlert = true
                        }
                        else {
                            gantiAngkaRandom()
                        }
                    } label: {
                        
                        Image(asean[number])
                            .resizable()
                            .frame(width:105,height: 65)
                    }.alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Your Final Score Is \n \(finalScore)"),
                            message: Text("Your correct answer was \(trueCount)/10"),
                            primaryButton: .default(
                                Text("Try Again"),
                                action: {
                                    resetApp()
                                }
                            ),
                            secondaryButton: .destructive(
                                Text("Exit"),
                                action: {
                                    exit(0)
                                }
                            )
                        )
                    }
                }
            }
            Spacer()
        }
    }
    func gantiAngkaRandom(){
        simpanAngka.append(angkaRandom)
        
        repeat {
            angkaRandom = Int.random(in: 0...9)
        } while simpanAngka.contains(angkaRandom) 
    }
    func resetApp() {
        showAlert = false
        finalScore = 0
        trueCount = 0
        counter = 0
        simpanAngka = []
        simpanJawaban = []
        angkaRandom = Int.random(in: 0...9)
    }
}
#Preview {
    ContentView()
}


//VStack{
//    Button("Submit", role: .cancel ,action: printConsole)
//        .buttonStyle(.bordered)
//        
//    Button("Delete", role: .destructive){
//        alertShown = true
//    } .alert("BAHAYA", isPresented: $alertShown){
//        Button("Wah!", role: .cancel) {}
//        Button("Kabor!", role: .destructive) {}
//    } message: {
//        Text("Mangga dibaca")
//    }
//        .buttonStyle(.borderedProminent)
//        
//    
//    
//    Button{
//        print("Coba")
//    } label: {
//        Text("Compose")
//        Image(systemName: "mail")
//    }
//    .buttonStyle(.bordered)
//}
