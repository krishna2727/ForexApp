//
//  CurrencyConverterViewCOntrollerTests.swift
//  ForexAppTests
//
//  Created by fordlabs on 08/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import ForexApp

class CurrencyConverterViewCOntrollerTests: XCTestCase {
    
    var viewController: SecondViewController!

    override func setUp() {
        viewController = SecondViewController()
       mockNavgationController(rootViewController: viewController)
        viewController.viewDidLoad()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenViewControllerIsLoadedShouldDisplayOneLabelThreeTextFieldsAndButton() {
        
        XCTAssertNotNil(findLabelInSubviews(view: viewController.view, text: "Currency Coverter"))
        
         
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func findLabelInSubviews(view: UIView , text: String) -> UILabel? {
        
        for subview in view.subviews {
            
            if let label = subview as? UILabel,
                label.text == text {
                return label
            }
        }
     return nil
    }

class mockNavgationController : UINavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
}
