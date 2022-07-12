# ComplexDialogs

Example usage:
```
struct ContentView: View {
    @State var isPresented = false
    @State var color = Color.green
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("This is a Test")
                .foregroundColor(.white)
        }.padding(20)
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .presentDialog(isPresented: $isPresented, bodyContent: {
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
                Text("Red Color")
                Spacer()
            }.dialogAction {
                color = .red
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.blue)
                Text("Blue Color")
                Spacer()
            }.dialogAction {
                color = .blue
            }
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
                Text("Green Color")
                Spacer()
            }.dialogAction {
                color = .green
            }
        }, cancelContent: {
            HStack {
                Spacer()
                Text("Cancel")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }.dialogAction {
            }
        })
    }
}
```
