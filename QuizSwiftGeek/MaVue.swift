//
//  MaVue.swift
//  QuizSwiftGeek
//
//  Created by derdour ali on 18/10/2014.
//  Copyright (c) 2014 derdour ali. All rights reserved.
//
import UIKit
import Foundation



class MaVue:UIView {
    
    
    private let terminal = UIDevice.currentDevice()
    private let screen   = UIScreen.mainScreen()
    
    
    
    var app = QuestionsReponces()

    @IBOutlet var question: UITextView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var left: UIButton!
    @IBOutlet var right: UIButton!
    @IBOutlet var reponseButton: UIButton!
    
    @IBOutlet var reponseLabel: UILabel!
    @IBOutlet var reponse: UITextView!

    
    @IBOutlet var reponsesvues: UILabel!

    @IBOutlet var balaise: UILabel!
    
    @IBOutlet var myswitch: UISwitch!
    


override init (frame:CGRect){
    
    
    left = UIButton()
    //left.setTitle("left",forState: .Normal);
    left.setTitleColor(UIColor.blueColor(), forState: .Normal)
    left.setTitleColor(UIColor.whiteColor(), forState:.Selected)
    
    left.setImage(UIImage(named:"flecheGauche.png"), forState: .Normal);
    left.setImage(UIImage(named:"fleche-en-action.png"), forState: .Highlighted);
    
    
    right = UIButton()
    //right.setTitle("right",forState: .Normal);
    
    right.setImage(UIImage(named:"flecheDroite.png"), forState: .Normal);
    right.setImage(UIImage(named:"fleche-en-action.png"), forState: .Highlighted);
    
    
    reponseButton = UIButton()
    reponseButton.setTitle("Réponse",forState: .Normal);
    reponseButton.setTitle("",forState: .Highlighted);
    reponseButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
    
    questionLabel = UILabel()
    questionLabel.text = "La Question ;) ?";
    questionLabel.textAlignment = .Center
    
    
    question = UITextView()
    question.text = ""
    question.textAlignment = .Center
    question.userInteractionEnabled = false;
    
    reponseLabel = UILabel()
    reponseLabel.text = "La Réponse :) "
    reponseLabel.textAlignment = .Center
    
    reponse = UITextView()
    reponse.textColor = UIColor .greenColor()
    reponse.text = ""
    reponse.textAlignment = .Center
    reponse.userInteractionEnabled = false;
    
    reponsesvues = UILabel()
    reponsesvues.text = "Réponses vues : 0"
    reponsesvues.textAlignment = .Left
    
    
    balaise = UILabel()
    balaise.text = "Balaise"
    balaise.textAlignment = .Right
    
    
    myswitch = UISwitch()
    myswitch.setOn(false, animated: true)
    
    
    
    super.init(frame:frame)
    
    self.backgroundColor = UIColor .whiteColor()
    
    self.addSubview(left)
    self.addSubview(right)
    self.addSubview(reponseButton)
    self.addSubview(questionLabel)
    
    self.addSubview(question)
    self.addSubview(reponseLabel)
    
    self.addSubview(reponse)
    self.addSubview(reponsesvues)
    
    
    self.addSubview(balaise)
    
    self.addSubview(myswitch)
    
    left.addTarget(self, action: "left:", forControlEvents: .TouchUpInside)
    right.addTarget(self, action: "right:", forControlEvents: .TouchUpInside)
    reponseButton.addTarget(self, action: "reponse:", forControlEvents: .TouchUpInside)
    myswitch.addTarget(self, action: "myswitch:", forControlEvents: .TouchUpInside)

}

required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override func drawRect(rect: CGRect) {
    
    var x = 20
    var y = 20
    
    
    left.frame = CGRectMake(CGFloat(x),CGFloat(y),60,60);
    
    
    right.frame = CGRectMake(CGFloat(rect.size.width-80),CGFloat(y),60,60);
    
    
    
    reponseButton.frame = CGRectMake(CGFloat((rect.size.width/2)-100),CGFloat(y+15),200,30);
    
    
    y += 80
    
    questionLabel.frame = CGRectMake(CGFloat((rect.size.width/2)-100),CGFloat(y),200,30);
    
    y += 40
    
    question.frame = CGRectMake(CGFloat((rect.size.width/2)-150),CGFloat(y),300,80);
    
    y += 50
    
    reponseLabel.frame = CGRectMake(CGFloat((rect.size.width/2)-100),CGFloat(y),200,30);
    
    
    y += 40
    
    reponse.frame = CGRectMake(CGFloat((rect.size.width/2)-150),CGFloat(y),300,80);
    
    
    
    if(terminal.userInterfaceIdiom == UIUserInterfaceIdiom.Pad){
        y += 80
    }else{
        y = Int(rect.size.height-50)
        x = 20
    }
    
    reponsesvues.frame = CGRectMake(CGFloat(x),CGFloat(y),200,30);
    
    
    x = Int(rect.size.width-20-50)
    myswitch.frame = CGRectMake(CGFloat(x),CGFloat(y),50,30);
    
    x -= 110
    balaise.frame = CGRectMake(CGFloat(x),CGFloat(y),100,30);
    
    
    
    
    updateMyView()
}


func updateMyView(){
    if app.getQuiz()[app.getIndex()].balaise {
        question.textColor = UIColor .redColor()
    }else{
        question.textColor = UIColor .blueColor()
    }
    
    question.text = app.getQuiz()[app.getIndex()].q
    
    if app.getQuiz()[app.getIndex()].visited {
        //reponse.textColor = UIColor .greenColor()
        reponse.text = app.getQuiz()[app.getIndex()].r
    }else{
        
        reponse.text = ""
    }
    
    reponsesvues.text = "Réponses vues : "+"\(app.getNbrV())"
    
}

@IBAction func left(sender: UIButton) {
    
    var cond = true
    while cond {
        if app.getIndex() > 0 {
            app.setIndex(app.getIndex()-1);
        }else{
            app.setIndex(app.getQuiz().count-1);
        }
        
        if myswitch.on{
            cond = false
        }else{
            if !app.getQuiz()[app.getIndex()].balaise {
                cond = false
            }
        }
        
    }
    updateMyView()
}

@IBAction func right(sender: UIButton) {
    
    var cond = true
    while cond {
        if app.getIndex() == app.getQuiz().count-1 {
            app.setIndex(0);
        }else{
            app.setIndex(app.getIndex()+1);
        }
        
        if myswitch.on{
            cond = false
        }else{
            if !app.getQuiz()[app.getIndex()].balaise {
                cond = false
            }
        }
    }
    updateMyView()
}

@IBAction func myswitch(sender: UISwitch) {
    
    if(!myswitch.on && app.getQuiz()[app.getIndex()].balaise){
        right(right);
    }
    
}
@IBAction func reponse(sender: UIButton) {
    if !app.getQuiz()[app.getIndex()].visited {
        app.setQquizVisited(app.getIndex());
        app.setNbrV(app.getNbrV()+1);
        updateMyView()
    }
}


}