
import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    
    var soundPlayer = AVAudioPlayer()
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "note\(sender.tag)", withExtension: "wav") else {
            print("url not found")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            player!.play()
            
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
    
}

