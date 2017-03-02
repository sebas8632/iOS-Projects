//
//  ViewController.swift
//  Reconocimiento de Voz
//
//  Created by sebastian on 23/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit
import Speech


class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet var textView: UITextView!
    var audioRecordingSession : AVAudioSession!
    var audioRecorder : AVAudioRecorder!
    
    let audioFileName : String = "audio-recordered.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //recognizeSpeech()
        
        //Lanzar en un botón
        recordingAudioSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
     Metodo para reconocer audio y transcribirlo.
    */
    func recognizeSpeech(){
        
        // Se pide la autorización al usuario
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                
                //Se crea el recognizer y la petición.
                let recognizer = SFSpeechRecognizer()
                let request = SFSpeechURLRecognitionRequest(url: self.directoryURL()!)
                
                // Se realiza la tarea de reconocimiento.
                recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                    
                    if let error = error {
                        print("Algo ha ido mal: \(error.localizedDescription)")
                    }
                    else {
                        
                        // Se transcribe el resultado de esa tarea a una cadena de caracteres.
                        self.textView.text = String(describing: result?.bestTranscription.formattedString)
                    }
                    
                })
                
                
            }
        }
        
    }
    
    /*
        Metodo para configurar la grabación de audio
    */
    func recordingAudioSetup(){
        
        // Se instancia la sesión de audio.
        audioRecordingSession = AVAudioSession.sharedInstance()
        
        do {
            //Se define la categoria y se activa la sesión de audio grabación.
            try audioRecordingSession.setCategory(AVAudioSessionCategoryRecord)
            try audioRecordingSession.setActive(true)
            
            //Se realiza la petición al cliente.
            audioRecordingSession.requestRecordPermission({ (allowed:Bool) in
                
                if allowed {
                    //Hay que empezar a grabar pues tenemos permiso para hacerlo
                    self.startRecording()
                } else {
                    print("Necesito permisos para utilizar el micrófono")
                }
            })
            
            
        } catch {
            print("Ha habido un error al configurar el audio recorder")
        }
        
    }
    
    /*
     Metodo que permite crear la ruta de ficheros donde se guardara el audio grabado.
    */
    func directoryURL() -> URL?{
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0] as URL
        
        do {
        return try documentsDirectory.appendingPathComponent(audioFileName)
        } catch {
            print("No hemos podido crear la estructura de carpetas para guardar el audio")
        }
        return nil
    }
    
    
    func startRecording() {
        let settings : [String : Any] = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                        AVSampleRateKey: 12000.0,
                        AVNumberOfChannelsKey: 1 as NSNumber,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
        
        do {
            audioRecorder = try AVAudioRecorder(url: directoryURL()!, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector (self.stopRecording), userInfo: nil, repeats: false)
        } catch  {
            print("No se ha podido grabar el audio correctamente")
        }
    }
    
    func stopRecording(){
        audioRecorder.stop()
        audioRecorder = nil
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.recognizeSpeech), userInfo: nil, repeats: false)
    }
}

