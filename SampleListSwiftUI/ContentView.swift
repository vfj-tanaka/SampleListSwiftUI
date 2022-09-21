//
//  ContentView.swift
//  SampleListSwiftUI
//
//  Created by mtanaka on 2022/09/20.
//

import SwiftUI

struct Player: Identifiable {
    var id: Int
    let name: String
    let image: Image
}

struct ContentView: View {
    
    let players: [[Player]] = [
        [.init(id: 0, name: "James Harden", image: Image("def")),
         .init(id: 1, name: "Stephen Curry", image: Image("def")),
         .init(id: 2, name: "Lebron James", image: Image("def")),
         .init(id: 3, name: "田中　誠", image: Image("def")),
         .init(id: 4, name: "山田　太郎", image: Image("def"))],
        [.init(id: 0, name: "James Harden", image: Image("def")),
         .init(id: 1, name: "Stephen Curry", image: Image("def")),
         .init(id: 2, name: "Lebron James", image: Image("def")),
         .init(id: 3, name: "田中　誠", image: Image("def")),
         .init(id: 4, name: "山田　太郎", image: Image("def"))],
        [.init(id: 0, name: "James Harden", image: Image("def")),
         .init(id: 1, name: "Stephen Curry", image: Image("def")),
         .init(id: 2, name: "Lebron James", image: Image("def")),
         .init(id: 3, name: "田中　誠", image: Image("def")),
         .init(id: 4, name: "山田　太郎", image: Image("def"))]
    ]
    
    var body: some View {
        NavigationView() {
            List {
                ForEach(players.startIndex...(players.endIndex - 1), id: \.self) { section in
                    Section(header: Text(self.switchHeaderTitle(section: section))
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                    ) {
                        ForEach(self.players[section]) { player in
                            PlayerRow(player: player, generation: self.switchHeaderTitle(section: section))
                        }
                    }.frame(height: 70)
                }
            }.navigationTitle(Text("NBA Player"))
        }
    }
    
    func switchHeaderTitle(section: Int) -> String {
        switch section {
        case 0:
            return "1990s"
        case 1:
            return "2000s"
        case 2:
            return "2010s"
        default:
            return ""
        }
    }
}

struct PlayerRow: View {
    
    let player: Player
    let generation: String
    
    var body: some View {
        HStack {
            NavigationLink(destination: PlayerDetail(player: player, generation: generation)) {
                player.image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                Text(player.name)
                    .font(.headline)
                    .padding(.leading, 20)
            }
        }
    }
}

struct PlayerDetail: View {
    
    let player: Player
    let generation: String
    
    var body: some View {
        NavigationView {
            VStack {
                player.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 400, alignment: .top)
                    .cornerRadius(20)
                    .padding(.init(top: 0, leading: 50, bottom: 0, trailing: 50))
                HStack {
                    Text(player.name)
                        .font(.system(size: 30, weight: .heavy))
                        .padding(.top, -85)
                        .padding(.trailing, 20)
                        .foregroundColor(.white)
                }
                .frame(width: 400, height: 60, alignment: .trailing)
                HStack {
                    Text("Generation: ")
                        .font(.system(size: 30, weight: .medium))
                    Text(generation)
                        .font(.system(size: 40, weight: .heavy))
                        .padding(.leading, 30)
                }
                .frame(width: 400, height: 40, alignment: .leading)
                .padding(.leading, 20)
                    Spacer()
            }.padding(.top, 80)
        }.navigationBarTitle(Text("Player"), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
