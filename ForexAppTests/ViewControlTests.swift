//
//  ViewControlTests.swift
//  ViewControlTests
//
//  Created by fordlabs on 08/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import ForexApp

class ViewControlTests: XCTestCase {
    
    var viewController:ViewController!

    override func setUp() {
        
        viewController = ViewController()
        
        MockNavigationController(rootViewController: viewController)
        viewController.viewDidLoad()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenViewControllerIsLoadedShouldDisplayOneLabelAndTwoButtons() {
        XCTAssertNotNil(findLabelInSubviews(from:viewController.view,text: "Forex"))
        XCTAssertNotNil(findButtonInSubviews(from: viewController.view, text: "Currency Converter"))
        
        XCTAssertNotNil(findButtonInSubviews(from: viewController.view, text: "ExchangeRate Calculator"))
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func findLabelInSubviews(from view: UIView, text: String) -> UILabel? {
        for subview in view.subviews {
            if let label = subview as? UILabel,
                label.text == text {
                return label
            }
        }
        return nil
    }
    
    func findButtonInSubviews(from view: UIView,text:String) -> UIButton? {
        
        for subview in view.subviews {
            
            if let button = subview as? UIButton,
                button.currentTitle == text {
                    
                    return button
                }
            }
          return nil
        }
    }




class MockNavigationController: UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
