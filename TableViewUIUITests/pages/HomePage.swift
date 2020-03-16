//
//  HomePage.swift
//  TableViewUIUITests
//
//  Created by Guihal Gwenn on 26/02/2020.
//  Copyright © 2020 Oui.sncf. All rights reserved.
//

import Foundation
import XCTest_Gherkin

final class HomeScreenStepDefiner: StepDefiner {

    let home = HomeScreenPageObject()
    
    override func defineSteps() {

        step("I'm on the home page") {}
        
        step("I see a (?>cell|section|label) named (.*)") { title in
            self.home.validateSectionTitle(title: title)
        }
        
        step("I scroll until I see a cell named (.*)") { title in
            self.home.scrollUntilVisible(title: title)
        }

    }

}

final class HomeScreenPageObject: PageObject {

    let app = XCUIApplication()

    class override var name: String {
        return "Home"
    }
    
    override func isPresented() -> Bool {
        return true
    }

    func validateSectionTitle(title: String) {
        let predicate = NSPredicate(format: "label CONTAINS[cd] %@", title)
        let cell = app.cells.matching(predicate).firstMatch
        guard cell.waitExistence() else {
            XCTFail("cell doesn't exist")
            return
        }
    }
    
    func scrollUntilVisible(title: String) {
        let predicate = NSPredicate(format: "label CONTAINS[cd] %@", title)
        let cell = app.cells.matching(predicate).firstMatch
        _ = app.swipeUpUntilVisible(element: cell)
    }
}

//class HomePage {
//
//    func scrollToBottom() -> HomePage {
//
//        guard let od = scenario.od else {
//            Fail(with: "Missing data : od is nil")
//            return Pages.Booking.quoteScreen
//        }
//
//        selectBookingTab()
//            .openBookingForm()
//            .chooseDepartureDestinationCities(departure: od.origin, destination: od.destination)
//            .openDatePicker()
//            .select(outwardDate: od.outward.bookingDate, inwardDate: od.inward?.bookingDate)
//
//        scenario.passengers.enumerated().forEach { idx, pax in
//            if !passengerCellExists(at: idx) {
//                addPassenger(pax)
//            }
//            updatePassenger(pax, at: idx)
//        }
//
//        selectConfortClass(od.outward.comfortClass)
//            .selectDirectPath(od.isDirectTravel)
//
//        return tapValidateButton()
//
//    }
//
//    @discardableResult
//    func updatePassenger(_ pax: Pax, at index: Int) -> Self {
//        openPassengerEdition(at: index)
//            .changeTypologyIfNeeded(to: pax.kind)
//            .changeCommercialCardIfNeeded(to: (pax as? Passenger)?.commercialCard)
//            .saveChange()
//        return self
//    }
//
//    @discardableResult
//    func addPassenger(_ pax: Pax) -> Self {
//        tapAddPaxCell()
//            .select(pax)
//        return self
//    }
//
//    func bookTravel(from departure: String,
//                    to destination: String,
//                    with outwardDate: Date, and inwardDate: Date? = nil,
//                    typology: PassengerType = .adult,
//                    commercialCard: CommercialCard? = nil,
//                    comfortClass: ComfortClass = .first,
//                    isPathDirect: Bool = false) -> QuoteScreen {
//        selectBookingTab()
//            .openBookingForm()
//            .chooseDepartureDestinationCities(departure: departure, destination: destination)
//            .openDatePicker()
//            .select(outwardDate: outwardDate, inwardDate: inwardDate)
//
//        let editPassengerScreen = openPassengerEdition(at: 0)
//            .changeTypology(to: typology)
//        if let commercialCard = commercialCard {
//            editPassengerScreen.changeCommercialCard(to: commercialCard)
//        }
//        editPassengerScreen.saveChange()
//
//        selectConfortClass(comfortClass)
//        selectDirectPath(isPathDirect)
//
//        return tapValidateButton()
//    }
//
//    func goToAccount() -> AccountOnBoardingScreen {
//        return selectAccountTab()
//    }
//}
//
//private extension HomeScreen {
//
//    enum Element {
//        case minimizedCell
//        case originCell
//        case passengersCollectionView
//        case passengerCell(index: Int)
//        case addPassengerCell
//
//        var identifier: String {
//            switch self {
//            case .minimizedCell:
//                return AccessibilityIdentifiers.bookingMinimizedCellIdentifier
//            case .originCell:
//                return AccessibilityIdentifiers.originIdentifier
//            case .passengersCollectionView:
//                return AccessibilityIdentifiers.passengersCollectionView
//            case .passengerCell(let index):
//                return String(format: AccessibilityIdentifiers.passengerCell, index)
//            case .addPassengerCell:
//                return AccessibilityIdentifiers.addPassengerCell
//            }
//        }
//    }
//
//    func selectBookingTab() -> HomeScreen {
//        app.selectBookingTab()
//        return self
//    }
//
//    func selectAccountTab() -> AccountOnBoardingScreen {
//           app.selectAccountTab()
//        return Pages.Account.onBoardingScreen
//    }
//
//    func openBookingForm() -> OdAutoCompletionScreen {
//        if !openOriginCell() {
//            // Minimized Booking Cell
//            let minimizedBookingCell = app.collectionViews.cells[Element.minimizedCell.identifier]
//            guard minimizedBookingCell.waitExistence() else {
//                Fail(with: "Missing minimized Booking Cell")
//                return Pages.Booking.odAutoCompletionScreen
//            }
//            minimizedBookingCell.tap()
//        }
//        return Pages.Booking.odAutoCompletionScreen
//    }
//
//    func openOriginCell() -> Bool {
//        //iOS 13 searchTextField is find as Button
//        //<iOS 13 searchTextField is find as Other element
//        let originCell = app.collectionViews.buttons[Element.originCell.identifier]
//        if originCell.waitExistence() {
//            originCell.tap()
//            return true
//        } else {
//            let originCellOther = app.collectionViews.otherElements[Element.originCell.identifier]
//            if originCellOther.waitExistence() {
//                originCellOther.tap()
//                return true
//            }
//        }
//        return false
//    }
//
//    func openDatePicker() -> DatePickerScreen {
//        let outwardDateButton = app.collectionViews.buttons[AccessibilityIdentifiers.outwardDateIdentifier]
//        outwardDateButton.tap()
//        return Pages.Commons.datePickerScreen
//    }
//
//    func passengerCellExists(at index: Int) -> Bool {
//        let collectionView = app.collectionViews[Element.passengersCollectionView.identifier]
//        _ = collectionView.swipe(.right, untilVisible: collectionView.cells.firstMatch)
//        let cell = collectionView.cells[Element.passengerCell(index: index).identifier]
//        return collectionView.swipe(.left, untilVisible: cell)
//    }
//
//    @discardableResult
//    func openPassengerEdition(at index: Int = 0) -> PassengerEditionScreen {
//        let collectionView = app.collectionViews[Element.passengersCollectionView.identifier]
//        _ = collectionView.swipe(.right, untilVisible: collectionView.cells.firstMatch)
//        let cell = collectionView.cells[Element.passengerCell(index: index).identifier]
//        guard collectionView.swipe(.left, untilVisible: cell)  else {
//            Fail(with: "Missing Passenger Cell")
//            return Pages.Commons.passengerEditionScreen
//        }
//        cell.tap()
//        return Pages.Commons.passengerEditionScreen
//    }
//
//    @discardableResult
//    func tapAddPaxCell() -> AddPassengerScreen {
//        let collectionView = app.collectionViews[Element.passengersCollectionView.identifier]
//        _ = collectionView.swipe(.right, untilVisible: collectionView.cells.firstMatch)
//        let cell = collectionView.cells[AccessibilityIdentifiers.addPassengerCell]
//        guard collectionView.swipe(.left, untilVisible: cell) else {
//            Fail(with: "Add Passenger Cell not found!")
//            return Pages.Commons.addPassengerScreen
//        }
//        cell.tap()
//        return Pages.Commons.addPassengerScreen
//    }
//
//    @discardableResult
//    func selectConfortClass(_ comfortClass: ComfortClass) -> Self {
//        let predicate = NSPredicate(format: "label == %@", comfortClass.accessibilityLabel)
//        let comfortClassSegment = app.segmentedControls[AccessibilityIdentifiers.comfortClassSegmentedControl]
//            .descendants(matching: .any)
//            .containing(predicate)
//            .element
//        guard comfortClassSegment.waitExistence() else {
//            Fail(with: "No segment \(comfortClass.accessibilityLabel) found!")
//            return self
//        }
//
//        guard !comfortClassSegment.isSelected else {
//            return self
//        }
//
//        comfortClassSegment.tap()
//        return self
//    }
//
//    @discardableResult
//    func selectDirectPath(_ direct: Bool) -> Self {
//        let predicate = NSPredicate(format: "label == %@", localize(booking_direct_path))
//        let directPathSwitch = app.switches.matching(predicate).element
//        guard directPathSwitch.waitExistence() else {
//            Fail(with: "The direct path switch not found!")
//            return self
//        }
//        guard directPathSwitch.isOn != direct else {
//            return self
//        }
//        directPathSwitch.tap()
//        return self
//    }
//
//    func tapValidateButton() -> QuoteScreen {
//        let validateButton = app.collectionViews.buttons[AccessibilityIdentifiers.validatePrimaryButton].firstMatch
//        guard validateButton.waitExistence() else {
//            Fail(with: "Missing validate button")
//            return Pages.Booking.quoteScreen
//        }
//        validateButton.tap()
//        return Pages.Booking.quoteScreen
//    }
//}
//
//fileprivate extension ComfortClass {
//    var accessibilityLabel: String {
//        switch self {
//        case .first:
//            return localize(common_first_class)
//        case .second:
//            return localize(common_second_class)
//        }
//    }
//}
