//
//  MemoriesCollectionViewController.swift
//  GloryDays
//
//  Created by sebastian on 25/01/17.
//  Copyright © 2017 nhvm. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import Speech

import MobileCoreServices
import CoreSpotlight

private let reuseIdentifier = "cell"

class MemoriesCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, AVAudioRecorderDelegate, UISearchBarDelegate{
    

    var memories : [URL] = []
    var filterMemories : [URL] = []
    var currentMemory : URL!
    
    var audioPlayer : AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var recordingURL : URL!
    
    var searchQuery : CSSearchQuery?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.recordingURL = try? getDocumentsDirectory().appendingPathComponent("memory-recording.m4a")
        
        self.loadMemories()
        
        
        
        // Se agrega el boton "Agregar" en la barra de navegación y lo redirige al metodo .addImagePressed.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addImagePressed))
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Se chequea que se hayan dado los permisos para utilizar las librerias de fotos, audio y reconocimiento de voz
        self.checkForGrantedPermissions()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
     Metodo que permite revisar si se autorizo el uso de librerias de audio, fotos y reconocimiento de voz
     */
    func checkForGrantedPermissions() {
        
        let photosAuth : Bool = PHPhotoLibrary.authorizationStatus() == .authorized
        let recordingAuth : Bool = AVAudioSession.sharedInstance().recordPermission() == .granted
        let transcriptionAuth : Bool = SFSpeechRecognizer.authorizationStatus() == .authorized
        
        let authorized = photosAuth && recordingAuth && transcriptionAuth
        
        if !authorized {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ShowTerms"){
                navigationController?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    /*
     Metodo que permite obtener la dirección en sistema del directorio donde se guardaran los archivos.
     */
    func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            
            let documentsDirectory = paths[0]
            
            return documentsDirectory
        }
        
    /*
    Metodo que permite cargar los archivos desde el directorio hacía la vista
    */
    func loadMemories() {
            
            self.memories.removeAll()
            
            guard let files = try? FileManager.default.contentsOfDirectory(at: getDocumentsDirectory(), includingPropertiesForKeys: nil, options: []) else {
                return
            }
            
            for file in files {
                
                let fileName = file.lastPathComponent
                
                if fileName.hasSuffix(".thumb") {
                    let noExtension = fileName.replacingOccurrences(of: ".thumb", with: "")
                    
                  if  let memoryPath =  try? getDocumentsDirectory().appendingPathComponent(noExtension)
                    {
                   
                        //memories.append(memoryPath)
                        filterMemories.append(memoryPath)
                    }
                }
                
            }
            collectionView?.reloadSections(IndexSet(integer:1))
            
        }
        

    /*
     Metodo que permite presentar la view donde se mostrarán los recuerdos disponibles para ser seleccionados
     posteriormente.
    */
    func addImagePressed() {
        
        let vc = UIImagePickerController()
        vc.modalPresentationStyle = .formSheet
        vc.delegate = self
        navigationController?.present(vc, animated: true )
        
    }
    /*
     Función que permite realizar una acción despues de darle clic a una imagen.
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let theImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.addNewMemory(image: theImage)
            self.loadMemories()
            
            dismiss(animated: true)
        }
        
    }
    
    /*
     Metodo que permite agregar una nueva imagen al directorio de archivos
    */
    func addNewMemory(image: UIImage){
        
        let memoryName = "memory-\(Date().timeIntervalSince1970)"
        
        
        let imageName = "\(memoryName).jpg"
        let thumbName = "\(memoryName).thumb"
        
        do {
            
            let imagePath =  getDocumentsDirectory().appendingPathComponent(imageName)
            
            if let jpegData = UIImageJPEGRepresentation(image, 80){
               
                try jpegData.write(to: imagePath, options: [.atomicWrite])
            }
            
            if let thumbail = resizeImage(image: image, to: 200) {
                let thumbPath = try getDocumentsDirectory().appendingPathComponent(thumbName)
                
                if let jpegData = UIImageJPEGRepresentation(image, 80){
                    try jpegData.write(to: thumbPath, options: [.atomicWrite])
                }
            }
        }
        catch {
            print("Ha fallado la escritura en disco")
        }
    }
    
    /*
    Metodo que permite cambiarle el tamaño a la imagen.
    */
    func resizeImage (image: UIImage, to width:CGFloat) ->UIImage? {
        let scaleFactor = width / image.size.width
        
        let height = image.size.height * scaleFactor
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0)
        image.draw(in: CGRect(x: 0, y:0, width: width, height: height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    //Metodos para obtener la url de los diferentes tipos de archivo.
    
    func imageURL (for memory: URL) -> URL {
        return try! memory.appendingPathExtension("jpg")
    }
    
    func thumbnailURL (for memory: URL) -> URL {
        return try! memory.appendingPathExtension("thumb")
    }
    
    func audioURL (for memory: URL) -> URL {
        return try! memory.appendingPathExtension("m4a")
    }
    
    func transcriptionURL (for memory: URL) -> URL {
        return try! memory.appendingPathExtension("txt")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if section == 0 {
            return 0
        } else {
            //return self.memories.count
            return self.filterMemories.count
        }
        
    }

     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemoryCell
        
        //let memory = self.memories[indexPath.row]
        let memory = self.filterMemories[indexPath.row]
        let memoryName = self.thumbnailURL(for: memory).path
        let image = UIImage(contentsOfFile: memoryName)
        
        cell.imageView.image = image
    
        if cell.gestureRecognizers == nil {
            
            let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.memoryLongPressed))
            recognizer.minimumPressDuration = 0.3
            cell.addGestureRecognizer(recognizer)
            
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 4
            cell.layer.cornerRadius = 10
        }
        
        
        // Configure the cell
    
        return cell
    }
    
    /*
     Función que permite hacer una acción en un memory cuando se inicia la presión sobre una cell y cuando se termina la presión.
     */
    func memoryLongPressed(sender: UILongPressGestureRecognizer){
        
        if sender.state == .began {
            let cell = sender.view as! MemoryCell
            
            if let index = collectionView?.indexPath(for: cell) {
                self.currentMemory = self.memories[index.row]
                
                self.startRecordingMemory()
            }
            
        }
        
        if sender.state == .ended {
            self.finishRecordingMemory(success: true)
        }
    
    }
    /*
     Función que permite iniciar la grabación
     */
    func startRecordingMemory(){
        
        audioPlayer?.stop()
        

        collectionView?.backgroundColor = UIColor(red: 0.6, green: 0.0, blue: 0.0, alpha: 1.0)
        
        let recordingSession = AVAudioSession.sharedInstance()
        
        do{
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try recordingSession.setActive(true)
            
            let recordingSettings = [ AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
                                      AVSampleRateKey : 44100,
                                      AVNumberOfChannelsKey : 2,
                                      AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
            
            ]
            
            audioRecorder = try AVAudioRecorder(url: recordingURL, settings: recordingSettings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
            
        } catch let error {
            print(error)
            finishRecordingMemory(success: false)
        }
    
    }
    
    /*
     Función que finaliza la grabación en el recuerdo.
     */
    func finishRecordingMemory (success: Bool) {
       
        collectionView?.backgroundColor = UIColor(red: 97.0/255.0, green: 86.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        
        audioRecorder?.stop()
        
        if success {
            
            do {
                let memoryAudioURL = try self.currentMemory.appendingPathExtension("m4a")
                
                let fileManager = FileManager.default
                
                if fileManager.fileExists(atPath: memoryAudioURL.path) {
                     try fileManager.removeItem(at: memoryAudioURL)
                }
                
                try fileManager.moveItem(at: recordingURL, to: memoryAudioURL)
                
                self.transcribeAudioToText(memory: self.currentMemory)
            }
            
            catch let error {
                print("Ha habido un error \(error)")
            }
        }
        
    }
    
    func transcribeAudioToText(memory: URL) {
        
        let audio = audioURL(for: memory)
        let transcription = transcriptionURL(for: memory)
        
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: audio)
        
        recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
            
            guard let result = result else{
                print("Ha habido el siguiente error: \(error)")
                return
            }
            
            if result.isFinal {
                let text = result.bestTranscription.formattedString
                
                do {
                    
                    try text.write(to: transcription, atomically: true, encoding: String.Encoding.utf8)
                    self.indexMemory(memory: memory, text: text)
                }
                catch {
                    print("Ha habido un error al guardar la transcripción")
                }
            }
        }
        )
        
        
    }
    
    
    func indexMemory(memory: URL, text: String){
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = "Recuerdo de Glory Days"
        attributeSet.contentDescription = text
        attributeSet.thumbnailURL = thumbnailURL(for: memory)
        
        let item = CSSearchableItem(uniqueIdentifier: memory.path, domainIdentifier: "com.juanSebastianFlorez", attributeSet: attributeSet)
        
        item.expirationDate = Date.distantFuture
        
        
        CSSearchableIndex.default().indexSearchableItems([item]) { (error) in
            
            if let error = error {
                print("Ha habiado un problema al indexar: \(error)")
            }else {
                print("Hemos podido indexar el texto: \(text)")
            }
            
        }
        
        
    }
    
    /*
     Metodo que permite utilizar el header
     */
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        return header
    }
    
    
    /*
     Función que permite dar la anchura y altura de cada una de las secciones del collectionViewController
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0  {
            return CGSize(width: 0, height: 50)
        } else {
            return CGSize.zero
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      //  let memory = self.memories[indexPath.row]
            let memory = self.filterMemories[indexPath.row]
        
        let fileManager = FileManager.default
        
        do {
            let audioName = audioURL(for: memory)
            let transcriptionName = transcriptionURL(for: memory)
            
            if fileManager.fileExists(atPath: transcriptionName.path){
                self.audioPlayer = try AVAudioPlayer(contentsOf: audioName)
                self.audioPlayer?.play()
            }
            
            if fileManager.fileExists(atPath: transcriptionName.path) {
                let contents = try String(contentsOf: transcriptionName)
                print(contents)
            }
            
        }
        
        catch {
            print("Error al cargar el audio para reproducir")
        }
        
        
    }
    
    func filterMemories(text: String){
        
        guard text.characters.count > 0 else {
            self.filterMemories = self.memories
            
            UIView.performWithoutAnimation {
                collectionView?.reloadSections(IndexSet(integer: 1))
            }
            return
        }
        
        var allTheItems : [CSSearchableItem] = []
        self.searchQuery?.cancel()
        
        let queryString = "contentDescription == \"*\(text)*\"c"
        
        self.searchQuery = CSSearchQuery(queryString: queryString, attributes: nil)
        
        self.searchQuery?.foundItemsHandler = { items in
            allTheItems.append(contentsOf: items)
        
        }
        
        self.searchQuery?.completionHandler = { error in
            DispatchQueue.main.async { [unowned self] in
                self.activateFilter(matches: allTheItems)
                
            }
        }
        self.searchQuery?.start()
    }
    
    func activateFilter(matches: [CSSearchableItem]) {
        self.filterMemories = matches.map({ item in
            let uniqueiD = item.uniqueIdentifier
            let url = URL(fileURLWithPath: uniqueiD)
            return url
        })
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterMemories(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


}
