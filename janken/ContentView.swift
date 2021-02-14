import SwiftUI
 
struct ContentView: View {
    @State private var playerHand = 0
    @State private var computerHand = 0
    @State private var text = "じゃんけん"
    var body: some View {
        VStack {
            
            /** 顔 */
            Image("mario_face3")
                .resizable()
                .scaledToFit()

            /** 相手の手 */
            if(computerHand == 0) {
                Image("mario_gu")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            else if(computerHand == 1) {
                Image("mario_choki")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            else{
                Image("mario_pa")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            
            /** 文字 */
            Text(text)
                .font(.title)
            
            /** 自分の手 */
            if(playerHand == 0) {
                Image("gu")
                    .resizable()
                    .scaledToFit()
            } else if(playerHand == 1) {
                Image("choki")
                    .resizable()
                    .scaledToFit()
            } else if(playerHand == 2) {
                Image("pa")
                   .resizable()
                   .scaledToFit()
            }
            
            /** ボタン */
            HStack {
                Button(action: {
                    print("グー")
                    print(computerHand)
                    self.playerHand = 0;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                    
                }) {
                    Image("b_gu")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    print("チョキ")
                    self.playerHand = 1;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("b_choki")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
                Button(action: {
                    print("パー")
                    self.playerHand = 2;
                    self.computerHand = chooseComputerHand();
                    self.text = determineVictoryOrDefeat(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("b_pa")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}
 
func chooseComputerHand() -> Int {
    let random = Int.random(in: 0...2)
    let computerHand = random;
    return computerHand
}
 
func determineVictoryOrDefeat(playerHand:Int, computerHand:Int) -> String {
    var result = ""
    if (playerHand == computerHand) {
        result = "ぽん……あいこです";
    }
    else if ((playerHand == 0 && computerHand == 1) ||
                (playerHand == 1 && computerHand == 2) ||
                (playerHand == 2 && computerHand == 0))
    {
        result = "ぽん……あなたの勝ちです";
    }
    else {
        result = "ぽん……あなたの負けです";
    }
    return result
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
