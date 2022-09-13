//
//  PerguntasTableViewController.swift
//  Quiz
//
//  Created by Aluno on 10/09/22.
//

import UIKit

class PerguntasTableViewController: UITableViewController {
        
    var listaDePerguntas = Model.instance.listaPerguntas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Model.instance.listaPerguntas)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listaDePerguntas.count == 0 {
            print("caiu if")
            return 1
        } else {
            print("caiu else")
            return listaDePerguntas.count

        }
        // #warning Incomplete implementation, return the number of rows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "perguntas", for: indexPath)
        cell.textLabel!.text = ""
        if listaDePerguntas.count == 0 {
            cell.textLabel!.text = "Crie uma pergunta para começar!"
            print("caiu if cellRow")
        } else {
            cell.textLabel!.text = listaDePerguntas[indexPath.row].pergunta
            print("caiu else cellRow")

        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "vcCriarPergunta") as? EditarPerguntaViewController {
            if listaDePerguntas.count != 0 {
                vc.pergunta = listaDePerguntas[indexPath.row]
            }
            
            navigationController?.pushViewController(vc, animated: true)
            
        }
       
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
