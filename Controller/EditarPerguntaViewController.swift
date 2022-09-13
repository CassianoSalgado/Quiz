//
//  EditarPerguntaViewController.swift
//  Quiz
//
//  Created by Cassiano Carradore Salgado on 12/09/22.
//

import UIKit

class EditarPerguntaViewController: UIViewController {
    
    @IBOutlet weak var perguntaLabel: UITextField!

    @IBOutlet var alternativasLabel: [UITextField]!
    
    @IBOutlet weak var respostaCorretaLabel: UITextField!

    
    var pergunta: Perguntas?
    var contador = 0
    var perguntaNova = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let pergunta = pergunta else {
            perguntaLabel.placeholder = "Escreva sua pergunta!"
            respostaCorretaLabel.placeholder = "Escreva sua resposta"
            for alternativa in alternativasLabel {
                alternativa.placeholder = "Escreva uma alternativa"
                
            }
            perguntaNova = true
            return
            
        }
        perguntaLabel.text = pergunta.pergunta
        
        for alternativa in alternativasLabel {
            alternativa.text = pergunta.alternativas[contador]
            contador += 1
        }
        respostaCorretaLabel.text = pergunta.resposta
        
    }
    
    @IBAction func salvarItens(_ sender: Any) {
        if perguntaNova {
            let alternativas: [String] = [alternativasLabel[0].text!, alternativasLabel[1].text!]
            
            let novaQuestao = Perguntas(pergunta: perguntaLabel.text!, alternativas: alternativas, resposta: respostaCorretaLabel.text!)
            
            Model.instance.listaPerguntas.append(novaQuestao)
            perguntaNova = false
            return
        } else {
            var arrayDePerguntas = [String]()
            
            for pergunta in Model.instance.listaPerguntas {
                arrayDePerguntas.append(pergunta.pergunta)
            }
            
            if let index = arrayDePerguntas.firstIndex(of: perguntaLabel.text!) {
                var model = Model.instance.listaPerguntas[index]
                model.pergunta = perguntaLabel.text!
                model.alternativas[0] = alternativasLabel[0].text!
                model.alternativas[1] = alternativasLabel[1].text!
                model.resposta = respostaCorretaLabel.text!
                print(model)
            }
        }
    }
}
