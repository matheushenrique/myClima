//
//  ClimaVC
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/1/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit

class ClimaVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cidadeLbl: UILabel!
    @IBOutlet weak var climaAtualLbl: UILabel!
    @IBOutlet weak var climaAtualImg: UIImageView!
    @IBOutlet weak var tbView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbView.delegate = self
        tbView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "climaCell", for: indexPath)
        return cell
    }

}

