//
//  NewExperienceViewController.swift
//  Experiences
//
//  Created by Enrique Gongora on 4/10/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NewExperienceViewController: UIViewController {
    
    // MARK: - Variables
    var experience: Experience!
    var expWithMedia: Experience!
    var coordinate: CLLocationCoordinate2D? {
        didSet {
            print(coordinate as Any)
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var addVideoRecordingButton: UIButton!
    @IBOutlet weak var addVoiceRecordingButton: UIButton!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .saveTapped, object: nil, queue: nil) { (catchNotification) in
            guard let addMediaExp = catchNotification.userInfo?[mediaAdded] else { return }
            self.experience = addMediaExp as? Experience
        }
        updateViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Functions
    func updateViews() {
        titleTextField.layer.borderWidth = 2.0
        titleTextField.layer.cornerRadius = 8
        titleTextField.layer.borderColor = #colorLiteral(red: 0.1850692332, green: 0.1410367489, blue: 0.7820795178, alpha: 1)
        addImageButton.layer.cornerRadius = 8
        addVideoRecordingButton.layer.cornerRadius = 8
        addVoiceRecordingButton.layer.cornerRadius = 8
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddImageSegue" {
            guard let imageVC = segue.destination as? AddImageViewController else { return }
            imageVC.experience = experience
        } else if segue.identifier == "AddVideoSegue" {
            guard let videoVC = segue.destination as? VideoRecordingViewController else { return }
            videoVC.experience = experience
        } else if segue.identifier == "AddAudioSegue" {
            guard let audioVC = segue.destination as? VoiceRecordingViewController else { return }
            audioVC.experience = experience
        }
    }
}
