import SwiftUI

struct ContentView: View {
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [isDayTime ? Color.blue: Color.black,
                                            Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing:30){
            
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    //.padding(.top, 60)
                
                VStack{
                    Image(systemName: isDayTime
                          ?"cloud.sun.fill"
                          :"moon.stars.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width:200,height: 100)
                    
                    Text("20°")
                        .font(.system(size:28))
                        .foregroundColor(.white)
                }
                
                HStack(spacing:20){
                    WeekDayView(dayName: "Mon", imageName: "cloud.sun.fill", degreeTemp:18 )
                    WeekDayView(dayName: "Tue", imageName: "cloud.sun.rain.fill", degreeTemp:12 )
                    WeekDayView(dayName: "Wed", imageName: "cloud.snow.fill", degreeTemp:1 )
                    WeekDayView(dayName: "Thu", imageName: "wind.snow", degreeTemp:5 )
                    WeekDayView(dayName: "cool day", imageName: "cloud.rain.fill", degreeTemp:5 )
                }
               
                
                Spacer()
                
                Button(action: {
                   isDayTime = !isDayTime
                }, label: {
                    Text("Change Day Time")
                    .foregroundColor(.blue)
                    .frame(width: 200,height: 50)
                    .background(.white)
                    .font(.system(size:20,weight: .bold))
                    .cornerRadius(5)
                })
                
                //Spacer()
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeekDayView: View {
    let dayName: String
    let imageName: String
    let degreeTemp: Int
    
    var body: some View {
        VStack{
            Text(dayName)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width:50,height: 50)
            
            Text("\(degreeTemp)°")
                .font(.system(size:28))
                .foregroundColor(.white)
        }
    
    }
}
