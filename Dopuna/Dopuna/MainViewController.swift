//
//  MainViewController.swift
//  Dopuna
//
//  Created by Test on 27.09.2016..
//  Copyright © 2016. Merima & Ena. All rights reserved.
//

import UIKit
import MessageUI


class MainViewController: UIViewController, ContactTableViewDelegate, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate {   // ovo sve naslijedi, OK
    
    var selectedPhoneNumber : String = ""   // ovo je da se izdvoji broj kad se ime tamo prikazuje, ono kad dodass ime i broj prikaze ti broj,kad dodas samo broj da ti to izdvoji kad se salje poruka za dopunu, na koji broj se salje dopuna

    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertContact.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        insertContact.layer.borderWidth = CGFloat(1.0)
        insertContact.layer.cornerRadius = 6
        
        mreza.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        mreza.layer.borderWidth = CGFloat(1.0)
        mreza.layer.cornerRadius = 8
        
        iznos.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        iznos.layer.borderWidth = CGFloat(1.0)
        iznos.layer.cornerRadius = 8
        
        dopuni.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).cgColor
        dopuni.layer.borderWidth = CGFloat(1.0)
        dopuni.layer.cornerRadius = 6
        
    }
    
    // Outlets
    
    @IBOutlet weak var insertContact: UIButton!
    
    @IBOutlet weak var mreza: UISegmentedControl!
    
    @IBOutlet weak var iznos: UISegmentedControl!
    
    @IBOutlet weak var dopuni: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: Actions
    
   
    @IBAction func dopuniRacun(_ sender: UIButton) {
        if !MFMessageComposeViewController.canSendText() {
            
            let alertController = UIAlertController(title: "Pažnja", message: "Ovaj uređaj ne može poslati poruku jer ne posjeduje SIM karticu.", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        } else {
            let composeVC = MFMessageComposeViewController()
            composeVC.delegate = self
            
            if mreza.selectedSegmentIndex == 0 {
                var iznosSplitted = iznos.titleForSegment(at: iznos.selectedSegmentIndex)?.components(separatedBy: "")  // ovo je izdvojena ona vrijednost bez KMposto vrati 2 KM npr, a nama treba samo vrijednostu  markama
                let odabraniIznos = iznosSplitted![0]  // ovo su marke
                
                composeVC.recipients = ["0651110"]
                composeVC.body = "D" + odabraniIznos + " 387" + selectedPhoneNumber
            } else {
                var iznosSplitted = iznos.titleForSegment(at: iznos.selectedSegmentIndex)?.components(separatedBy: "")
                let odabraniIznos = iznosSplitted![0]
                composeVC.recipients = ["0611171"]
                composeVC.body = odabraniIznos + " 387" + selectedPhoneNumber
            }
           
            
            self.present(composeVC, animated: true, completion: nil)
        }
        
    }
    @IBAction func odaberiMrezu(_ sender: UISegmentedControl) { // ovo ti mijenja vrijednosti na onom segmentu zavisno da li je mtel ili telecom
        if mreza.selectedSegmentIndex == 0 {
          
            iznos.setTitle("2 KM", forSegmentAt: 0)
            iznos.setTitle("3 KM", forSegmentAt: 1)
            iznos.setTitle("4 KM", forSegmentAt: 2)
            iznos.setTitle("5 KM", forSegmentAt: 3)
            iznos.setTitle("10 KM", forSegmentAt: 4)
            
        }
        if mreza.selectedSegmentIndex == 1 {
            iznos.setTitle("1 KM", forSegmentAt: 0)
            iznos.setTitle("2 KM", forSegmentAt: 1)
            iznos.setTitle("5 KM", forSegmentAt: 2)
            iznos.setTitle("10 KM", forSegmentAt: 3)
            iznos.setTitle("20 KM", forSegmentAt: 4)
        }
    }
    
    func didPressCellWithTitle(_ contact: Contact) {
        if contact.name == "" {
           insertContact.titleLabel?.text = "+387" + contact.phoneNumber
        } else {
            insertContact.titleLabel?.text = contact.name
        }
        selectedPhoneNumber = contact.phoneNumber  // evo to sto ti vrati, kontakt, ako ima samo broj samo broj ako ima ime ime gore pise  pratis li, PRATIM, STA DALJE IMA, AKO IMA, OSIM OVE DOLE FUNC GDJE POZIVA MESSAGE... STA JE DALJE?
        
        //PA AJD MI POSALJI OVAJ PROJEKAT DA CITAM KOMENTARE I RADIM  moze
        //AKO GDJE ZAPNEM PISAT CU TI AKO BUDE TU I AKO BUDES IMALA VREMENA
        
        // ostavit cu ukljuceno pa se javi :), samo da jos provjerim da nema sta
    }
        // ovo isto
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let contactTableViewController = segue.destination as? ContactTableViewController {
           contactTableViewController.delegate = self
        }
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
