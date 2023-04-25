/* CameraPillPreview.swift --> TextRecognition. Created by Miguel Torres on 24/04/23. */

import SwiftUI
import AVFoundation

struct CameraPillView: View {
    
    // Variable de estado, se declara por primera vez aquí.
    @StateObject private var cameraViewModel = CameraModel()
    @StateObject private var speeaches = SpeechManager()
    
    /// El cuerpo de la vista principal contiene una etiqueta o bien, la imagen tomada, un botón de tomar fotografía y las etiquetas del texto detectado.
    var body: some View {
        VStack {
            /// Si no se ha capturado ninguna imagen con la cámara, entonces se muestra el texto de instrucciones y el botón para tomar la fotografía
            if cameraViewModel.image != nil {
                // Imagen tomada por la cámara
                Image(uiImage: cameraViewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                // Texto que se va a leer.
                if let recognizedText = cameraViewModel.recognizedText {
                    Text("TEXTO: \(recognizedText)")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .onAppear {
                            speeaches.speak(recognizedText)
                            var lec = Lectura(texto: recognizedText)
                            lecturas.insert(lec, at: 0)
                        }
                    
                }
                
                Spacer() // - - -
                
                // Link de reinicio
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.black)
                        .frame(width: 50)
                }
            } else {
                Spacer() // - - -
                
                Text("Por favor, presiona el botón de la cámara para verificar tu medicina.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(20)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            speeaches.speak("Presiona al centro de la pantalla para activar la cámara y reconocer el texto de tu medicamento")
                        }
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
        .sheet(isPresented: $cameraViewModel.isPresentingImagePicker) {
            ImagePicker(sourceType: .camera, completionHandler: cameraViewModel.imagePickerCompletionHandler)
                .onAppear {
                    speeaches.stop()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        speeaches.speak("Camara activada, presiona al centro en la parte inferior de la pantalla para tomar la foto")
                    }
                }
        }
        .onDisappear {
            speeaches.stop()
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraPillView()
    }
}
