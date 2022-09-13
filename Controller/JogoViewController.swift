//
//  JogoViewController.swift
//  Quiz
//
//  Created by Aluno on 10/09/22.
//

import UIKit

class JogoViewController: UIViewController {
    @IBOutlet weak var visorPontuacao: UILabel!
    @IBOutlet weak var visorPergunta: UILabel!
    @IBOutlet var botaoAlternativas: [UIButton]!
    
    
    var contador = 0
    var pontos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sorteaPergunta()
    }
    
    func sorteaPergunta() {
        if Model.instance.listaPerguntas.count == 0 {
            visorPergunta.text = "Crie uma pergunta!"
            for alternativa in botaoAlternativas {
                alternativa.titleLabel?.text = "Crie uma alternativa"

            }
        } else if Model.instance.listaPerguntas.count >= contador {
            let pergunta = Model.instance.listaPerguntas[contador]
            visorPergunta.text = pergunta.pergunta
            botaoAlternativas[0].titleLabel?.text = pergunta.alternativas[0]
            botaoAlternativas[1].titleLabel?.text = pergunta.alternativas[1]
            botaoAlternativas[2].titleLabel?.text = pergunta.resposta
            
        }
    }
    
    @IBAction func acerto(_ sender: UIButton) {
        if Model.instance.listaPerguntas.count != 0 {
            sorteaPergunta()
            let pergunta = Model.instance.listaPerguntas[contador]
            print(sender.titleLabel!.text!)
            if sender.titleLabel!.text! == pergunta.resposta {
                pontos += 1
                contador += 1
                visorPontuacao.text = String(pontos)

                if Model.instance.listaPerguntas.count > contador {
                    sorteaPergunta()
                } else {
                    visorPergunta.text = "Parabéns"
                    for alternativa in botaoAlternativas {
                    alternativa.titleLabel?.text = "Parabéns"
                    }
                }
            }
        } else {
            visorPergunta.text = "Crie uma pergunta!"
            for alternativa in botaoAlternativas {
            alternativa.titleLabel?.text = "Crie uma alternativa"
            }
        }
            
    }
}

