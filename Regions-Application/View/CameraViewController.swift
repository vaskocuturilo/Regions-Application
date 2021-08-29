//
//  CameraViewController.swift
//  Regions-Application
//
//  Created by Anton Smirnov on 17.08.2021.
//

import UIKit
import Vision
import VisionKit

class CameraViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var scanButton = ScanButton(frame: .zero)
    private var scanImageView = ScanImageView(frame: .zero)
    private var ocrTextView = OcrTextView(frame: .zero, textContainer: nil)
    
    private var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    
    private var json = JsonLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureOCR()
        
        let backBTN = UIBarButtonItem(image: UIImage(named: "Image"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        title = "Recognition car plate"
    }
    
    private func configure() {
        
        view.addSubview(scanButton)
        view.addSubview(scanImageView)
        view.addSubview(ocrTextView)
        
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            scanButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            scanButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            scanButton.heightAnchor.constraint(equalToConstant: 50),
            
            ocrTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            ocrTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            ocrTextView.bottomAnchor.constraint(equalTo: scanButton.topAnchor, constant: -padding),
            ocrTextView.heightAnchor.constraint(equalToConstant: 200),
            
            scanImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            scanImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            scanImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            scanImageView.bottomAnchor.constraint(equalTo: ocrTextView.topAnchor, constant: -padding)
        ])
        
        scanButton.addTarget(self, action: #selector(scanPlate), for: .touchUpInside)
    }
    
    
    @objc
    private func scanPlate() {
        
        let scanVC = VNDocumentCameraViewController()
        scanVC.delegate = self
        present(scanVC, animated: true)
    }
    
    private func configureOCR() {
        ocrRequest = VNRecognizeTextRequest { (request, error)in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var ocrText = ""
            
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else {return}
                
                ocrText += topCandidate.string + "\n"
                
            }
            
            DispatchQueue.main.async { [self] in
                
                let result = ocrText.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted)
                
                json.scanRegionForRussia(resource: "russiaPerson", textView: ocrTextView, text: result)
                
                self.scanButton.isEnabled = true
            }
        }
        
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
        ocrRequest.usesLanguageCorrection = true
        
    }
    
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else {return}
        
        ocrTextView.text = ""
        scanButton.isEnabled = false
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        do {
            try requestHandler.perform([self.ocrRequest])
        } catch let error {
            print(error)
        }
    }
}

extension CameraViewController: VNDocumentCameraViewControllerDelegate {
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            
            return
        }
        
        scanImageView.image = scan.imageOfPage(at: 0)
        processImage(scan.imageOfPage(at: 0))
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}
