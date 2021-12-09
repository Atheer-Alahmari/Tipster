//
//  ViewController.swift
//  Tipster
//
//  Created by Atheer Alahmari on 04/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showNo_Label: UILabel!
    // Tip%
    @IBOutlet weak var firstTip_Label: UILabel!
    @IBOutlet weak var secondTip_Label: UILabel!
    @IBOutlet weak var thirdTip_Label: UILabel!
    
    // rate of the No. entered
    @IBOutlet weak var rateValue1_Label: UILabel!
    @IBOutlet weak var rateValue2_Label: UILabel!
    @IBOutlet weak var rateValue3_Label: UILabel!
    
    // Total rate of the No. entered
    @IBOutlet weak var total_RateValue1_Label: UILabel!
    @IBOutlet weak var total_RateValue2_Label: UILabel!
    @IBOutlet weak var total_RateValue3_Label: UILabel!
    
    @IBOutlet weak var groupSize_Label: UILabel!
    
    // Slider
    @IBOutlet weak var tip_Slider: UISlider!
    @IBOutlet weak var groupSize_Slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
    @IBAction func pressNumber(_ sender: UIButton) {
        
        if  showNo_Label.text! == "0"{
            showNo_Label.text! = ""
        }
        
        let enterUser = sender.titleLabel?.text   // let enterUser = sender.tag

                switch enterUser {
                case "0" :  showNo_Label.text! += "0"
                          break
                case "1" : showNo_Label.text! += "1"
                           break
                case "2" : showNo_Label.text! += "2"
                            break
                case "3" : showNo_Label.text! += "3"
                            break
                case "4" : showNo_Label.text! += "4"
                            break
                case "5" : showNo_Label.text! += "5"
                            break
                case "6" : showNo_Label.text! += "6"
                            break
                case "7" : showNo_Label.text! += "7"
                            break
                case "8" : showNo_Label.text! += "8"
                            break
                case "9" : showNo_Label.text! += "9"
                            break
                case "c": showNo_Label.text! = "0"
                            break
                case "." : if showNo_Label.text!.contains("."){
                                return
                                         }
                                showNo_Label.text! += "."
                                break
                default  : showNo_Label.text! = "00.000"
                            break
                
       }
        calculation()
        
    }
    
    
   //----------------Slider Action-------------------
    
    @IBAction func slider_Tip(_ sender: UISlider) {
        
        firstTip_Label.text = String(format: "%2d%%", Int(tip_Slider.value))
        secondTip_Label.text = String(format: "%2d%%", Int(tip_Slider.value+5))
        thirdTip_Label.text = String(format: "%2d%%", Int(tip_Slider.value+10))
        
        calculation()
    }

    @IBAction func slider_GroupSize(_ sender: UISlider) {
        
        groupSize_Label.text = String(format: "Group Size: %2d%", Int(groupSize_Slider.value))
        
        calculation()
       
    }
    
    func calculation(){
        
        let firstTip  = (firstTip_Label.text! as NSString).doubleValue
        let secondTip  = (secondTip_Label.text! as NSString).doubleValue
        let thirdTip = (thirdTip_Label.text! as NSString).doubleValue

        let showNo = (showNo_Label.text! as NSString).doubleValue
        let groupSize = Double (Int(groupSize_Slider.value))
        
        
        rateValue1_Label.text = String(format: "%.2f%", (showNo * firstTip / 100) / groupSize)
        rateValue2_Label.text = String(format: "%.2f%", (showNo * secondTip / 100) / groupSize)
        rateValue3_Label.text = String(format: "%.2f%", (showNo * thirdTip / 100) / groupSize)

        total_RateValue1_Label.text = String(format: "%.2f%" , (showNo * firstTip / 100 + showNo)/groupSize)
        total_RateValue2_Label.text = String(format: "%.2f%" , (showNo * secondTip / 100 + showNo )/groupSize)
        total_RateValue3_Label.text = String(format: "%.2f%" , (showNo * thirdTip / 100 + showNo )/groupSize)

        
       
    }
}

