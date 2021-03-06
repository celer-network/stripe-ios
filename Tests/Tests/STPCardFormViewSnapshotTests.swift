//
//  STPCardFormViewSnapshotTests.swift
//  StripeiOS Tests
//
//  Created by Cameron Sabol on 10/29/20.
//  Copyright © 2020 Stripe, Inc. All rights reserved.
//

import FBSnapshotTestCase

@testable import Stripe

class STPCardFormViewSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        //        recordMode = true
    }

    func testEmpty() {
        let formView = STPCardFormView()
        formView.countryCode = "US"
        formView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 225))

        FBSnapshotVerifyView(formView)
    }

    func testIncomplete() {
        let formView = STPCardFormView()
        formView.countryCode = "US"
        formView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 265))

        formView.numberField.text = "4242"
        formView.numberField.textDidChange()
        formView.cvcField.text = "123"
        formView.cvcField.textDidChange()

        FBSnapshotVerifyView(formView)
    }

    // valid expiration date will change over time so we just test without it
    func testCompleteWithoutExpiry() {
        let formView = STPCardFormView()
        formView.countryCode = "US"
        formView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 225))

        formView.numberField.text = "4242424242424242"
        formView.numberField.textDidChange()
        formView.cvcField.text = "123"
        formView.cvcField.textDidChange()
        formView.postalCodeField.text = "12345"

        FBSnapshotVerifyView(formView)
    }

    func testEmptyHiddenPostalCode() {
        let formView = STPCardFormView()
        formView.countryCode = "AE"
        formView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 225))

        FBSnapshotVerifyView(formView)
    }

    func testWithFullBillingDetails() {
        let formView = STPCardFormView(billingAddressCollection: .required)
        formView.countryCode = "US"
        formView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 400))

        FBSnapshotVerifyView(formView)
    }

}
