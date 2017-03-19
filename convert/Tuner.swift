//
//  Tuner.swift
//  convert
//
//  Created by Mayank Daswani on 2/20/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import AudioKit

protocol TunerDelegate {
    /**
     * The tuner calls this delegate function when it detects a new pitch. The
     * Pitch object is the nearest note (A-G) in the nearest octave. The
     * distance is between the actual tracked frequency and the nearest note.
     * Finally, the amplitude is the volume (note: of all frequencies).
     */
    func tunerDidMeasurePitch(_ pitch: Pitch, withDistance distance: Double,
                              amplitude: Double)
}

class Tuner: NSObject {
    
    var delegate: TunerDelegate?
    
    /* Private instance variables. */
    fileprivate var timer:      Timer?
    fileprivate let microphone: AKMicrophone
    fileprivate let analyzer:   AKAudioAnalyzer
    
    override init() {
        /* Start application-wide microphone recording. */
        AKManager.shared().enableAudioInput()
        
        print("recording now..")
        
        
        /* Add the built-in microphone. */
        microphone = AKMicrophone()
        AKOrchestra.add(microphone)
        
        /* Add an analyzer and store it in an instance variable. */
        analyzer = AKAudioAnalyzer(input: microphone.output)
        AKOrchestra.add(analyzer)
    }
    
    func startMonitoring() {
        /* Start the microphone and analyzer. */
        analyzer.play()
        microphone.play()
        
        /* Initialize and schedule a new run loop timer. */
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self,
                                     selector: #selector(Tuner.tick),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func stopMonitoring() {
        analyzer.stop()
        microphone.stop()
        timer?.invalidate()
    }
    
    func tick() {
        /* Read frequency and amplitude from the analyzer. */
        let frequency = Double(analyzer.trackedFrequency.floatValue)
        let amplitude = Double(analyzer.trackedAmplitude.floatValue)
        
        /* Find nearest pitch. */
        let pitch = Pitch.nearest(frequency)
        
        /* Calculate the distance. */
        let distance = frequency - pitch.frequency
        
        /* Call the delegate. */
        self.delegate?.tunerDidMeasurePitch(pitch, withDistance: distance,
                                            amplitude: amplitude)
    }


}
