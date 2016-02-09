//
//  ViewController.swift
//  GoogleAdMobView
//
//  Created by RANBIJAY KUMAR on 09/02/16.
//  Copyright (c) 2016 SaturnMob. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, UITextFieldDelegate, GADBannerViewDelegate, GADInterstitialDelegate {
    
    var interstitialAd : GADInterstitial!
    
    @IBOutlet weak var GoogleBannerView: GADBannerView!
    
    @IBAction func showAd(sender: AnyObject) {
        
        if self.interstitialAd.isReady {
            self.interstitialAd.presentFromRootViewController(self)
        }
    }
    
    func reloadInterstitialAd() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.loadRequest(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.interstitialAd = reloadInterstitialAd()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        GoogleBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GoogleBannerView.rootViewController = self
        GoogleBannerView.loadRequest(GADRequest())
        
        // Requests test ads on test devices.
        self.interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        request.testDevices = ["2077ef9a63d2b398840261c8221a0c9b"]
        self.interstitialAd.loadRequest(request)
        self.interstitialAd = reloadInterstitialAd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

