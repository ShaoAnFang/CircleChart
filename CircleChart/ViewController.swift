//
//  ViewController.swift
//  CircleChart
//
//  Created by rd on 2018/11/2.
//  Copyright © 2018年 Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chartView: NLCircleBarChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.backgroundColor = UIColor.black
        chartView.customColorSet(colors: [UIColor(red: 0/255.0, green: 221.0/255.0, blue: 255.0/255.0, alpha: 1),
                                          UIColor(red: 247.0/255.0, green: 89.0/255.0, blue: 168.0/255.0, alpha: 1),
                                          UIColor(red: 255.0/255.0, green: 187.0/255.0, blue: 0/255.0, alpha: 1),
                                          UIColor(red: 120.0/255.0, green: 118.0/255.0, blue: 254.0/255.0, alpha: 1),
                                          UIColor(red: 0/255.0, green: 255.0/255.0, blue: 221.0/255.0, alpha: 1),
                                          UIColor(red: 255.0/255.0, green: 117.0/255.0, blue: 133.0/255.0, alpha: 1),
                                          UIColor(red: 252.0/255.0, green: 149.0/255.0, blue: 64.0/255.0, alpha: 1),
                                          UIColor(red: 166.0/255.0, green: 88.0/255.0, blue: 243.0/255.0, alpha: 1),
                                          UIColor(red: 93.0/255.0, green: 134.0/255.0, blue: 239.0/255.0, alpha: 1)])
        
        let testAnsString = """
        [{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[7]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[3]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[4]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[4]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[7]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[3]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[3]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[9]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[4]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[4]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[4]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[1]],"No":"10"},{"Ans":"No","Name":"范姜文成","GNo":"5","OptSelect":[[1],[2]],"No":"10"}]
        """
        let testChartString = """
        {
        "stu": \(testAnsString),
        "CorrectAns": "1",
        "Opts": [
        "Option1",
        "Option2",
        "Option3",
        "Option4"
        ]
        }
        """
        self.repliedDataParsing(data: HITChartState(jsonString: testChartString)!)
    }

    func repliedDataParsing(data: HITChartState) {
        //        guard let correctAnsString = data.correctAns,
        //            let correctAns = Int(correctAnsString) else {
        //                return
        //        }
        let options = data.options
        var answersSum: [Int] = []
        var availableAnswersCount = 0
        var notAvailableAnswersCount = 0
        var noAnswerCount = 0
        for _ in 0..<options.count {
            answersSum.append(0)
        }
        for reply in data.answerInfos {
            if let finalAnswer = reply.optionSelected.last?.last {
                if finalAnswer <= options.count {
                    availableAnswersCount += 1
                    answersSum[finalAnswer - 1] += 1
                } else {
                    notAvailableAnswersCount += 1
                }
            } else {
                noAnswerCount += 1
            }
        }
        var chartDatas: [ChartData] = []
        for i in 0..<options.count {
            let optionName = options[i]
            let optionSelectedCount = answersSum[i]
            chartDatas.append(ChartData(name: optionName, value: CGFloat(optionSelectedCount)))
        }
        let testLabel = UILabel()
        testLabel.text = "\(availableAnswersCount)/\(data.answerInfos.count)"
        testLabel.frame = CGRect(x: 0, y: 0, width: chartView.availableContentWidth * 0.9, height: 16)
        testLabel.adjustsFontSizeToFitWidth = true
        testLabel.minimumScaleFactor = 0.3
        let fontSize = testLabel.font.pointSize
        let contentString = NSMutableAttributedString(string: "\(availableAnswersCount)/\(data.answerInfos.count)", attributes: [.font : UIFont(name: "Helvetica", size: fontSize)!, .foregroundColor : UIColor.white])
        let availableCountLength = String(availableAnswersCount).count
        let totalCountLength = String(data.answerInfos.count).count
        contentString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Helvetica", size: fontSize * 0.6)!, range: NSMakeRange(availableCountLength + 1, totalCountLength))
        self.redrawCircleBarChart(dataSet: chartDatas, title: "作答人數", content: contentString)
//        availableCountLabel.text = "\(availableAnswersCount)"
//        notAvailableCountLabel.text = "\(notAvailableAnswersCount)"
//        noAnswerCountLabel.text = "\(noAnswerCount)"
    }
    func redrawCircleBarChart(dataSet: [ChartData] , title: String?, content: NSAttributedString?) {
        chartView.drawChart(withDataSet: dataSet, colorSet: nil, title: title, content: content, textColor: UIColor.white)
    }
    
}

protocol Mappable: Codable {
    init?(jsonString: String)
}

extension Mappable {
    init?(jsonString: String) {
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        do {
            self = try JSONDecoder().decode(Self.self, from: data)
        } catch {
            return nil
        }
    }
}


class HITChartState: NSObject, Mappable {
    var answerInfos: [HITStudentReplyInfo] = []
    var correctAns: String!
    var options: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case answerInfos = "stu";
        case correctAns = "CorrectAns";
        case options = "Opts";
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        answerInfos = try values.decode([FailableDecodable<HITStudentReplyInfo>].self, forKey: .answerInfos).compactMap{$0.base}
        correctAns = try values.decode(String.self, forKey: .correctAns)
        options = try values.decode([String].self, forKey: .options)
    }
}

class FailableDecodable<Base: Decodable> : Decodable {
    let base: Base?
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}


class HITStudentReplyInfo: NSObject, Mappable {
    var name: String!
    var no: String!
    var groupNo: String!
    var optionSelected: [[Int]] = []
    var answer: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name";
        case no = "No";
        case groupNo = "GNo";
        case optionSelected = "OptSelect";
        case answer = "Ans"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        no = try values.decode(String.self, forKey: .no)
        groupNo = try values.decode(String.self, forKey: .groupNo)
        optionSelected = try values.decode([[Int]].self, forKey: .optionSelected)
        answer = try values.decode(String.self, forKey: .answer)
    }
}
