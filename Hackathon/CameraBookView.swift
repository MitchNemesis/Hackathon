/* CameraBookView.swift --> TextRecognition. Created by BaymaxCoders on 24/04/23. */

import SwiftUI

struct CameraBookView: View {
    
    // Variable de estado, se declara por primera vez aquí.
    @StateObject private var cameraViewModel = CameraModel()
    
    /// El cuerpo de la vista principal contiene una etiqueta o bien, la imagen tomada, un botón de tomar fotografía y las etiquetas del texto detectado.
    var body: some View {
        VStack {
            HStack {
                // Link de retorno a la vista principal
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "house")
                        .font(.title2)
                        .foregroundColor(Color.black)
                        .padding()
                }
                Spacer()
            }
            /// Si no se ha capturado ninguna imagen con la cámara, entonces se muestra el texto de instrucciones y el botón para tomar la fotografía
            if cameraViewModel.image != nil {
                // Imagen de fondo mientras se lee el libro
                Image(uiImage: cameraViewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                // Texto que se va a leer.
                if let recognizedText = cameraViewModel.recognizedText {
                    Text("Leyendo...")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(10)
                }
                
                Spacer() // - - -
                
                // Link de reinicio
                NavigationLink(destination: CameraBookView()) {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        .frame(width: 50)
                }
            } else {
                Spacer() // - - -
                
                Text("Por favor, presiona el botón de la cámara para escanear una página completa de un libro")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    }
                
                Spacer() // - - -
                
                Button {
                    cameraViewModel.captureImage()
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        .frame(width: 150)
                        .padding(30)
                }
            }
        }
}

struct CameraBookView_Previews: PreviewProvider {
    static var previews: some View {
        CameraBookView()
    }
}
