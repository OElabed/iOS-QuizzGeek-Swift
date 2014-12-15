//
//  QuestionsReponses.swift
//  quizSwift
//
//  Created by m2sar on 10/10/14.
//  Copyright (c) 2014 m2sar. All rights reserved.
//

import Foundation


class QuestionsReponces{
    
    
    private var quiz:[(balaise:Bool,visited:Bool,q:String,r:String)] = [
        (false,false,"Je porte des lunettes mais je n'y vois rien. Qui suis-je ?","Le nez"),
        (false,false,"J'ai quelque chose dans ma poche mais ma poche est vide.","Un trou"),
        (true,false,"3 poissons sont dans un seau. l'un meurt. combien en reste-t-il ?","3 ! parce que meme si il est mort il est resté dans le seau"),
        (false,false,"Qu'est ce qui peut traverser une vitre sans jamais la briser ?","Les rayons du soleil"),
        (true,false,"Comment faire 12 avec trois fois le chiffre 1 ?","Faites 11 + 1 = 12 :D "),
        (true,false,"je suis noir, je deviens rouge, et je finis blanc..,","Le charbon"),
        (true,false,"Je parle toutes les langues et j'ai tout le temps la tête à l'envers. Qui suis-je ?","Un stylo")]
    
    private var nbrv = 0
    private var index = 0
    
    init(){
        
    }
    
    
    func getQuiz()->[(balaise:Bool,visited:Bool,q:String,r:String)] {
        return quiz;
    }
    
    
    func setQquizVisited(pindex:Int){
        quiz[pindex].visited = true;
    }
  
    func getIndex()-> Int{
        return index;
    }
    
    func setIndex(s:Int){
        index = s;
    }

    func setNbrV(v:Int){
        nbrv = v;
    }
    
    func getNbrV()->Int{
        return nbrv;
    }
    
    
}