//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Hüseyin Şimşek on 15.11.2021.
//

import UIKit
                                        // TableView Kullanmak İçin Dahil Et!!
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // Her tableview Kullanımında Yapılması gereken işlemler vardır..
    // Kullanabilmek için iki fonksiyon yaızlması gerkeiyor
    // hücre sayısı ve hücrelerde ne gösterilecek
    //
    @IBOutlet weak var tableView: UITableView!
    
    var superKahramanIsimleri = [String]()
    var superKahmramanGorselIsimleri  = [String]()
    // seçilen hücrenin isimleri aldım
    var secilenIsim = ""
    var secilenGorsel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Tablevviewi çalıştırmak için en son
        tableView.delegate = self
        tableView.dataSource = self
        
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("Ironman")
        superKahramanIsimleri.append("Spiderman")
        superKahramanIsimleri.append("Captain America")
        
        //var superKahramanGorselleri = [UIImage]()
        
        superKahmramanGorselIsimleri.append("batman")
        superKahmramanGorselIsimleri.append("superman")
        superKahmramanGorselIsimleri.append("ironman")
        superKahmramanGorselIsimleri.append("spiderman")
        superKahmramanGorselIsimleri.append("amerika")
        
    }

    // numberOfRowsInSection -> Kaç tane hücre gösterilecek
    // cellForRow atIndextPath -> hücrenin içerisinde neler gösterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()                // dizinin içindeki elemanları görmek için
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row]
        return cell
    }
    
    // editing Hücreleri silme için çağıralacak fonksiyon
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            // DİZİİMİZDEN SİLİYORUZ ASLINDA ÖNCE
            superKahramanIsimleri.remove(at: indexPath.row)
            superKahmramanGorselIsimleri.remove(at: indexPath.row)
            
            // DİZİMİZDEN SİLDİKTEN SONRA DA TABLEVİEWWİ GÜNCELLEMEK İÇİN
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
            
        }
    }
    // BİR HÜCRE SEÇİLDİĞİNDE NE YAPACAK ONUN İŞLEMİNİ YAZIYORUZ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // seçilen hücrenin isimleri aldım
        secilenIsim = superKahramanIsimleri[indexPath.row]
        secilenGorsel = superKahmramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVc"{
            let destinationVc = segue.destination as! DetailsViewController
            destinationVc.secilenKahramanIsmi = secilenIsim
            destinationVc.secilenKahramanGorselIsmi = secilenGorsel
        }
    }
}

